// Layout shifts of a page on a fresh visit (no localStorage), mobile 412x823 like Lighthouse:
// each shift with its value, time and the moved elements (selector, previous / current rect).
// Usage: node cls.mjs <url> [width height]
import { createRequire } from 'node:module';

const require = createRequire(import.meta.url);
const { chromium } = require('/home/node/.npm/_npx/411d535eabdf86de/node_modules/playwright-core');
const [url, w = '412', h = '823'] = process.argv.slice(2);
const browser = await chromium.launch({ executablePath: '/ms-playwright/chromium-1254/chrome-linux64/chrome', args: ['--no-sandbox'] });
const context = await browser.newContext({ viewport: { width: Number(w), height: Number(h) }, deviceScaleFactor: 1 });
const page = await context.newPage();
page.setDefaultTimeout(30000);
await page.addInitScript(() => {
  if (true) { new MutationObserver((m, o) => { if (document.head) { const x = document.createElement("meta"); x.name = "header-overlay"; x.content = "always"; document.head.append(x); o.disconnect(); } }).observe(document, { childList: true, subtree: true }); }
  window.__shifts = [];
  const sel = (n) => {
    if (!n || !n.tagName) return String(n?.nodeName || '');
    const parts = [];
    for (let e = n; e && e.tagName && parts.length < 4; e = e.parentElement) {
      parts.unshift(`${e.tagName.toLowerCase()}${e.id ? `#${e.id}` : ''}${e.classList.length ? `.${[...e.classList].slice(0, 2).join('.')}` : ''}`);
    }
    return parts.join(' > ');
  };
  new PerformanceObserver((list) => {
    list.getEntries().forEach((e) => {
      if (e.hadRecentInput) return;
      window.__shifts.push({
        value: Math.round(e.value * 1000) / 1000,
        t: Math.round(e.startTime),
        sources: (e.sources || []).map((s) => ({ node: sel(s.node), prev: [s.previousRect.y, s.previousRect.height], cur: [s.currentRect.y, s.currentRect.height] })),
      });
    });
  }).observe({ type: 'layout-shift', buffered: true });
});
await page.goto(url, { waitUntil: 'load', timeout: 60000 });
await page.waitForTimeout(6000);
const result = await page.evaluate(() => ({
  shifts: window.__shifts,
  total: window.__shifts.reduce((s, x) => s + x.value, 0),
  navHeight: getComputedStyle(document.body).getPropertyValue('--nav-height'),
  headerHeight: getComputedStyle(document.documentElement).getPropertyValue('--header-height'),
  reserved: getComputedStyle(document.body).getPropertyValue('--header-reserved'),
  headerBox: document.querySelector('header')?.getBoundingClientRect().height,
  overlay: document.documentElement.dataset.headerOverlay || '',
}));
console.log(JSON.stringify(result, null, 1));
await context.close();
await browser.close();
