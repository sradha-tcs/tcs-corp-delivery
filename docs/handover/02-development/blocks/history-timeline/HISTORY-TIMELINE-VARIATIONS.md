---
id: "DEV-V-history-timeline"
title: "History Timeline Block — Variations"
role: "Development"
topic: "variations"
audience: "Developers, technical leads, block owners, AI coding agents"
owner: "Technical Lead / Block Owner"
approver: "Product Owner (to be confirmed)"
version: "1.0"
status: "Draft for review"
lastUpdated: "2026-11-22"
lastValidated: "2026-11-22"
sourceFiles: ["blocks/history-timeline/_history-timeline.json"]
relatedComponents: ["history-timeline"]
relatedPages: []
confidence: "Medium"
primary: false
---

# History Timeline Block — Variations

| Attribute | Value |
| --- | --- |
| Document ID | DEV-V-history-timeline |
| Audience | Developers, technical leads, block owners, AI coding agents |
| Purpose | Every option of the History Timeline block's dialog that changes its presentation, and whether the block library shows it |
| Scope | — |
| Prerequisites | — |
| Owner | Technical Lead / Block Owner (proposed) |
| Approver | Product Owner (to be confirmed) |
| Version | 1.0 |
| Status | Draft for review |
| Last updated | 22 November 2026 |
| Last validated | 22 November 2026 |
| Source files | blocks/history-timeline/_history-timeline.json |
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
| `history-timeline` | Milestone heading level (`headingLevel`) | Style | No | H2 = `h2`; H3 = `h3`; H4 = `h4`; H5 = `h5`; H6 = `h6` | `h3` |

## Matrix

Status: every option is supported by the model and the code that reads it. "In the block library" compares the option's class with the classes of the History Timeline blocks on the published block library pages (0 pages); options stored as data or field values can't be checked from the classes.

| Component | Field | Option | Value | Status | In the block library |
| --- | --- | --- | --- | --- | --- |
| history-timeline | Milestone heading level | H2 | `h2` | Supported (in the model) | Not checkable (data attribute / field value) |
| history-timeline | Milestone heading level | H3 | `h3` | Supported (in the model) | Not checkable (data attribute / field value) |
| history-timeline | Milestone heading level | H4 | `h4` | Supported (in the model) | Not checkable (data attribute / field value) |
| history-timeline | Milestone heading level | H5 | `h5` | Supported (in the model) | Not checkable (data attribute / field value) |
| history-timeline | Milestone heading level | H6 | `h6` | Supported (in the model) | Not checkable (data attribute / field value) |

## Narrative (block README)

#### Default

The Figma design: eight milestones, staggered cards, "The story continues" closing panel.

#### With CTAs

A milestone with a CTA Link shows it under its description as a link button (semibold, underlined, with a chevron). The Figma frame has no CTA: its style is the site's link button.

#### Custom or hidden closing panel

Closing panel sets the panel's text; Hide closing panel (Style tab) removes it.

#### Without images

A milestone without an image holds its text only (aligned at the bottom of its card on desktop).

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
