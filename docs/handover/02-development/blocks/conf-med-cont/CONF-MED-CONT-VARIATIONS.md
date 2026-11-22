---
id: "DEV-V-conf-med-cont"
title: "Configurable Media Contacts Block — Variations"
role: "Development"
topic: "variations"
audience: "Developers, technical leads, block owners, AI coding agents"
owner: "Technical Lead / Block Owner"
approver: "Product Owner (to be confirmed)"
version: "1.0"
status: "Draft for review"
lastUpdated: "2026-11-22"
lastValidated: "2026-11-22"
sourceFiles: ["blocks/conf-med-cont/_conf-med-cont.json"]
relatedComponents: ["conf-med-cont"]
relatedPages: ["/language-master/en/block-library/conf-med-cont","/language-master/en/block-library/conf-med-cont/conf-med-cont-variations"]
confidence: "Medium"
primary: false
---

# Configurable Media Contacts Block — Variations

| Attribute | Value |
| --- | --- |
| Document ID | DEV-V-conf-med-cont |
| Audience | Developers, technical leads, block owners, AI coding agents |
| Purpose | Every option of the Configurable Media Contacts block's dialog that changes its presentation, and whether the block library shows it |
| Scope | — |
| Prerequisites | — |
| Owner | Technical Lead / Block Owner (proposed) |
| Approver | Product Owner (to be confirmed) |
| Version | 1.0 |
| Status | Draft for review |
| Last updated | 22 November 2026 |
| Last validated | 22 November 2026 |
| Source files | blocks/conf-med-cont/_conf-med-cont.json |
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
| `conf-med-cont` | Media contacts title type (`media-contacts-title-type`) | Content | No | H1 = `h1`; H2 = `h2`; H3 = `h3`; H4 = `h4`; H5 = `h5`; H6 = `h6`; Media contacts big title = `media-contacts-big-title`; Media contacts small title = `media-contacts-small-title` | — |

## Matrix

Status: every option is supported by the model and the code that reads it. "In the block library" compares the option's class with the classes of the Configurable Media Contacts blocks on the published block library pages (2 pages); options stored as data or field values can't be checked from the classes.

| Component | Field | Option | Value | Status | In the block library |
| --- | --- | --- | --- | --- | --- |
| conf-med-cont | Media contacts title type | H1 | `h1` | Supported (in the model) | Not checkable (data attribute / field value) |
| conf-med-cont | Media contacts title type | H2 | `h2` | Supported (in the model) | Not checkable (data attribute / field value) |
| conf-med-cont | Media contacts title type | H3 | `h3` | Supported (in the model) | Not checkable (data attribute / field value) |
| conf-med-cont | Media contacts title type | H4 | `h4` | Supported (in the model) | Not checkable (data attribute / field value) |
| conf-med-cont | Media contacts title type | H5 | `h5` | Supported (in the model) | Not checkable (data attribute / field value) |
| conf-med-cont | Media contacts title type | H6 | `h6` | Supported (in the model) | Not checkable (data attribute / field value) |
| conf-med-cont | Media contacts title type | Media contacts big title | `media-contacts-big-title` | Supported (in the model) | Not checkable (data attribute / field value) |
| conf-med-cont | Media contacts title type | Media contacts small title | `media-contacts-small-title` | Supported (in the model) | Not checkable (data attribute / field value) |

## Narrative (block README)

#### Title types

H1 to H6 set the heading level (the region names one level below); Media contacts big title and small title are H2s in a bigger or smaller style.

#### Region actions

Each region of a config row has its own action (table above), so one block can show e-mail only for one region and names, descriptions, e-mail and phone for another.

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
