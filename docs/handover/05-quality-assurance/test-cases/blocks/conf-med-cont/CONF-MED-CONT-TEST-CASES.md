---
id: "QA-TC-conf-med-cont"
title: "Configurable Media Contacts — Test Cases"
role: "Quality assurance"
topic: "test cases"
audience: "QA lead, testers, release lead"
owner: "QA Lead"
approver: "Product Owner (to be confirmed)"
version: "1.0"
status: "Draft for review"
lastUpdated: "2026-11-22"
lastValidated: "2026-11-22"
sourceFiles: ["blocks/conf-med-cont/_conf-med-cont.json"]
relatedComponents: ["conf-med-cont"]
relatedPages: []
confidence: "Medium"
primary: false
---

# Configurable Media Contacts — Test Cases

| Attribute | Value |
| --- | --- |
| Document ID | QA-TC-conf-med-cont |
| Audience | QA lead, testers, release lead |
| Purpose | Test cases of the Configurable Media Contacts block (derived from its model) with their execution status |
| Scope | — |
| Prerequisites | — |
| Owner | QA Lead (proposed) |
| Approver | Product Owner (to be confirmed) |
| Version | 1.0 |
| Status | Draft for review |
| Last updated | 22 November 2026 |
| Last validated | 22 November 2026 |
| Source files | blocks/conf-med-cont/_conf-med-cont.json |
| Related documents | — |
| Related AEM paths | — |

## Contents

- [Test cases (8)](#test-cases-8)
- [Screenshots](#screenshots)
- [Known limitations](#known-limitations)
- [Open items](#open-items)
- [Change history](#change-history)

## Test cases (8)

Requirement / story: see the [traceability](../../../markdown/REQUIREMENT-TEST-TRACEABILITY.md). Status values: Passed and Failed only for checks that ran with evidence; otherwise Not Run, Blocked, Not Applicable or Requires Manual Validation.

| ID | Kind | Variation | Objective | Steps | Expected | Status | Actual | Environment | Evidence | Defect | Tester | Date |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| TC-CONF-MED-CONT-001 | Functional (smoke) | — | Configurable Media Contacts renders on its block library page | 1. Open the block library page of the block on the live site 2. Wait for the page to load | The page answers 200, every example renders, no console error, no failed request | Passed | 2 pages: 200 at 4 widths, no console error, no failed request | Edge Delivery live, Chromium (Playwright) | execution-results evidence.json | — | Automated (documentation program) | 22 November 2026 |
| TC-CONF-MED-CONT-002 | Authoring | — | An author adds the Configurable Media Contacts and fills in its required fields | 1. Open a test page in Universal Editor 2. Add the Configurable Media Contacts from the component palette 3. Fill in the fields of each tab 4. Preview | The block appears with the authored content; no empty placeholder remains | Not Run | — | — | — | — | — | — |
| TC-CONF-MED-CONT-003 | Component variation | Media contacts title type | Configurable Media Contacts: each choice of "Media contacts title type" gives its presentation | 1. Select the Configurable Media Contacts 2. Set "Media contacts title type" to each of: H1, H2, H3, H4, H5, H6, Media contacts big title, Media contacts small title 3. Preview after each change | The rendering matches the variation (class or attribute h1, h2, h3, h4, h5, h6, ...) | Not Run | — | — | — | — | — | — |
| TC-CONF-MED-CONT-004 | Boundary | — | Configurable Media Contacts with optional fields left empty | 1. Add the block and fill in only the required fields 2. Preview | The block renders without empty wrappers or broken layout | Not Run | — | — | — | — | — | — |
| TC-CONF-MED-CONT-005 | Negative | — | Configurable Media Contacts with invalid content (very long text, missing image, broken link) | 1. Enter a 300-character title 2. Remove the image 3. Link to a missing page 4. Preview | Text wraps, no broken image icon, the link is flagged in the link check | Not Run | — | — | — | — | — | — |
| TC-CONF-MED-CONT-006 | Accessibility | — | Configurable Media Contacts meets WCAG 2.1 AA | 1. Navigate the block with the keyboard only 2. Check focus visibility, names of buttons and links, alt text, heading order 3. Run a screen reader on the block | Every control is reachable and named; no heading level is skipped; images have alt text or are decorative | Requires Manual Validation | Automated DOM checks flagged 1 page(s): /language-master/en/block-library/conf-med-cont: 0 img without alt, 0 unnamed buttons, 1 heading skips, 0 duplicate ids | Edge Delivery live, Chromium (Playwright) | evidence.json | — | — | — |
| TC-CONF-MED-CONT-007 | Responsive | — | Configurable Media Contacts at 375, 768, 1024 and 1440 px | 1. Open the block library page at each width | No horizontal overflow; layout follows the responsive rules of the README | Passed | No horizontal overflow at 375, 768, 1024, 1440 px on 2 pages | Edge Delivery live, Chromium (Playwright) | screenshots in the block folder | — | Automated (documentation program) | 22 November 2026 |
| TC-CONF-MED-CONT-008 | Error recovery | — | Configurable Media Contacts when a dependency fails (sheet, index, media) | 1. Block the placeholders or query index request in the browser 2. Reload | The block shows its English fallback or empty state and the page keeps working | Not Run | — | — | — | — | — | — |

## Screenshots

No screenshot belongs to this document (it describes code, configuration or process). Evidence screenshots are listed in the [screenshot register](../../../../SCREENSHOT-REGISTER.md).

## Known limitations

- None recorded for this document.

## Open items

- None.

## Change history

| Version | Date | Author | Change |
| --- | --- | --- | --- |
| 1.0 | 22 November 2026 | Delivery team (documentation program) | First version of the role-specific documentation (master documentation prompt), generated from the repository and the published reference pages |
