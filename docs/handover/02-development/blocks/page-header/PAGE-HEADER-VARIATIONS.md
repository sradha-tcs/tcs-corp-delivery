---
id: "DEV-V-page-header"
title: "Page Header Block — Variations"
role: "Development"
topic: "variations"
audience: "Developers, technical leads, block owners, AI coding agents"
owner: "Technical Lead / Block Owner"
approver: "Product Owner (to be confirmed)"
version: "1.0"
status: "Draft for review"
lastUpdated: "2026-11-22"
lastValidated: "2026-11-22"
sourceFiles: ["blocks/page-header/_page-header.json"]
relatedComponents: ["page-header"]
relatedPages: ["/design-block-master/en/block-library/page-header","/design-block-master/en/block-library/page-header/article","/design-block-master/en/block-library/page-header/article-default","/design-block-master/en/block-library/page-header/cta-primary","/design-block-master/en/block-library/page-header/cta-secondary","/design-block-master/en/block-library/page-header/cta-text-link","/design-block-master/en/block-library/page-header/default-by-page-type","/design-block-master/en/block-library/page-header/display","/design-block-master/en/block-library/page-header/guest-author","/design-block-master/en/block-library/page-header/landing","/design-block-master/en/block-library/page-header/landing-default","/design-block-master/en/block-library/page-header/landing-featured-image","/design-block-master/en/block-library/page-header/landing-text-only","/design-block-master/en/block-library/page-header/press-release","/design-block-master/en/block-library/page-header/secondary","/design-block-master/en/block-library/page-header/tablet-widths","/design-block-master/en/block-library/page-header/tags-and-content-type"]
confidence: "Medium"
primary: false
---

# Page Header Block — Variations

| Attribute | Value |
| --- | --- |
| Document ID | DEV-V-page-header |
| Audience | Developers, technical leads, block owners, AI coding agents |
| Purpose | Every option of the Page Header block's dialog that changes its presentation, and whether the block library shows it |
| Scope | — |
| Prerequisites | — |
| Owner | Technical Lead / Block Owner (proposed) |
| Approver | Product Owner (to be confirmed) |
| Version | 1.0 |
| Status | Draft for review |
| Last updated | 22 November 2026 |
| Last validated | 22 November 2026 |
| Source files | blocks/page-header/_page-header.json |
| Related documents | — |
| Related AEM paths | — |

## Contents

- [Variation fields](#variation-fields)
- [Matrix](#matrix)
- [Narrative (block README)](#narrative-block-readme)
- [Screenshots](#screenshots)
- [Known limitations](#known-limitations)
- [Open items](#open-items)
- [Change history](#change-history)

## Variation fields

| Component | Field | Tab | Multiple | Options (label = value) | Default |
| --- | --- | --- | --- | --- | --- |
| `page-header` | Layout (`classes`) | Style | No | Default (from the Page Type) = `""`; Landing (with the featured image) = `landing`; Secondary (title left, text right) = `secondary`; Article (meta row, author) = `article`; Display (large title) = `display`; Default (Only CTA Alignment Left) = `cta-alignment-left` | `` |
| `page-header` | Title Font (Desktop) (`pageHeaderTitleFont`) | Style | No | H1 (64px) = `h1`; H2 (48px) = `h2`; H3 (40px) = `h3`; H4 (28px) = `h4`; H5 (24px) = `h5`; H6 (20px) = `h6` | `h2` |
| `page-header` | Title Font (Tablet) (`pageHeaderTitleFontTablet`) | Style | No | H1 (40px) = `h1`; H2 (32px) = `h2`; H3 (28px) = `h3`; H4 (24px) = `h4`; H5 (18px) = `h5`; H6 (16px) = `h6` | `h2` |
| `page-header` | Title Font (Mobile) (`pageHeaderTitleFontMobile`) | Style | No | H1 (40px) = `h1`; H2 (32px) = `h2`; H3 (28px) = `h3`; H4 (24px) = `h4`; H5 (18px) = `h5`; H6 (16px) = `h6` | `h2` |
| `page-header` | Description Font (`pageHeaderDescriptionFont`) | Style | No | Default Font = `""`; 1rem (16px) = `text-16px`; 1.125rem (18px) = `text-18px`; 1.25rem (20px) = `text-20px`; 1.5rem (24px) = `text-24px`; 2rem (32px) = `text-32px`; 2.5rem (40px) = `text-40px` | `` |
| `page-header` | CTA List › CTA Link Type (`ctaTarget`) | CTAs | No | Default = `""`; Open in New Window = `new-window` | `` |
| `page-header` | CTA List › CTA Link Style (`ctaStyle`) | CTAs | No | Text link = `""`; Primary Button = `primary`; Secondary Button = `secondary` | `primary` |
| `page-header` | CTA List › Primary CTA Text Color (Primary only) (`pageHeaderPrimaryCtaTextColor`) | CTAs | No | Style default = `""`; White = `primary-text-white`; Blue = `primary-text-blue`; Black = `primary-text-black` | `` |
| `page-header` | CTA List › Primary CTA Background (Primary only) (`pageHeaderPrimaryCtaBackground`) | CTAs | No | Style default = `""`; White = `primary-bg-white`; Blue = `primary-bg-blue`; Translucent white = `primary-bg-translucent` | `` |
| `page-header` | CTA List › Secondary CTA Text Color (Secondary only) (`pageHeaderSecondaryCtaTextColor`) | CTAs | No | Style default = `""`; White = `secondary-text-white`; Blue = `secondary-text-blue`; Black = `secondary-text-black` | `` |
| `page-header` | CTA List › Secondary CTA Background (Secondary only) (`pageHeaderSecondaryCtaBackground`) | CTAs | No | Style default = `""`; White = `secondary-bg-white`; Blue = `secondary-bg-blue`; Translucent white = `secondary-bg-translucent` | `` |
| `page-header-cta` | CTA Link Type (`linkTarget`) | — | No | Default = `""`; Open in New Window = `new-window` | `` |
| `page-header-cta` | CTA Link Style (`linkStyle`) | — | No | Text link = `tertiary`; Primary Button = `primary`; Secondary Button = `secondary` | `primary` |
| `page-header-cta` | Button background (`buttonBackground`) | — | No | Style default = `""`; Blue = `button-bg-blue` | `` |
| `page-header-cta` | Button shape (`buttonShape`) | — | No | Style default = `""`; Round = `button-round` | `` |

## Matrix

Status: every option is supported by the model and the code that reads it. "In the block library" compares the option's class with the classes of the Page Header blocks on the published block library pages (17 pages); options stored as data or field values can't be checked from the classes.

| Component | Field | Option | Value | Status | In the block library |
| --- | --- | --- | --- | --- | --- |
| page-header | Layout | Default (from the Page Type) | `""` | Supported (in the model) | n/a (default) |
| page-header | Layout | Landing (with the featured image) | `landing` | Supported (in the model) | Yes |
| page-header | Layout | Secondary (title left, text right) | `secondary` | Supported (in the model) | Yes |
| page-header | Layout | Article (meta row, author) | `article` | Supported (in the model) | Yes |
| page-header | Layout | Display (large title) | `display` | Supported (in the model) | Yes |
| page-header | Layout | Default (Only CTA Alignment Left) | `cta-alignment-left` | Supported (in the model) | No |
| page-header | Title Font (Desktop) | H1 (64px) | `h1` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Title Font (Desktop) | H2 (48px) | `h2` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Title Font (Desktop) | H3 (40px) | `h3` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Title Font (Desktop) | H4 (28px) | `h4` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Title Font (Desktop) | H5 (24px) | `h5` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Title Font (Desktop) | H6 (20px) | `h6` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Title Font (Tablet) | H1 (40px) | `h1` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Title Font (Tablet) | H2 (32px) | `h2` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Title Font (Tablet) | H3 (28px) | `h3` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Title Font (Tablet) | H4 (24px) | `h4` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Title Font (Tablet) | H5 (18px) | `h5` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Title Font (Tablet) | H6 (16px) | `h6` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Title Font (Mobile) | H1 (40px) | `h1` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Title Font (Mobile) | H2 (32px) | `h2` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Title Font (Mobile) | H3 (28px) | `h3` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Title Font (Mobile) | H4 (24px) | `h4` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Title Font (Mobile) | H5 (18px) | `h5` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Title Font (Mobile) | H6 (16px) | `h6` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Description Font | Default Font | `""` | Supported (in the model) | n/a (default) |
| page-header | Description Font | 1rem (16px) | `text-16px` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Description Font | 1.125rem (18px) | `text-18px` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Description Font | 1.25rem (20px) | `text-20px` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Description Font | 1.5rem (24px) | `text-24px` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Description Font | 2rem (32px) | `text-32px` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | Description Font | 2.5rem (40px) | `text-40px` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | CTA List › CTA Link Type | Default | `""` | Supported (in the model) | n/a (default) |
| page-header | CTA List › CTA Link Type | Open in New Window | `new-window` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | CTA List › CTA Link Style | Text link | `""` | Supported (in the model) | n/a (default) |
| page-header | CTA List › CTA Link Style | Primary Button | `primary` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | CTA List › CTA Link Style | Secondary Button | `secondary` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | CTA List › Primary CTA Text Color (Primary only) | Style default | `""` | Supported (in the model) | n/a (default) |
| page-header | CTA List › Primary CTA Text Color (Primary only) | White | `primary-text-white` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | CTA List › Primary CTA Text Color (Primary only) | Blue | `primary-text-blue` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | CTA List › Primary CTA Text Color (Primary only) | Black | `primary-text-black` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | CTA List › Primary CTA Background (Primary only) | Style default | `""` | Supported (in the model) | n/a (default) |
| page-header | CTA List › Primary CTA Background (Primary only) | White | `primary-bg-white` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | CTA List › Primary CTA Background (Primary only) | Blue | `primary-bg-blue` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | CTA List › Primary CTA Background (Primary only) | Translucent white | `primary-bg-translucent` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | CTA List › Secondary CTA Text Color (Secondary only) | Style default | `""` | Supported (in the model) | n/a (default) |
| page-header | CTA List › Secondary CTA Text Color (Secondary only) | White | `secondary-text-white` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | CTA List › Secondary CTA Text Color (Secondary only) | Blue | `secondary-text-blue` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | CTA List › Secondary CTA Text Color (Secondary only) | Black | `secondary-text-black` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | CTA List › Secondary CTA Background (Secondary only) | Style default | `""` | Supported (in the model) | n/a (default) |
| page-header | CTA List › Secondary CTA Background (Secondary only) | White | `secondary-bg-white` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | CTA List › Secondary CTA Background (Secondary only) | Blue | `secondary-bg-blue` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header | CTA List › Secondary CTA Background (Secondary only) | Translucent white | `secondary-bg-translucent` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header-cta | CTA Link Type | Default | `""` | Supported (in the model) | n/a (default) |
| page-header-cta | CTA Link Type | Open in New Window | `new-window` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header-cta | CTA Link Style | Text link | `tertiary` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header-cta | CTA Link Style | Primary Button | `primary` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header-cta | CTA Link Style | Secondary Button | `secondary` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header-cta | Button background | Style default | `""` | Supported (in the model) | n/a (default) |
| page-header-cta | Button background | Blue | `button-bg-blue` | Supported (in the model) | Not checkable (data attribute / field value) |
| page-header-cta | Button shape | Style default | `""` | Supported (in the model) | n/a (default) |
| page-header-cta | Button shape | Round | `button-round` | Supported (in the model) | Not checkable (data attribute / field value) |

## Narrative (block README)

The layouts are the Layout select values in `blocks/page-header/_page-header.json`; Default resolves in `page-header.js` `layoutOf`.

#### Default (from the Page Type)

Purpose: the right layout without a choice: Landing for `landing` / `listing`, else Article. Use on template pages. Rendering: as the resolved layout. The automatic header of the templates always uses Default.

#### Landing (`landing`)

Purpose: landing and listing pages with a large title and, optionally, the featured image. Required: Title; optional Description, content-type, CTAs, featured-image (+ image-alt). Rendering: `div.page-header-intro` with eyebrow, title (`--display-font-size-1`, semibold; 6rem from 900px), description and CTAs; `div.page-header-media` with the featured image; with an image the block gets `page-header-has-image` and, from 900px, a two-column grid (`--space-2000` gap). The image is requested 1200px wide from 900px, 750px below, eager with high priority when it is same-origin site media (`/media_`). Without an image the text stacks on the left.

```text
[Screenshot Placeholder]

File name:
page-header-landing-tablet.png

Purpose:
The Landing layout with a featured image at 768px: text and CTAs stacked, the image below them (two columns only from 900px).

Annotations:
A = Intro column
B = Featured image
```

#### Secondary (`secondary`)

Purpose: title on one side, description and CTAs on the other. Rendering: the eyebrow above `div.page-header-columns` (intro: semibold title; summary: description and CTAs, `--space-300` lower from 900px); two columns from 900px.

#### Article (`article`)

Purpose: articles, blogs, insights, press releases. Rendering: `div.page-header-meta-row` (labels: tags and `p.page-header-collection`; info: date, reading time, `div.page-header-actions` with listen (only with listen-link), download (prints the page) and share (device share dialog, else copies the URL with a `role="status"` message for 3 seconds)), then the columns (intro: title at `--display-font-size-2` and the author lockup; summary: description and CTAs).

```text
[Screenshot Placeholder]

File name:
page-header-article-no-author-desktop.png

Purpose:
The Article layout on a page without author-id and author: no lockup under the title.

Annotations:
A = Title without author
B = Meta row
```

#### Display (`display`)

Purpose: a very large statement title under the tags. Rendering: the tags separated by "|" as the eyebrow, the title at `--display-font-size-1` (6rem from 900px, medium weight, `--color-text-neutral`), the summary vertically centred from 900px.

#### Automatic Page Header (templates)

The Article, Blog and Press Release templates prepend an empty `div.page-header` in its own section when the page has none; it renders with Default layout and no CTAs.

#### Author from the Authors sheet / from Author metadata

With `author-id` found in the Authors sheet: photo (2.5rem circle), name linked to LinkedIn in a new tab (with the new-tab hint) and "designation, region". With only `author`: the name alone. Without either: no lockup.

## Screenshots

No screenshot belongs to this document (it describes code, configuration or process). Evidence screenshots are listed in the [screenshot register](../../../SCREENSHOT-REGISTER.md).

## Known limitations

- Combination rules (which options cannot be combined) are described in the README narrative only where they exist; unsupported combinations are not enumerated.

## Open items

- None.

## Change history

| Version | Date | Author | Change |
| --- | --- | --- | --- |
| 1.0 | 22 November 2026 | Delivery team (documentation program) | First version of the role-specific documentation (master documentation prompt), generated from the repository and the published reference pages |
