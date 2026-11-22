---
id: "DEV-V-cards"
title: "Cards Block — Variations"
role: "Development"
topic: "variations"
audience: "Developers, technical leads, block owners, AI coding agents"
owner: "Technical Lead / Block Owner"
approver: "Product Owner (to be confirmed)"
version: "1.0"
status: "Draft for review"
lastUpdated: "2026-11-22"
lastValidated: "2026-11-22"
sourceFiles: ["blocks/cards/_cards.json"]
relatedComponents: ["cards"]
relatedPages: ["/design-block-master/en/block-library/cards","/design-block-master/en/block-library/cards/card-colours","/design-block-master/en/block-library/cards/card-styles","/design-block-master/en/block-library/cards/grid-and-horizontal-scroll","/design-block-master/en/block-library/cards/heights-links-legacy","/design-block-master/en/block-library/cards/images-panels-style-options","/design-block-master/en/block-library/cards/per-card-styles-and-colours"]
confidence: "Medium"
primary: false
---

# Cards Block — Variations

| Attribute | Value |
| --- | --- |
| Document ID | DEV-V-cards |
| Audience | Developers, technical leads, block owners, AI coding agents |
| Purpose | Every option of the Cards block's dialog that changes its presentation, and whether the block library shows it |
| Scope | — |
| Prerequisites | — |
| Owner | Technical Lead / Block Owner (proposed) |
| Approver | Product Owner (to be confirmed) |
| Version | 1.0 |
| Status | Draft for review |
| Last updated | 22 November 2026 |
| Last validated | 22 November 2026 |
| Source files | blocks/cards/_cards.json |
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
| `cards` | Heading type (`titleType`) | Content | No | H1 = `h1`; H2 = `h2`; H3 = `h3`; H4 = `h4`; H5 = `h5`; H6 = `h6` | `h2` |
| `cards` | CTA style (`linkType`) | Content | No | Text link = `""`; Primary button = `primary`; Secondary button = `secondary` | `` |
| `cards` | Card style (`cardStyle`) | Display | No | Image card = `image`; Panel = `panel`; Report = `report`; Statistic = `stat`; Mixed = `mixed` | `image` |
| `cards` | Card colour (`cardTheme`) | Display | No | Default for the style = `""`; Dark = `dark`; Navy = `navy`; Brand blue = `brand`; Light blue = `brand-light`; Light grey = `grey`; Mid grey = `mid-grey`; Grey gradient = `gradient`; Image background = `image` | `` |
| `cards` | Image ratio (`imageRatio`) | Display | No | 16:9 = `16-9`; 1:1 = `1-1`; 4:3 = `4-3`; 3:2 = `3-2` | `16-9` |
| `cards` | Panel height (`panelHeight`) | Display | No | Portrait (2:3) = `portrait`; Compact = `compact`; Content = `auto` | `portrait` |
| `cards` | Date format (`dateFormat`) | Display | No | 04 Sep 26 = `dd-mmm-yy`; 04-09-2026 = `dd-mm-yyyy`; 09-04-2026 = `mm-dd-yyyy`; Sep 4, 2026 = `mmm-d-yyyy`; 04/09/26 = `dd/mm/yy`; 4th September 2026 = `do-mmmm-yyyy` | `dd-mmm-yy` |
| `cards` | Image loading (`imageLoading`) | Display | No | Lazy = `lazy`; Eager (first screen) = `eager` | `lazy` |
| `cards` | Desktop display (`desktopMode`) | Display | No | Grid = `grid`; Horizontal scroll = `horizontal-scroll`; Carousel (buttons on the cards) = `carousel` | `grid` |
| `cards` | Tablet display (`tabletMode`) | Display | No | Grid = `grid`; Horizontal scroll = `horizontal-scroll`; Carousel (buttons on the cards) = `carousel` | `grid` |
| `cards` | Mobile display (`mobileMode`) | Display | No | Grid = `grid`; Horizontal scroll = `horizontal-scroll`; Carousel (buttons on the cards) = `carousel` | `grid` |
| `cards` | Snap alignment (`snapAlign`) | Display | No | Start = `start`; Center = `center` | `start` |
| `cards` | Scroll step (`scrollStep`) | Display | No | One card = `one-card`; Viewport = `viewport` | `one-card` |
| `cards` | Edge (`edgePadding`) | Display | No | Cards run to the edge = `bleed`; Inside the content width = `none` | `bleed` |
| `cards` | When there are no cards (`emptyBehavior`) | Display | No | Hide the block = `hide`; Show a message = `message` | `hide` |
| `cards` | Style options (`classes`) | Display | Yes | Compact statistic title = `stat-compact`; Dividers between rows = `dividers`; Header centred = `header-center`; Impact cards (proven impact and outcomes) = `impact-cards` | — |
| `card` | Title size (`titleSize`) | Content | No | Default (the card style's) = `""`; 96px = `96`; 48px = `48`; H1 = `h1`; H2 = `h2`; H3 = `h3`; H4 = `h4`; H5 = `h5`; H6 = `h6` | `` |
| `card` | Open in a new tab (`newTab`) | Link | No | As the block = `""`; Yes = `true`; No = `false` | `` |
| `card` | CTA 1 Style (`cta1Style`) | Link | No | Secondary Button = `""`; Secondary Button (no arrow) = `secondary-no-arrow`; Primary Button = `primary`; Primary Button (no arrow) = `primary-no-arrow`; Text link = `tertiary` | `` |
| `card` | CTA 1 Open in a new tab (`cta1Target`) | Link | No | Default = `""`; Open in New Window = `new-window` | `` |
| `card` | CTA 2 Style (`cta2Style`) | Link | No | Secondary Button = `""`; Secondary Button (no arrow) = `secondary-no-arrow`; Primary Button = `primary`; Primary Button (no arrow) = `primary-no-arrow`; Text link = `tertiary` | `` |
| `card` | CTA 2 Open in a new tab (`cta2Target`) | Link | No | Default = `""`; Open in New Window = `new-window` | `` |
| `card` | Card style (`kind`) | Display | No | As the block = `""`; Image card = `image`; Panel = `panel`; Report = `report`; Statistic = `stat` | `` |
| `card` | Card colour (`theme`) | Display | No | As the block = `""`; Dark = `dark`; Navy = `navy`; Brand blue = `brand`; Light blue = `brand-light`; Light grey = `grey`; Mid grey = `mid-grey`; Grey gradient = `gradient`; Image background = `image` | `` |

## Matrix

Status: every option is supported by the model and the code that reads it. "In the block library" compares the option's class with the classes of the Cards blocks on the published block library pages (7 pages); options stored as data or field values can't be checked from the classes.

| Component | Field | Option | Value | Status | In the block library |
| --- | --- | --- | --- | --- | --- |
| cards | Heading type | H1 | `h1` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Heading type | H2 | `h2` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Heading type | H3 | `h3` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Heading type | H4 | `h4` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Heading type | H5 | `h5` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Heading type | H6 | `h6` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | CTA style | Text link | `""` | Supported (in the model) | n/a (default) |
| cards | CTA style | Primary button | `primary` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | CTA style | Secondary button | `secondary` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Card style | Image card | `image` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Card style | Panel | `panel` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Card style | Report | `report` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Card style | Statistic | `stat` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Card style | Mixed | `mixed` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Card colour | Default for the style | `""` | Supported (in the model) | n/a (default) |
| cards | Card colour | Dark | `dark` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Card colour | Navy | `navy` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Card colour | Brand blue | `brand` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Card colour | Light blue | `brand-light` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Card colour | Light grey | `grey` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Card colour | Mid grey | `mid-grey` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Card colour | Grey gradient | `gradient` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Card colour | Image background | `image` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Image ratio | 16:9 | `16-9` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Image ratio | 1:1 | `1-1` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Image ratio | 4:3 | `4-3` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Image ratio | 3:2 | `3-2` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Panel height | Portrait (2:3) | `portrait` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Panel height | Compact | `compact` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Panel height | Content | `auto` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Date format | 04 Sep 26 | `dd-mmm-yy` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Date format | 04-09-2026 | `dd-mm-yyyy` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Date format | 09-04-2026 | `mm-dd-yyyy` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Date format | Sep 4, 2026 | `mmm-d-yyyy` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Date format | 04/09/26 | `dd/mm/yy` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Date format | 4th September 2026 | `do-mmmm-yyyy` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Image loading | Lazy | `lazy` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Image loading | Eager (first screen) | `eager` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Desktop display | Grid | `grid` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Desktop display | Horizontal scroll | `horizontal-scroll` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Desktop display | Carousel (buttons on the cards) | `carousel` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Tablet display | Grid | `grid` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Tablet display | Horizontal scroll | `horizontal-scroll` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Tablet display | Carousel (buttons on the cards) | `carousel` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Mobile display | Grid | `grid` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Mobile display | Horizontal scroll | `horizontal-scroll` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Mobile display | Carousel (buttons on the cards) | `carousel` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Snap alignment | Start | `start` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Snap alignment | Center | `center` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Scroll step | One card | `one-card` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Scroll step | Viewport | `viewport` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Edge | Cards run to the edge | `bleed` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Edge | Inside the content width | `none` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | When there are no cards | Hide the block | `hide` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | When there are no cards | Show a message | `message` | Supported (in the model) | Not checkable (data attribute / field value) |
| cards | Style options | Compact statistic title | `stat-compact` | Supported (in the model) | Yes |
| cards | Style options | Dividers between rows | `dividers` | Supported (in the model) | Yes |
| cards | Style options | Header centred | `header-center` | Supported (in the model) | Yes |
| cards | Style options | Impact cards (proven impact and outcomes) | `impact-cards` | Supported (in the model) | No |
| card | Title size | Default (the card style's) | `""` | Supported (in the model) | n/a (default) |
| card | Title size | 96px | `96` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Title size | 48px | `48` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Title size | H1 | `h1` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Title size | H2 | `h2` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Title size | H3 | `h3` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Title size | H4 | `h4` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Title size | H5 | `h5` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Title size | H6 | `h6` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Open in a new tab | As the block | `""` | Supported (in the model) | n/a (default) |
| card | Open in a new tab | Yes | `true` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Open in a new tab | No | `false` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | CTA 1 Style | Secondary Button | `""` | Supported (in the model) | n/a (default) |
| card | CTA 1 Style | Secondary Button (no arrow) | `secondary-no-arrow` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | CTA 1 Style | Primary Button | `primary` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | CTA 1 Style | Primary Button (no arrow) | `primary-no-arrow` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | CTA 1 Style | Text link | `tertiary` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | CTA 1 Open in a new tab | Default | `""` | Supported (in the model) | n/a (default) |
| card | CTA 1 Open in a new tab | Open in New Window | `new-window` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | CTA 2 Style | Secondary Button | `""` | Supported (in the model) | n/a (default) |
| card | CTA 2 Style | Secondary Button (no arrow) | `secondary-no-arrow` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | CTA 2 Style | Primary Button | `primary` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | CTA 2 Style | Primary Button (no arrow) | `primary-no-arrow` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | CTA 2 Style | Text link | `tertiary` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | CTA 2 Open in a new tab | Default | `""` | Supported (in the model) | n/a (default) |
| card | CTA 2 Open in a new tab | Open in New Window | `new-window` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Card style | As the block | `""` | Supported (in the model) | n/a (default) |
| card | Card style | Image card | `image` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Card style | Panel | `panel` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Card style | Report | `report` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Card style | Statistic | `stat` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Card colour | As the block | `""` | Supported (in the model) | n/a (default) |
| card | Card colour | Dark | `dark` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Card colour | Navy | `navy` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Card colour | Brand blue | `brand` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Card colour | Light blue | `brand-light` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Card colour | Light grey | `grey` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Card colour | Mid grey | `mid-grey` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Card colour | Grey gradient | `gradient` | Supported (in the model) | Not checkable (data attribute / field value) |
| card | Card colour | Image background | `image` | Supported (in the model) | Not checkable (data attribute / field value) |

## Narrative (block README)

All variations are configurations of the same block (block classes set by `applyCardListLayout`); the List shares them (see the [List README](https://github.com/sradha-tcs/tcs-corp/blob/main/blocks/list/README.md)). Personalization and fallback are the same for all: no personalization; the authored configuration renders.

#### Image cards (Card style Image card, default)

- **Purpose / when to use:** cards with a photo: services, insights, case studies. Not for statistics or text-only cards.
- **Fields:** Image (with alt text) and Title recommended; Eyebrow or Tags, Description, Content type, Date, Reading time, Link and Call to action label optional.
- **Dialog:** Display as teaser on, Card style Image card; Image ratio 16:9, 1:1, 4:3 or 3:2.
- **Rendering:** `article.list-card.list-card-image`: image, kicker (eyebrow, else up to 3 tags, then the reading time), title, description, meta row (content type and date), optional call to action (text link). **Hover (Figma):** hovering or focusing anywhere on a linked image card fades its title from `--color-text-neutral` (#303030) to `--color-text-brand` (#216AC3) with an underline, 300ms ease-out (`--list-hover-duration`, `--list-hover-easing`), and back on leave; the underline is always drawn transparent and only changes colour, so the card, its padding and image don't move or resize. On dark backgrounds the theme contract's light brand colour is used. Cards without a link have no hover; panel, report and statistic cards keep their own hover (`styles/card-list.css`).
- **Responsive:** the grid columns or scroller per breakpoint; the image keeps its ratio (`aspect-ratio`).
- **Accessibility:** decorative image with an empty alt text; the title link or call to action is the only link; inside dark Sections / Columns Containers the text turns light.
- **Data layer:** `xdm:variant: image`; card clicks `interaction: card`.

```text
[Screenshot Placeholder]

File name:
cards-image-tablet.png

Purpose:
Image cards at 1024px (Tablet columns 4 by default) with kicker, title, description and meta row.

Annotations:
A = Image
B = Kicker
C = Title
D = Meta row
```

#### Panel cards (Card style Panel)

- **Purpose / when to use:** themed panels linking to topic hubs; no image needed.
- **Fields:** Title, Description; Eyebrow (or the first tag); Link. Image only with Card colour Image background (the image covers the card).
- **Dialog:** Card style Panel; Card colour (default dark `#20293c`); Panel height Portrait (2:3), Compact (9:10) or Content.
- **Rendering:** `list-card-panel` with kicker, title, description and the call to action "Explore" (placeholder `explore`) unless a label is set or Show call to action is off.
- **Panel with CTA buttons (Figma "Ready for what comes next"):** a panel with CTA 1 or CTA 2 has the title at the top and, at the bottom (`div.list-card-bottom`), its Label (`p.list-card-subtitle`, 0.875rem semibold), the description and the buttons (`div.list-card-ctas`, stacked, 0.875rem, Secondary in the card's text colour). E.g. Card colour Light grey, Title size H2 (2.5rem from 900px), Desktop columns 3. Panels without CTA buttons are unchanged (their Label isn't shown). A statistic card with CTA buttons has them in its bottom group too, below its Label and description (2rem between Label and description, the buttons 1.5rem below, 0.75rem apart, Figma "Content Section"); statistic cards without buttons are unchanged.
- **Responsive:** fixed shapes with `overflow: hidden` clip long texts; Panel height Content fits the text.
- **Accessibility:** the focus ring is drawn inside the card edge; check contrast on Brand blue and Image background.
- **Data layer:** `xdm:variant: panel`.

```text
[Screenshot Placeholder]

File name:
cards-panel-mobile.png

Purpose:
A panel card at 402px with the Explore action at the bottom.

Annotations:
A = Kicker
B = Title
C = Explore
```

#### Report cards (Card style Report)

- **Purpose / when to use:** report or download teasers.
- **Fields:** Title, Description, Content type (the kicker, e.g. Report), Link.
- **Dialog:** Card style Report (or Mixed with Content type "Report"); default colour the grey gradient.
- **Rendering:** `list-card-report`: kicker (content type, else eyebrow), title, description and the call to action "Download" (placeholder `download`) unless a label is set or Show call to action is off; it is a text link (`tertiary`), only statistic cards get a secondary button.
- **Responsive / accessibility / data layer:** as panels; `xdm:variant: report`.

```text
[Screenshot Placeholder]

File name:
cards-report-mobile.png

Purpose:
A report card at 402px with the Download call to action.

Annotations:
A = Report kicker
B = Title
C = Download call to action
```

#### Statistic cards (Card style Statistic)

- **Purpose / when to use:** "At a glance" figures; the Title holds the number.
- **Fields:** Title (the number, up to about 8 characters), Label, Description; Eyebrow optional.
- **Dialog:** Card style Statistic; default colour light grey; Style option **Compact statistic title** (`stat-compact`) for phrases instead of numbers.
- **Rendering:** `list-card-stat`: top (kicker, number), bottom (label, description); a call to action only with a label (secondary button).
- **Responsive:** the number is 5rem below 600px, 4rem from 600px and 6rem from 1200px; it scales down to fit narrow cards.
- **Accessibility:** the number is the card heading; add a Label and Description so it makes sense.
- **Data layer:** `xdm:variant: stat`.

```text
[Screenshot Placeholder]

File name:
cards-statistic-tablet.png

Purpose:
Statistic cards at 1024px with number, label and description.

Annotations:
A = Number (title)
B = Label
C = Description
```

#### Mixed (Card style Mixed)

- **Purpose / when to use:** a row combining image, panel and report cards.
- **Dialog:** Card style Mixed; each card takes its own Card style, else report for a Content type containing "report", image when it has an image, otherwise panel.
- **Data layer:** `xdm:variant: mixed`.

```text
[Screenshot Placeholder]

File name:
cards-mixed-mobile.png

Purpose:
Mixed cards at 402px: an image card, a panel and a report card stacked.

Annotations:
A = Image card
B = Panel
C = Report card
```

#### First card as feature

- **Purpose / when to use:** one spotlight card followed by smaller cards (Figma variation 2).
- **Fields:** the first Card's Image, Tags, Reading time and Title (the feature shows no description).
- **Dialog:** Display as teaser on, First card as feature on.
- **Rendering:** `article.list-feature` above the list, with the image behind the tags, reading time and title; the image is shown even with Show image off (unless that card hides it); no author lockup (Cards has no Author field).
- **Responsive:** minimum height 32.5rem below 600px, 27.1875rem from 600px, 35.625rem from 1200px.
- **Data layer:** the feature carries `data-cmp-id` of the first card and position 1.

```text
[Screenshot Placeholder]

File name:
cards-feature-mobile.png

Purpose:
The feature card at 402px above the remaining cards.

Annotations:
A = Feature image
B = Tags and reading time
C = Feature title
```

#### Rows of links (Display as teaser off)

- **Purpose / when to use:** news-style link lists (Figma variation 5) not driven by the query index.
- **Dialog:** Display as teaser off; Style option **Dividers between rows** (`dividers`) for lines between rows from 600px.
- **Rendering:** `article.list-row`: kicker (eyebrow, else content type, and the first tag), title link, description, date, a decorative circle arrow (`icons/circle-arrow.svg`, 48px box, #D9D9D9; hover or focus on the row turns it #1E1E1E over 300ms ease-out without movement, the title isn't underlined); no images, calls to action, styles, colours or feature.
- **Data layer:** `xdm:variant: links`.

```text
[Screenshot Placeholder]

File name:
cards-rows-of-links-tablet.png

Purpose:
Rows of links at 1024px with dividers.

Annotations:
A = Kicker
B = Title link
C = Arrow
D = Divider
```

#### Card colours

Dark, Navy, Brand blue, Light blue, Light grey, Mid grey, Grey gradient and Image background (`theme-{value}` on the card), for panel, report and statistic cards, set on the block or per Card. Buttons on Dark, Navy and Brand blue cards are inverted on hover and focus. The kicker of panel cards on the coloured fills (default, Dark, Navy, Brand blue) is #cdcdcd (`--slate-300`, Figma; `--list-card-kicker` in `styles/card-list.css`), apart from the description (70% white; 95% on Brand blue); the light colours and Image background keep their dark text. On Brand blue the kicker is 3.4:1, below WCAG AA: an approved exception to match Figma (decision log KB-D-070).

```text
[Screenshot Placeholder]

File name:
cards-colours-tablet.png

Purpose:
Panel cards in several Card colours at 1024px, one with the focus on its Explore link.

Annotations:
A = Dark
B = Brand blue
C = Image background
D = Focus ring
```

#### Grid and horizontal scroll per breakpoint

- **Purpose:** a grid (columns) or a rail (items visible or a fixed card width) on each of desktop (from 1200px), tablet (600–1199px) and mobile (below 600px); 8 combinations.
- **Options:** previous / next buttons and scroll indicator per breakpoint; scroll snap (start / center), hide scrollbar, mouse drag, keyboard scrolling, scroll step (one card / viewport), loop, initial item index, edge (bleed / inside the content width).
- **Rendering:** classes `{desktop,tablet,mobile}-{grid,scroll}`, `-controls`, `-indicator`, `snap`, `snap-{start,center}`, `hide-scrollbar`, `edge-bleed`, `equal-height`, `stretch`; custom properties `--list-{columns,gap,visible,card-width}-{bp}`.
- **Accessibility:** the scroller is a named region, focusable only while it overflows; Arrow Left / Right, Home, End scroll it; buttons are `aria-disabled` at the ends (Loop off) and keep the focus.
- **Data layer:** previous / next clicks `interaction: previous` / `next`.

```text
[Screenshot Placeholder]

File name:
cards-scroll-mobile-buttons-mobile.png

Purpose:
A mobile rail with previous / next buttons turned on (off by default on mobile) and the indicator.

Annotations:
A = Peeking next card
B = Indicator
C = Previous / Next
```

#### Style options

Compact statistic title (`stat-compact`), Dividers between rows (`dividers`), Header centred (`header-center`) and Impact cards (`impact-cards`), added as block classes.

#### Impact cards (Style option Impact cards, 12 November 2026)

- **Purpose / when to use:** a short row of outcomes ("Proven, Impact and Outcomes"): an image, a title and a short description per card, usually three.
- **Fields:** the block's Title (the section heading, e.g. Proven, Impact and Outcomes); per Card: Image, Title, Description. Eyebrow, tags, date and call to action still show when authored.
- **Dialog:** Card style Image (the default); Style options **Impact cards (proven impact and outcomes)**. Put the block in a section with Section Style Grey for the design's grey background.
- **Rendering:** the image cards (`list-card-image`) of a `.card-list.impact-cards` block are white cards with 1rem (`--radius-l`) rounded corners: the image fills the card's top (rounded top corners, the Image ratio, 16:9 by default), then the title and the description, centred, with 1.5rem side and bottom padding. The cards of a row have the same height (Stretch cards, on by default). The heading is 3rem above the cards from 600px (the lists' 5rem otherwise). Panel, report and statistic cards in the same block keep their own look. On the Dark / Dark green section colours, the cards stay white with dark text.
- **Responsive:** three cards per row from 600px, one per row below (`utils/card-list-config.js` `IMPACT_COLUMNS`; the Layout tab's Desktop / Tablet columns, when set, win); title 1.25rem, 1.5rem from 1200px; description 0.875rem.
- **Compatibility:** only blocks with the option get the class; Cards and Lists without it render as before (their columns, styles and markup are unchanged). The option is in the shared Style options, so a List can use it too.
- **Accessibility:** the title is the card heading (one level below the block's heading); linked cards keep the title link or the call to action as their one link.

#### Legacy cards (compatibility)

Cards authored before the redesign (Block Collection: an image and a rich text cell per card, or the rich text only) still render in the new design: the text's first heading (or a bold-only first paragraph) is the title, a link alone in the last paragraph is the call to action and the link, the rest is the description. Cards blocks created before the redesign have no block model and aren't key-value: Universal Editor shows no usable settings, so they use the defaults (image cards, 4 / 4 / 1 columns). Replace such a block with a new Cards block (planned migration: `docs/proposals/cards-card-refactoring.md`). Not for new authoring.

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
