// axe-core (WCAG 2.0 / 2.1 / 2.2 A and AA rules) on pages at 1440 and 375 px, one page at a time.
// Usage: node axe.mjs <out.json> <url> [url ...]
import { createRequire } from 'node:module';
import { readFileSync, writeFileSync } from 'node:fs';

const require = createRequire(import.meta.url);
const { chromium } = require('/home/node/.npm/_npx/411d535eabdf86de/node_modules/playwright-core');
const AXE = readFileSync('/tmp/audit-tools/node_modules/axe-core/axe.min.js', 'utf8');
const [out, ...urls] = process.argv.slice(2);
const browser = await chromium.launch({ executablePath: '/ms-playwright/chromium-1254/chrome-linux64/chrome', args: ['--no-sandbox'] });
const results = {};
for (const url of urls) {
  for (const width of [1440, 375]) {
    const context = await browser.newContext({ viewport: { width, height: 900 } });
    const page = await context.newPage();
    page.setDefaultTimeout(30000);
    try {
      await page.goto(url, { waitUntil: 'load', timeout: 60000 });
      // the lazy sections, header and footer
      await page.evaluate(async () => { for (let y = 0; y < document.body.scrollHeight; y += 600) { window.scrollTo(0, y); await new Promise((r) => { setTimeout(r, 150); }); } window.scrollTo(0, 0); });
      await page.waitForTimeout(2000);
      await page.addScriptTag({ content: AXE });
      const r = await page.evaluate(() => window.axe.run(document, { runOnly: { type: 'tag', values: ['wcag2a', 'wcag2aa', 'wcag21a', 'wcag21aa', 'wcag22aa'] } }));
      results[`${url} @${width}`] = r.violations.map((v) => ({ id: v.id, impact: v.impact, tags: v.tags.filter((t) => t.startsWith('wcag')), count: v.nodes.length, sample: v.nodes.slice(0, 3).map((n) => n.target.join(' ')) }));
    } catch (e) {
      results[`${url} @${width}`] = { error: String(e).slice(0, 200) };
    }
    await context.close();
  }
}
await browser.close();
writeFileSync(out, JSON.stringify(results, null, 1));
Object.entries(results).forEach(([k, v]) => console.log(k, Array.isArray(v) ? v.map((x) => `${x.id}(${x.impact},${x.count})`).join(' ') || 'no violations' : v.error));
