---
id: "DEV-V-table-list"
title: "Table List Block — Variations"
role: "Development"
topic: "variations"
audience: "Developers, technical leads, block owners, AI coding agents"
owner: "Technical Lead / Block Owner"
approver: "Product Owner (to be confirmed)"
version: "1.0"
status: "Draft for review"
lastUpdated: "2026-11-22"
lastValidated: "2026-11-22"
sourceFiles: ["blocks/table-list/_table-list.json"]
relatedComponents: ["table-list"]
relatedPages: ["/design-block-master/en/block-library/table-list","/design-block-master/en/block-library/table-list/item-actions","/design-block-master/en/block-library/table-list/motion","/design-block-master/en/block-library/table-list/numbers","/design-block-master/en/block-library/table-list/numbers-on-mobile","/design-block-master/en/block-library/table-list/table-list"]
confidence: "Medium"
primary: false
---

# Table List Block — Variations

| Attribute | Value |
| --- | --- |
| Document ID | DEV-V-table-list |
| Audience | Developers, technical leads, block owners, AI coding agents |
| Purpose | Every option of the Table List block's dialog that changes its presentation, and whether the block library shows it |
| Scope | — |
| Prerequisites | — |
| Owner | Technical Lead / Block Owner (proposed) |
| Approver | Product Owner (to be confirmed) |
| Version | 1.0 |
| Status | Draft for review |
| Last updated | 22 November 2026 |
| Last validated | 22 November 2026 |
| Source files | blocks/table-list/_table-list.json |
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
| `table-list` | Variation (`variations`) | Content | No | Variation 1 - Title, description, arrow = `industries`; Variation 2 - Description, large title, button = `solutions`; Variation 3 - Description, number, large title, arrow = `products`; Variation 4 - Wide title, grey description, arrow (row hover) = `segments`; Variation 5 - Label, large description (steps) = `approach`; Variation 6 - Description, right-aligned title, small arrow = `platforms` | `industries` |
| `table-list` | Background color (`backgroundColor`) | Content | No | White (default) = `white`; Grey = `grey`; Black = `black`; Dark Green = `dark-green`; Navy = `navy` | `white` |
| `table-list` | Heading Type (`listHeadingType`) | Content | No | H1 = `h1`; H2 = `h2`; H3 = `h3`; H4 = `h4` | `h2` |
| `table-list` | Heading position (`headerPosition`) | Content | No | Above the list = `""`; Beside the list = `beside` | `` |
| `table-list` | Style (`ctaStyle`) | Content | No | Variation default = `""`; Filled button = `primary`; Outline button = `secondary`; Text link = `tertiary` | `` |
| `table-list` | Numbers (`numbers`) | Items | No | Variation default = `""`; Show = `show`; Show on mobile only = `mobile`; Hide = `hide` | `` |
| `table-list` | Item link (`itemAction`) | Items | No | Variation default = `""`; Arrow = `arrow`; Diagonal arrow = `arrow-up-right`; Circled arrow = `arrow-circle`; Button = `button` | `` |
| `table-list-card` | Trademark (`trademark`) | — | No | None = `""`; ™ Trademark = `tm`; ® Registered = `r` | `` |

## Matrix

Status: every option is supported by the model and the code that reads it. "In the block library" compares the option's class with the classes of the Table List blocks on the published block library pages (6 pages); options stored as data or field values can't be checked from the classes.

| Component | Field | Option | Value | Status | In the block library |
| --- | --- | --- | --- | --- | --- |
| table-list | Variation | Variation 1 - Title, description, arrow | `industries` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Variation | Variation 2 - Description, large title, button | `solutions` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Variation | Variation 3 - Description, number, large title, arrow | `products` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Variation | Variation 4 - Wide title, grey description, arrow (row hover) | `segments` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Variation | Variation 5 - Label, large description (steps) | `approach` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Variation | Variation 6 - Description, right-aligned title, small arrow | `platforms` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Background color | White (default) | `white` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Background color | Grey | `grey` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Background color | Black | `black` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Background color | Dark Green | `dark-green` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Background color | Navy | `navy` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Heading Type | H1 | `h1` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Heading Type | H2 | `h2` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Heading Type | H3 | `h3` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Heading Type | H4 | `h4` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Heading position | Above the list | `""` | Supported (in the model) | n/a (default) |
| table-list | Heading position | Beside the list | `beside` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Style | Variation default | `""` | Supported (in the model) | n/a (default) |
| table-list | Style | Filled button | `primary` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Style | Outline button | `secondary` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Style | Text link | `tertiary` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Numbers | Variation default | `""` | Supported (in the model) | n/a (default) |
| table-list | Numbers | Show | `show` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Numbers | Show on mobile only | `mobile` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Numbers | Hide | `hide` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Item link | Variation default | `""` | Supported (in the model) | n/a (default) |
| table-list | Item link | Arrow | `arrow` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Item link | Diagonal arrow | `arrow-up-right` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Item link | Circled arrow | `arrow-circle` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list | Item link | Button | `button` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list-card | Trademark | None | `""` | Supported (in the model) | n/a (default) |
| table-list-card | Trademark | ™ Trademark | `tm` | Supported (in the model) | Not checkable (data attribute / field value) |
| table-list-card | Trademark | ® Registered | `r` | Supported (in the model) | Not checkable (data attribute / field value) |

## Narrative (block README)

Personalization and fallback are the same for all: no personalization; the authored content renders.

#### Variation 1 - Industries (`industries`, default)

- **Purpose / when to use:** a list of industries or capabilities with a title, a short description and an arrow.
- **Fields:** Title, Description, Link per item; Heading and call to action.
- **Dialog:** Variation 1; defaults: Style filled button, Numbers on mobile only, Item link Arrow.
- **Rendering:** rows `main | description | action`; no divider below the last row.
- **Responsive:** below 600px number and title above the description (the description in larger type); from 600px three columns; from 1200px the block is inset (`padding-inline: var(--space-2000)`) and the title emphasised (1.75rem semibold).
- **Accessibility:** arrow link "Explore {title}" covers the row.
- **Data layer:** clicks `interaction: link`.

```text
[Screenshot Placeholder]

File name:
table-list-industries-tablet.png

Purpose:
Variation 1 at 768px: title, description and arrow in three columns, no numbers (mobile only).

Annotations:
A = Title
B = Description
C = Arrow
```

#### Variation 2 - Solutions (`solutions`)

- **Purpose / when to use:** transformation solutions with a large name and an explicit "Explore" button.
- **Fields:** Title (up to about 25 characters recommended), Description, Link; Button text optional.
- **Dialog:** Variation 2; defaults: Style outline button, Numbers hidden, Item link Button.
- **Rendering:** `description | main | action`; title right-aligned from 600px; outline button `secondary`.
- **Responsive:** stacked below 600px; title 2.5rem below 1200px, 4rem from 1200px.
- **Accessibility:** button named "{text}: {title}".
- **Data layer:** button clicks `interaction: link`, `dc:title` the accessible name.

```text
[Screenshot Placeholder]

File name:
table-list-solutions-tablet.png

Purpose:
Variation 2 at 768px: description, right-aligned title and the Explore button.

Annotations:
A = Description
B = Title
C = Explore button
```

#### Variation 3 - Products (`products`)

- **Purpose / when to use:** products and platforms with numbers and trademark signs.
- **Fields:** Title (up to about 15 characters recommended), Trademark, Description, Link; Number optional.
- **Dialog:** Variation 3; defaults: Style text link, Numbers shown, Item link Diagonal arrow.
- **Rendering:** `description | main | action` with 2px light grey dividers; the number in `--slate-500` (3:1 for large text).
- **Responsive:** title 3rem below 600px, 3.5rem from 600px, 5.625rem from 1200px; desktop columns 476 : 695 : auto.
- **Accessibility:** diagonal arrow link "Explore {title}" (the trademark sign isn't part of the name).
- **Data layer:** clicks `interaction: link`.

```text
[Screenshot Placeholder]

File name:
table-list-products-tablet.png

Purpose:
Variation 3 at 768px: description, number and large title with trademark, diagonal arrow.

Annotations:
A = Description
B = Number
C = Title with trademark
D = Diagonal arrow
```

#### Call to action style, Numbers and Item link options

Style (Filled button `primary`, Outline button `secondary`, Text link `tertiary`), Numbers (Show, Show on mobile only, Hide: class `numbers-{show,mobile,hide}`) and Item link (Arrow, Diagonal arrow, Button) can be combined with any variation; "Variation default" keeps the variation's value.

#### Legacy Motion Type

Lists authored before the Additional tab's Animation Type have a stored Motion Type (`motion`): Fade, Slide and Reveal are applied as Animation Type Fade in, Slide up and Fade up, at Motion Speed Slow unless a speed is set (`addLegacyMotion`), and only when no Animation Type is set. Not for new authoring: use the Additional tab.

#### Legacy header item

Lists created before the heading and call to action were block fields have a header row (heading | link; the former "Table List Header" component, no longer offered). It is still read: its heading when the block Heading is empty, its link when the block Link and Text are empty. Not for new authoring.

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
