---
id: "AUT-C-tcs-header"
title: "TCS Header — Authoring Guide"
role: "Authoring"
topic: "component authoring"
audience: "Content authors, content managers, AEM authoring leads"
owner: "Content Lead / AEM Authoring Lead"
approver: "Product Owner (to be confirmed)"
version: "1.0"
status: "Draft for review"
lastUpdated: "2026-11-22"
lastValidated: "2026-11-22"
sourceFiles: ["blocks/tcs-header/README.md","blocks/tcs-header/_tcs-header.json"]
relatedComponents: ["tcs-header"]
relatedPages: []
confidence: "Medium"
primary: true
---

# TCS Header — Authoring Guide

| Attribute | Value |
| --- | --- |
| Document ID | AUT-C-tcs-header |
| Audience | Content authors, content managers, AEM authoring leads |
| Purpose | How to add, fill in and check the TCS Header component |
| Scope | — |
| Prerequisites | — |
| Owner | Content Lead / AEM Authoring Lead (proposed) |
| Approver | Product Owner (to be confirmed) |
| Version | 1.0 |
| Status | Draft for review |
| Last updated | 22 November 2026 |
| Last validated | 22 November 2026 |
| Source files | blocks/tcs-header/README.md, blocks/tcs-header/_tcs-header.json |
| Related documents | — |
| Related AEM paths | — |

## Contents

- [Where to see it](#where-to-see-it)
- [For Content Authors](#for-content-authors)
- [Authorable Fields](#authorable-fields)
- [Screenshot-Based Authoring Steps](#screenshot-based-authoring-steps)
- [Variations](#variations)
- [Complete Authoring Example](#complete-authoring-example)
- [Content and Asset Guidelines](#content-and-asset-guidelines)
- [Troubleshooting](#troubleshooting)
- [Screenshots](#screenshots)
- [Known limitations](#known-limitations)
- [Open items](#open-items)
- [Change history](#change-history)

## Where to see it

No block library page.

## For Content Authors

1. **Open the Navigation page** (`references/nav` of the locale, or the area's nav page) in Universal Editor.
2. **Add the block** to the first section: section › Add › **TCS Header** (offered in every section).
3. **Open its properties** (select the block, Properties panel).
4. **Content tab:** select the TCS Logo asset, enter TCS Logo Alt Text, choose the TCS Logo Link (the locale Home); select the TATA Logo, enter TATA Logo Alt Text, enter the TATA Logo Link (`https://www.tata.com`). Optional: Menu root path and Menu depth (tablet / mobile menu); **Header over the first block** (every width): Auto (default: over an opening light Hero), Always (over any first block, which starts at the top of the page; give a block other than a Hero a Padding top so its content clears the logos), Never (the page starts below the header).
5. **Additional tab** (optional): Anchor ID, Hide block, padding and margin. On the Navigation page they have no effect in the site header.
6. **Preview** the nav page and a content page using it (desktop, tablet, mobile).
7. **Publish** the Navigation page and the logo assets.
8. **Validate** on the published site: both logos show, link to the right pages and are announced by their alt texts.
9. **Leave the header out of one page (optional):** Page Properties › **Hide Header** on that page (this page only, not its child pages; or the metadata sheet's `hide-header` column). The Navigation page isn't loaded on it, so the logo bar, the menu and the header Canvas are left out and the page starts at the top (KB-D-071). The Additional tab's Hide block still has no effect in the site header.

Minimum required: one logo image or one link. Recommended: both images (transparent SVG), both alt texts and both links. Optional: the Additional tab.

## Authorable Fields

<!-- BEGIN GENERATED: fields (npm run build:docs) -->

#### TCS Header (`tcs-header`)

Model `tcs-header`; template name "TCS Header" (the block class AEM renders); key-value block (one row per property).

##### Content tab — TCS Header

| Field label | Property | Type | Required | Default | Allowed values | Author guidance | Example |
| ----------- | -------- | ---- | -------- | ------- | -------------- | --------------- | ------- |
| TCS Logo | `tcsLogo` | reference | No | — | — | — | /content/dam/tcs-corp/block-library/header/tcs-logo.png |
| TCS Logo Alt Text | `tcsLogoAlt` | text | No | `Tata Consultancy Services` | — | Names the logo link for screen readers. Delivered with `tcsLogo` (field collapse). | Tata Consultancy Services |
| TCS Logo Link | `tcsLogoLink` | aem-content | No | — | — | Usually the locale Home page. | /design-block-master/en/curated-design-pages/home |
| TATA Logo | `tataLogo` | reference | No | — | — | — | /content/dam/tcs-corp/block-library/header/tata-logo.png |
| TATA Logo Alt Text | `tataLogoAlt` | text | No | `TATA Group` | — | Names the logo link for screen readers. Delivered with `tataLogo` (field collapse). | TATA Group |
| TATA Logo Link | `tataLogoLink` | aem-content | No | — | — | Usually https://www.tata.com/. | https://www.tata.com |
| Menu | `menu` | container | No | — | — | — | — |
| Menu › Menu root path | `menuRootPath` | aem-content | No | — | — | Select the parent folder of the navigation pages (e.g., /curated-design-pages) | — |
| Menu › Menu depth | `menuDepth` | number | No | `3` | — | — | — |

##### Display tab — TCS Header

| Field label | Property | Type | Required | Default | Allowed values | Author guidance | Example |
| ----------- | -------- | ---- | -------- | ------- | -------------- | --------------- | ------- |
| Header over the first block | `headerOverlay` | select | No | "" | Auto (based on first block) (""), Always (over the first block) (`always`), Never (the page starts below the header) (`never`) | At every width: whether the logo bar lies transparent over the page's first block. Auto: detects dark/light background. | — |
| Desktop behavior | `headerDesktopPosition` | select | No | `float` | Float (scrolls with the page) (`float`), Sticky (stays at the top) (`sticky`) | From 1200px. Float scrolls away with the page; Sticky stays at the top. | — |
| Tablet behavior | `headerTabletPosition` | select | No | `sticky` | Sticky (stays at the top) (`sticky`), Float (scrolls with the page) (`float`) | From 600px to 1199px. Sticky stays at the top; Float scrolls away with the page. | — |
| Mobile behavior | `headerMobilePosition` | select | No | `sticky` | Sticky (stays at the top) (`sticky`), Float (scrolls with the page) (`float`) | Below 600px. Sticky stays at the top; Float scrolls away with the page. | — |

##### Additional tab — TCS Header

| Field label | Property | Type | Required | Default | Allowed values | Author guidance | Example |
| ----------- | -------- | ---- | -------- | ------- | -------------- | --------------- | ------- |
| Anchor ID | `classes_anchor` | text | No | — | regExp: ^anchor-[a-z0-9][a-z0-9-]*$; customErrorMsg: Start with anchor-, then lower-case letters, digits and hyphens. | A unique ID of the block on the page, starting with anchor- Delivered as a block class. | — |
| Hide block | `classes_hideblock` | boolean | No | `false` | on / off | Delivered as a block class. | — |

<!-- END GENERATED: fields -->

Notes on the significant fields:

- **TCS Logo / TATA Logo.** Rendered as the picture AEM delivers, inside `a.tcs-header-brand` / `a.tcs-header-group` (a `span` when the logo has no link). In the site header, the CSS sets the height per breakpoint (see [Content and Asset Guidelines](https://github.com/sradha-tcs/tcs-corp/blob/main/blocks/tcs-header/README.md#content-and-asset-guidelines)).
- **TCS Logo Alt Text / TATA Logo Alt Text.** Fields ending in Alt collapse into their image (AEM delivery rule): the text arrives as the image's `alt`, not as a row of its own. It names the logo link for screen readers. When a linked logo has an empty alt, the code uses the placeholder `tcsLogo` ("Tata Consultancy Services") / `tataLogo` ("TATA Group").
- **TCS Logo Link / TATA Logo Link.** A link or text; a domain typed without a scheme (`www.tata.com`, `tata.com/…`) gets `https://` added, so it isn't a relative link. Without a link the logo isn't a link.
- **No image.** A logo with a link but no image renders its placeholder name as text in the link; without image and link it isn't rendered.
- **Data layer impact.** Logo clicks are `cmp:click` (see [Data Layer and Analytics](https://github.com/sradha-tcs/tcs-corp/blob/main/blocks/tcs-header/README.md#data-layer-and-analytics)).
- **Legacy mapping.** None.
- **Additional tab.** As every block (AGENTS.md "Additional tab"), without animation fields; the styles apply only inside `main`, so on the Navigation page they don't reach the site header.

## Screenshot-Based Authoring Steps

#### Authoring Step 1: Add the TCS Header to the Navigation page

```text
[Screenshot Placeholder]

File name:
tcs-header-authoring-step-1.png

Purpose:
The first section of the Navigation page with the Add menu open and TCS Header highlighted.

Annotations:
A = First section of the nav page
B = Add (+)
C = TCS Header in the component list
```

#### Values to Enter

| Callout | Field | Value | Reason | Expected result |
| ------- | ----- | ----- | ------ | --------------- |
| A | Section | The first section of `references/nav` | The header reads the logos from the block, whatever its section | The block's section becomes the header's brand and tools |
| C | Component | TCS Header | Logo fields | An empty TCS Header block |

Author action: Add › TCS Header. Expected preview: an empty block until the fields are filled in. Business rule: one TCS Header per nav page (the header uses the first one). Validation: the content tree shows the block in the first section. Common mistake: adding it to a content page instead of the nav page; resolution: open the page's Navigation page.

#### Authoring Step 2: The TCS logo

```text
[Screenshot Placeholder]

File name:
tcs-header-authoring-step-2.png

Purpose:
The Content tab with the TCS Logo fields filled in.

Annotations:
A = TCS Logo
B = TCS Logo Alt Text
C = TCS Logo Link
```

#### Values to Enter

| Callout | Field | Value | Reason | Expected result |
| ------- | ----- | ----- | ------ | --------------- |
| A | TCS Logo | `/content/dam/tcs-corp/block-library/header/tcs-logo.png` (production: `/content/dam/tcs-corp/header/tcs-logo.svg`) | One asset for all breakpoints | TCS logo shown |
| B | TCS Logo Alt Text | `Tata Consultancy Services` | Names the link | Announced name |
| C | TCS Logo Link | `/language-master/en/curated-design-pages/home` (the locale Home) | Brand links Home | The logo is a link |

Expected published result: every page using the nav page shows the logo. Validation: the logo link's accessible name is the alt text. Common mistake: a JPG with a white background (F-81); use the transparent SVG.

#### Authoring Step 3: The TATA logo

```text
[Screenshot Placeholder]

File name:
tcs-header-authoring-step-3.png

Purpose:
The Content tab with the TATA Logo fields filled in.

Annotations:
A = TATA Logo
B = TATA Logo Alt Text
C = TATA Logo Link
```

#### Values to Enter

| Callout | Field | Value | Reason | Expected result |
| ------- | ----- | ----- | ------ | --------------- |
| A | TATA Logo | `/content/dam/tcs-corp/block-library/header/tata-logo.png` (production: `/content/dam/tcs-corp/header/tata-logo.svg`) | Group logo | TATA logo shown |
| B | TATA Logo Alt Text | `TATA Group` | Names the link | Announced name |
| C | TATA Logo Link | `https://www.tata.com` | Group site | Opens tata.com |

Business rule: `www.tata.com` without `https://` is completed by the code. Validation: the published link is `https://www.tata.com`. Common mistake: a relative path; resolution: enter the full address.

#### Authoring Step 4: Preview and publish

```text
[Screenshot Placeholder]

File name:
tcs-header-authoring-step-4.png

Purpose:
A content page in preview at 1440px and 390px showing the logos from the nav page.

Annotations:
A = TCS logo in the header
B = TATA logo in the header
C = Menu button (390px)
```

#### Values to Enter

| Callout | Field | Value | Reason | Expected result |
| ------- | ----- | ----- | ------ | --------------- |
| A | Publish | The Navigation page and both assets | Pages load the published nav page | Logos on the live site |

Validation: check the logo heights per breakpoint and both links. Common mistake: publishing the page but not the DAM assets.

## Variations

#### On the Navigation page (header logos)

- **Purpose:** the site header's brand and tools.
- **When to use / not:** always on nav pages; not needed on positional nav pages authored before (brand, sections, tools), which still work.
- **Fields:** the six logo fields, and **Menu root path** / **Menu depth** for the tablet and mobile menu.
- **Rendering:** `blocks/header` `applyLogoBar` replaces the block's section with `div.section.nav-brand > p > a.tcs-header-brand` and `div.section.nav-tools > p > a.tcs-header-group`; the first other section becomes the menu. A TCS Header in the same section as a Conversation Canvas is kept as the logo bar (only the Canvas goes to the header Canvas). Sizes and layout come from `header.css`.
- **Tablet and mobile menu (below 1200px):** a nav page without a menu list of its own gets one from this block: decorated in the nav fragment (before the header reads it), it adds `div.section.tcs-header-menu` after its section, the list of the pages below its **Menu root path** (else the Menu root path of the Conversation Canvas in its section) up to its **Menu depth** (else the Canvas's, else 1), from the query index (`utils/query-index.js` `getPageTree`; `scripts.js` `prefetchData` starts the index on every page at the start of the lazy phase, so the header doesn't wait for it). `blocks/header` (unchanged) makes it the menu: menu button, levels, Escape, focus, `header:menu`. No pages (or AEM author, which has no query index): no menu, no menu button. `tcs-header.css` styles the header below 1200px as Figma Mobile Nav 2325:55704 / 1124:25497 (24px gutters, TCS logo 30.7px, TATA logo 38px, the menu icon's 2px lines 26px wide and 8px apart in `--color-icon-default`). The open menu's title row ("Menu", or a level's Back arrow and title) starts at the gutter, left-aligned with the rows below, and a linked section's arrow (on its button) is at the right edge, in line with the other rows' arrows. While the menu is open the header Canvas is hidden (`blocks/conversation-canvas`); it shows again in its place when the menu closes. Below 1200px the Conversation Canvases don't show their own site menu button (`blocks/conversation-canvas`): the header's menu button is the site navigation there; on desktop the Canvas menu lists the same pages, one level at a time like this menu.
- **Menu root path fallback:** the menu takes the first of the block's own Menu root path and the Conversation Canvas's (in the same section) with pages in the site's query index. A Menu root path of another site (e.g. the language master, `/content/tcs-corp/language-master/en/...`, on an `/en` page) has none there, so the Canvas's is used; without pages in either, there's no menu and no menu button.
- **Header behavior** works at every width and with every Header over the first block mode. Sticky (default) keeps the logo bar at the top while scrolling (fixed, `z-index: 20`); Float scrolls away with the page (absolute). Over the first block it is transparent at the top and turns solid over the first bar-height of scrolling (a scroll-driven animation, with the existing `is-scrolled` fallback). In-page targets retain their header offset; the Anchor List keeps its own offset.
- **Header over the first block (every width):** **Auto** (default) keeps the behaviour before: the logo bar lies transparent over an opening light Hero (Home), else it's a bar above the page. **Always**: the bar is transparent over the page's first block, whatever it is, which starts at the top of the page; a Hero keeps its content below the logos, other blocks need their own top space (their Padding top, Additional tab, or `var(--header-overlay-space, 0rem)` in a block's CSS); the logos should be transparent images (a JPG keeps its white box over a coloured block) and dark logos aren't visible over a dark block. **Never**: the bar is above the page also over a light Hero (the page starts below the 64px / 124px bar). The block sets `<html data-header-overlay>` (`utils/header-space.js` `setHeaderOverlay`) when decorated in the nav fragment, not on the nav page itself; the layout is in `styles/styles.css` (it applies before the header loads), the transparent bar in `tcs-header.css`. The mode is remembered per browser and applied before the header loads on the next pages, so only a visitor's first page with Always or Never can move once when the header arrives (decision log KB-D-052, Proposed).
- **Desktop / tablet / mobile:** as the [Header](https://github.com/sradha-tcs/tcs-corp/blob/main/blocks/header/README.md).
- **Accessibility:** logo links named by their alt texts, inside the header's `nav`.
- **Data layer:** clicks report the header component (`header-1`).
- **Personalization / fallback:** none; an area nav page can use other logos.

```text
[Screenshot Placeholder]

File name:
tcs-header-in-header-desktop.png

Purpose:
The logos in the site header (see Visual Reference).

Annotations:
A = TCS logo
B = TATA logo
```

#### Standalone logo bar

- **Purpose:** the logo bar inside a page section.
- **Rendering:** `div.tcs-header-bar` (flex, 1.7391rem gap between the logos; `justify-content: space-between` from 1200px). In a Full Width section (any section without `fixed-width`) the bar keeps the header's gutters (1rem / 1.5rem / 5rem); in a Fixed Width section the section gutter applies.
- **Accessibility / data layer:** the block is its own component (`tcs-header-1`); logo clicks `cmp:click`.

```text
[Screenshot Placeholder]

File name:
tcs-header-standalone-desktop.png

Purpose:
The standalone logo bar (see Visual Reference).

Annotations:
A = TCS logo
B = TATA logo
```

## Complete Authoring Example

Scenario: the default Navigation page of `/en` gets the corporate logos.

| Field | Example value | Guidance |
| ----- | ------------- | -------- |
| TCS Logo | `/content/dam/tcs-corp/header/tcs-logo.svg` | Transparent SVG exported from the Figma TCS Logo |
| TCS Logo Alt Text | `Tata Consultancy Services` | Translate per locale |
| TCS Logo Link | The `/en` Home page | |
| TATA Logo | `/content/dam/tcs-corp/header/tata-logo.svg` | Transparent SVG |
| TATA Logo Alt Text | `TATA Group` | |
| TATA Logo Link | `https://www.tata.com` | Full address |

Steps: open `/content/tcs-corp/us/en/references/nav`, add the TCS Header to the first section, fill in the fields, publish the page and the two SVGs.

Expected output: the header logo bar on every `/en` page. Responsive: heights 1.2104 / 1.9165 / 2.175rem (TCS) and 1.5 / 2.375 / 2.75rem (TATA). Accessibility: two named logo links. Analytics: logo clicks on `component.header-1`. Personalization fallback: none.

Pre-publish checklist:

- [ ] Both images selected (SVG), both alt texts, both links.
- [ ] Block in the nav page's first section, menu list in the next one.
- [ ] Assets published.
- [ ] Checked at 390px, 1024px, 1440px.

## Content and Asset Guidelines

- **Logos.** One asset per logo for every breakpoint (Figma uses the same vector at every size); upload SVGs to `/content/dam/tcs-corp/header/` (`tcs-logo.svg`, `tata-logo.svg`, F-77). The width follows the aspect ratio, except the TCS logo has a fixed 9.125rem (146px) desktop width:

| Logo | Mobile | Tablet (>= 600px) | Desktop (>= 1200px) |
| ---- | ------ | ----------------- | ------------------- |
| TCS logo | 1.2104rem (19.4px) | 1.9165rem (30.7px) | 2.175rem (34.8px) |
| TATA logo | 1.5rem (24px) | 2.375rem (38px) | 2.75rem (44px) |

- **Alt text.** The organisation's name ("Tata Consultancy Services", "TATA Group"), translated per locale.
- **Links.** The locale Home for TCS; the full `https://` address for external links.
- **Icons, tags, metadata.** None.
- **Min / max items.** Two logos (fixed by the model).
- **Loading.** The images AEM delivers (no `createOptimizedPicture` in the block); in the header they load with the nav page in the lazy phase.
- **Missing asset.** Linked logo without image: its placeholder name as text; neither: nothing.

## Troubleshooting

| Symptom | Likely cause | Diagnostic steps | Resolution | Verification |
| ------- | ------------ | ---------------- | ---------- | ------------ |
| No logos in the header | Assets not uploaded / published (F-77), or block not on the nav page in use | Check the page's Navigation; image requests | Upload / publish the SVGs; edit the right nav page | Logos visible |
| Logo with a white box | JPG / PNG with background (F-81) | Inspect the asset | Use the transparent SVG | Clean logo |
| TATA link leads to a 404 on the site | Old content with a relative link | Inspect `href` | Enter `https://www.tata.com` | Correct target |
| Logo name shown as text | No image selected | Properties panel | Select the asset | Image shown |
| Spacing options have no effect in the header | Additional tab styles apply only inside `main` | — | Expected | — |
| No menu button on tablet / mobile | No Menu root path with pages in the site: e.g. a language master path on an `/en` nav page and no Conversation Canvas Menu root path | The nav page's TCS Header and Canvas Menu root paths; `/{locale}/query-index.json` | Set the TCS Header's Menu root path to a page of the site (`/en/...`) or clear it | Menu button shown |
| Header over the first block has no effect | Nav page not published, or the page uses another nav page | `<html data-header-overlay>` on the page; the page's Navigation | Publish the nav page | Attribute set, layout as chosen |
| The page moves once when the header loads (Always / Never) | The visitor's first page: the mode isn't known before the header loads | Second page view: no shift | Expected (KB-D-052, Proposed) | CLS 0 on the next page |
| Text of the first block under the logos (Always) | The block has no space for the header | Inspect the block's top padding | Padding top (Additional tab) or `--header-overlay-space` in the block's CSS | Text below the logos |

Evidence to collect: the nav page path, the rendered `a.tcs-header-*` markup, the asset paths, a screenshot per breakpoint.

## Screenshots

> **Screenshot required**
>
> - Required screen: TCS Header dialog in Universal Editor (every tab, including Additional)
> - Required role/access: AEM Sites author with Universal Editor (content author)
> - Required navigation steps: AEM Sites console > /content/tcs-corp/language-masters/en > open a page in Universal Editor
> - Reason unavailable: No AEM author access in the documentation program (access blocker AB-01)
> - Owner: Content Lead / AEM Authoring Lead (proposed)
> - Target completion date: To be confirmed

## Known limitations

- Universal Editor screenshots are placeholders: no author access in this program.

## Open items

- None.

## Change history

| Version | Date | Author | Change |
| --- | --- | --- | --- |
| 1.0 | 22 November 2026 | Delivery team (documentation program) | First version of the role-specific documentation (master documentation prompt), generated from the repository and the published reference pages |
