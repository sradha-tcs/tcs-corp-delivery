# Quality review, 22 November 2026: Core Web Vitals and accessibility reports

These are the measurements of the quality review of the TCS Corporate website: code repository [sradha-tcs/tcs-corp](https://github.com/sradha-tcs/tcs-corp), fixes in PR [#265](https://github.com/sradha-tcs/tcs-corp/pull/265), merged as `51885b3`. The review's decisions are KB-D-074 (data layer and Web SDK readiness) and KB-D-075 (WCAG 2.2 AA).

**Measured:**
- **before:** `main` on aem.live (`3996bfd`)
- **after:** the PR's feature preview `feature-quality-audit` on aem.page

All values are lab measurements from one machine: Lighthouse 12 with simulated throttling, axe-core 4 (WCAG 2.0, 2.1 and 2.2, A and AA) and a Chromium layout-shift trace. They are **not** field data (CrUX or RUM), and no screen-reader or real-device test was done.

| Folder | Contents |
|---|---|
| [`lighthouse/baseline/`](lighthouse/baseline), [`lighthouse/after/`](lighthouse/after) | Lighthouse of 4 pages, mobile and desktop: HTML reports (open them in a browser) and the raw JSON |
| [`lighthouse/repeat/`](lighthouse/repeat) | 3 mobile runs each of the hero page on main and on the branch (aem.page), to show the noise |
| [`axe/`](axe) | axe-core results at 1440 and 375 px, before, after, and on the local preview |
| [`cls/`](cls) | Layout-shift traces of a first visit (412 x 823 px, no localStorage), with and without the `header-overlay` metadata |
| [`tools/`](tools) | The scripts that produced them (`measure.sh`, `summary.py`, `axe.mjs`, `cls.mjs`, `cls-meta.mjs`, `repeat.sh`) |

## Core Web Vitals and Lighthouse (before → after)

Scores out of 100. LCP and FCP are in seconds, TBT in milliseconds. Before is aem.live and after is aem.page, so the server response times differ.

| Page | Mode | Performance | Accessibility | Best practices | SEO | LCP | CLS | TBT | FCP | Reports |
|---|---|---|---|---|---|---|---|---|---|---|
| [home](https://main--tcs-corp--sradha-tcs.aem.live/design-block-master/en/curated-design-pages/home) | mobile | 94 → 94 | 97 → 97 | 100 → 100 | 61 → 61 | 1.50 → 1.59 | 0.109 → 0.109 | 78 → 18 | 1.28 → 1.34 | [before](lighthouse/baseline/lh-home-mobile.html) · [after](lighthouse/after/lh-home-mobile.html) |
| [home](https://main--tcs-corp--sradha-tcs.aem.live/design-block-master/en/curated-design-pages/home) | desktop | 98 → 98 | 96 → 97 | 100 → 100 | 61 → 61 | 0.48 → 0.53 | 0.093 → 0.094 | 0 → 2 | 0.38 → 0.41 | [before](lighthouse/baseline/lh-home-desktop.html) · [after](lighthouse/after/lh-home-desktop.html) |
| [press](https://main--tcs-corp--sradha-tcs.aem.live/design-block-master/en/block-library/templates/press-release-template) | mobile | 96 → 97 | 98 → 98 | 100 → 100 | 69 → 69 | 1.70 → 1.56 | 0.103 → 0.103 | 18 → 7 | 1.26 → 1.24 | [before](lighthouse/baseline/lh-press-mobile.html) · [after](lighthouse/after/lh-press-mobile.html) |
| [press](https://main--tcs-corp--sradha-tcs.aem.live/design-block-master/en/block-library/templates/press-release-template) | desktop | 99 → 98 | 98 → 98 | 100 → 100 | 69 → 69 | 0.51 → 0.50 | 0.079 → 0.093 | 0 → 2 | 0.36 → 0.39 | [before](lighthouse/baseline/lh-press-desktop.html) · [after](lighthouse/after/lh-press-desktop.html) |
| [hero](https://main--tcs-corp--sradha-tcs.aem.live/design-block-master/en/block-library/hero/hero-overview) | mobile | 94 → 91 | 100 → 100 | 100 → 100 | 69 → 69 | 1.68 → 1.68 | 0.109 → 0.109 | 154 → 260 | 1.23 → 1.23 | [before](lighthouse/baseline/lh-hero-mobile.html) · [after](lighthouse/after/lh-hero-mobile.html) |
| [hero](https://main--tcs-corp--sradha-tcs.aem.live/design-block-master/en/block-library/hero/hero-overview) | desktop | 98 → 98 | 100 → 100 | 100 → 100 | 69 → 69 | 0.44 → 0.43 | 0.093 → 0.093 | 0 → 0 | 0.36 → 0.37 | [before](lighthouse/baseline/lh-hero-desktop.html) · [after](lighthouse/after/lh-hero-desktop.html) |
| [teaser](https://main--tcs-corp--sradha-tcs.aem.live/design-block-master/en/block-library/teaser) | mobile | 90 → 90 | 98 → 98 | 96 → 96 | 69 → 69 | 1.98 → 2.07 | 0.109 → 0.109 | 240 → 224 | 1.32 → 1.35 | [before](lighthouse/baseline/lh-teaser-mobile.html) · [after](lighthouse/after/lh-teaser-mobile.html) |
| [teaser](https://main--tcs-corp--sradha-tcs.aem.live/design-block-master/en/block-library/teaser) | desktop | 98 → 98 | 98 → 98 | 96 → 96 | 69 → 69 | 0.42 → 0.41 | 0.093 → 0.093 | 1 → 1 | 0.32 → 0.32 | [before](lighthouse/baseline/lh-teaser-desktop.html) · [after](lighthouse/after/lh-teaser-desktop.html) |

**Reading the results:**
- **SEO** is 61–69 on every page because aem.live and aem.page are served with `noindex`; the "is-crawlable" audit fails. The production domain won't have this.
- **The other SEO failure** is "link-text" on the home page, which is a content issue.
- **Best practices** is 96 on the teaser page because of console 404s for links to `/content/tcs-corp/design-block-master/english/…`, which is also a content issue.

### Largest Contentful Paint element and Lighthouse accessibility failures (mobile)

| Page | LCP element | Accessibility audits failing |
|---|---|---|
| home | `picture > img` | color-contrast |
| press | `div.default-content-wrapper > p` | heading-order |
| hero | `picture > img` | none |
| teaser | `article.list-row > h3.list-row-title` | heading-order |

`color-contrast` is the List panel kicker on the Brand fill (#cdcdcd on #216ac3), an accepted exception (KB-D-070). `heading-order` comes from the block library pages' authored headings (content).

### Noise: the same page measured 3 times (hero, mobile)

| Host | Run | Performance | LCP (s) | TBT (ms) | CLS | Report |
|---|---|---|---|---|---|---|
| main | 1 | 91 | 1.42 | 10 | 0.109 | [report](lighthouse/repeat/main-1.html) |
| main | 2 | 97 | 1.68 | 176 | 0.000 | [report](lighthouse/repeat/main-2.html) |
| main | 3 | 92 | 1.68 | 230 | 0.109 | [report](lighthouse/repeat/main-3.html) |
| feature-quality-audit | 1 | 95 | 1.53 | 151 | 0.109 | [report](lighthouse/repeat/feature-quality-audit-1.html) |
| feature-quality-audit | 2 | 94 | 1.67 | 275 | 0.000 | [report](lighthouse/repeat/feature-quality-audit-2.html) |
| feature-quality-audit | 3 | 94 | 1.68 | 184 | 0.109 | [report](lighthouse/repeat/feature-quality-audit-3.html) |

The lab difference between before and after is within the run-to-run noise (TBT from 10 to 275 ms on the same code). The CLS of about 0.10 appears or not depending on when the shift happens relative to the first paint.

## Layout shift on a first visit (CLS)

Cause: the header's "Header over the first block" mode was only known once the nav loaded, so on a first visit the first block moved up by the header's height (about 90 px). Since PR #265, a page can declare the mode with the metadata `header-overlay` (`always` / `never`). Measured on the press release template, main on aem.page, 412 px, first visit:

| Trace | CLS | Shifts |
|---|---|---|
| press-release-412-with-header-overlay-metadata.json | 0.005 | 0.001 at 291 ms, 0.004 at 346 ms |
| press-release-412-without-header-overlay-metadata.json | 0.104 | 0.001 at 1660 ms, 0.103 at 3934 ms |

**Action:** add a `header-overlay` column to each root's bulk metadata sheet, matching the TCS Header option.

## Accessibility (axe-core, WCAG 2.0 / 2.1 / 2.2 A and AA)

| Run | Page | Width (px) | Violations |
|---|---|---|---|
| baseline | curated-design-pages/home | 1440 | color-contrast (serious, 1 node) |
| baseline | curated-design-pages/home | 375 | color-contrast (serious, 1 node) |
| baseline | block-library/templates/press-release-template | 1440 | no violations |
| baseline | block-library/templates/press-release-template | 375 | no violations |
| baseline | block-library/form-variations | 1440 | no violations |
| baseline | block-library/form-variations | 375 | no violations |
| baseline | block-library/tabs | 1440 | no violations |
| baseline | block-library/tabs | 375 | no violations |
| after | curated-design-pages/home | 1440 | color-contrast (serious, 1 node) |
| after | curated-design-pages/home | 375 | color-contrast (serious, 1 node) |
| after | block-library/templates/press-release-template | 1440 | no violations |
| after | block-library/templates/press-release-template | 375 | no violations |
| after | block-library/form-variations/form-variations | 1440 | no violations |
| after | block-library/form-variations/form-variations | 375 | no violations |
| after | block-library/tabs | 1440 | no violations |
| after | block-library/tabs | 375 | no violations |

Before, the Form Variations row is the block's folder page (a list of its pages); after, it is the page with the forms (`form-variations/form-variations`). The local preview run with the fixes is [`axe/local.json`](axe/local.json): the same contrast exception on the home page, no other violations.

### WCAG 2.2 AA issues found by code review and fixed (PR #265)

Automated tools can't detect most of these: they were found by reading the code and checked in a browser.

| Criterion | Level | Component | Issue | Fix | Checked by |
|---|---|---|---|---|---|
| 2.1.1 Keyboard | A | Conversation Canvas | Every key other than Escape closed the section panel, so its links were unreachable by keyboard (inverted check) | Escape closes, other keys work | Code review |
| 2.4.3 Focus Order, 2.4.11 Focus Not Obscured | A, AA | TCS Header tablet / mobile menu | Tab moved into the page hidden behind the full-screen menu | `main` and footer `inert` while open; closes when focus leaves the header | Browser (inert on open / off on close) |
| 2.4.1 Bypass Blocks | A | All pages | No skip link | "Skip to main content", visible on focus | Browser |
| 1.3.1, 3.3.2, 4.1.2; 2.4.7 | A; AA | TCS Header search | Placeholder only, no label, no focus indicator, a voice button that does nothing | Label, focus outline, `aria-disabled` on the voice button | Browser |
| 1.3.5 Identify Input Purpose | AA | Form Variations | `autocomplete` removed in an earlier change | Restored (given-name, family-name, email, tel, ...) | Browser |
| 4.1.2 Name, Role, Value | A | Form Variations score field | Unit select had no name | `aria-label` | Code review |
| 1.3.1 | A | Form Variations | Labels `display: none` | Visually hidden (still the accessible name) | Browser |
| 1.1.1 | A | Form Variations contact cards | Icons announced as "Email Icon" next to the address | Decorative | Code review |
| 2.2.2 Pause, Stop, Hide; 2.3.3 | A; AAA | Canvas search prompt | Text and the field's name changed every 3 s, also for reduced motion | Placeholder only; none for reduced motion or in a background tab | Code review |
| 3.1.2, placeholder rule | AA | Header | Nav label always English | Read from placeholders | Browser |
| 2.4.4 | A | List, Cards | New-tab hint lost on call-to-action links | Kept | Code review |

### Open accessibility items (need design or product decisions)

| Criterion | Level | Component | Issue |
|---|---|---|---|
| 2.4.11 Focus Not Obscured | AA | Fixed header | Focused elements can scroll under the header; `scroll-padding-top` would double the Anchor List's own offset |
| 2.2.2 Pause, Stop, Hide | A | Hero background video, collage float | No pause control |
| 3.3.2 Labels or Instructions | A | Form Variations | The placeholder is the only visible label |
| 1.4.3 / 1.4.11 Contrast | AA | Form Variations | Submit button, underline and counter below the ratios |
| 1.4.3 Contrast | AA | List / Cards panel kicker on Brand | Accepted exception (KB-D-070) |

## Still to validate manually
- **Real devices and field data:** real-device performance, and field Core Web Vitals from CrUX or RUM on the production domain.
- **Assistive technology:** NVDA, JAWS and VoiceOver, and keyboard-only use of the header menu, Canvas, tabs, carousels, modals and forms.
- **Zoom and reflow:** 200% zoom, and reflow at 320 px.
- **Compatibility:** the supported browsers and devices.
