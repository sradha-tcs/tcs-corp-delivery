---
id: "DEV-T-history-timeline"
title: "History Timeline Block — Test Coverage"
role: "Development"
topic: "tests"
audience: "Developers, technical leads, block owners, AI coding agents"
owner: "Technical Lead / Block Owner"
approver: "Product Owner (to be confirmed)"
version: "1.0"
status: "Draft for review"
lastUpdated: "2026-11-22"
lastValidated: "2026-11-22"
sourceFiles: []
relatedComponents: ["history-timeline"]
relatedPages: []
confidence: "Medium"
primary: false
---

# History Timeline Block — Test Coverage

| Attribute | Value |
| --- | --- |
| Document ID | DEV-T-history-timeline |
| Audience | Developers, technical leads, block owners, AI coding agents |
| Purpose | Unit tests, automated reference-page checks and manual test guidance for the block |
| Scope | — |
| Prerequisites | — |
| Owner | Technical Lead / Block Owner (proposed) |
| Approver | Product Owner (to be confirmed) |
| Version | 1.0 |
| Status | Draft for review |
| Last updated | 22 November 2026 |
| Last validated | 22 November 2026 |
| Source files | — |
| Related documents | — |
| Related AEM paths | — |

## Contents

- [Unit tests](#unit-tests)
- [Automated checks of the block library pages (executed 22 November 2026)](#automated-checks-of-the-block-library-pages-executed-22-november-2026)
- [Manual test guidance (block README)](#manual-test-guidance-block-readme)
- [Screenshots](#screenshots)
- [Known limitations](#known-limitations)
- [Open items](#open-items)
- [Change history](#change-history)

## Unit tests

No unit test is specific to this block (shared tests: test/models, test/items, test/docs, test/motion).

## Automated checks of the block library pages (executed 22 November 2026)

Per page: HTTP status and horizontal overflow at 375 / 768 / 1024 / 1440 px, console errors, failed requests and DOM accessibility checks at 1440 px (evidence: [screenshot register](../../../SCREENSHOT-REGISTER.md)).

No block library page.

## Manual test guidance (block README)

Check on `drafts/history-timeline.html` at 1600, 1440, 700 and 390px: the cards' sizes and baseline at desktop; the progress line at the start (one milestone's share) and the end (full); previous disabled at the start and next at the end; arrow keys, Home and End on the focused strip; the second timeline's CTAs, "More to come" panel and the milestone without an image; no horizontal page scroll on mobile.

Test cases: [05-quality-assurance/test-cases/blocks/history-timeline](../../../05-quality-assurance/test-cases/blocks/history-timeline/HISTORY-TIMELINE-TEST-CASES.md).

## Screenshots

No block library page: no evidence screenshot.

## Known limitations

- None recorded for this document.

## Open items

- None.

## Change history

| Version | Date | Author | Change |
| --- | --- | --- | --- |
| 1.0 | 22 November 2026 | Delivery team (documentation program) | First version of the role-specific documentation (master documentation prompt), generated from the repository and the published reference pages |
