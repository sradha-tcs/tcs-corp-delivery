---
id: "AUT-C-history-timeline"
title: "History Timeline — Authoring Guide"
role: "Authoring"
topic: "component authoring"
audience: "Content authors, content managers, AEM authoring leads"
owner: "Content Lead / AEM Authoring Lead"
approver: "Product Owner (to be confirmed)"
version: "1.0"
status: "Draft for review"
lastUpdated: "2026-11-22"
lastValidated: "2026-11-22"
sourceFiles: ["blocks/history-timeline/README.md","blocks/history-timeline/_history-timeline.json"]
relatedComponents: ["history-timeline"]
relatedPages: []
confidence: "Medium"
primary: true
---

# History Timeline — Authoring Guide

| Attribute | Value |
| --- | --- |
| Document ID | AUT-C-history-timeline |
| Audience | Content authors, content managers, AEM authoring leads |
| Purpose | How to add, fill in and check the History Timeline component |
| Scope | — |
| Prerequisites | — |
| Owner | Content Lead / AEM Authoring Lead (proposed) |
| Approver | Product Owner (to be confirmed) |
| Version | 1.0 |
| Status | Draft for review |
| Last updated | 22 November 2026 |
| Last validated | 22 November 2026 |
| Source files | blocks/history-timeline/README.md, blocks/history-timeline/_history-timeline.json |
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

Add a History Timeline to a section, then add one **Milestone** per step of the story with Add, in chronological order. The block's **Start label** and **End label** (Content tab) label the two ends of the line above the strip (for example 1968 and Today); left empty, they show the first and the last milestone's Year. A milestone needs at least a year, a title, a description or an image to be shown; a milestone just added shows as a placeholder in the editor until it has one.

## Authorable Fields

<!-- BEGIN GENERATED: fields (npm run build:docs) -->

#### History Timeline (`history-timeline`)

Model `history-timeline`; template name "History Timeline" (the block class AEM renders); key-value block (one row per property); children: `history-timeline-item`.

Stored on a new component (definition template): `headingLevel` = `"h3"`.

##### Content tab — History Timeline

| Field label | Property | Type | Required | Default | Allowed values | Author guidance | Example |
| ----------- | -------- | ---- | -------- | ------- | -------------- | --------------- | ------- |
| Start label | `startLabel` | text | No | — | — | The left end of the timeline line, e.g. 1968. Leave empty for the first milestone’s year. | — |
| End label | `endLabel` | text | No | — | — | The right end of the timeline line, e.g. Today. Leave empty for the last milestone’s year. | — |
| Closing panel | `closingLabel` | text | No | — | — | Shown after the last milestone. Leave empty for “The story continues”. | — |

##### Style tab — History Timeline

| Field label | Property | Type | Required | Default | Allowed values | Author guidance | Example |
| ----------- | -------- | ---- | -------- | ------- | -------------- | --------------- | ------- |
| Milestone heading level | `headingLevel` | select | No | `h3` | H2 (`h2`), H3 (`h3`), H4 (`h4`), H5 (`h5`), H6 (`h6`) | The heading level of each milestone title; choose the level after the heading above the timeline. | — |
| Hide closing panel | `hideClosing` | boolean | No | `false` | on / off | — | — |

##### Additional tab — History Timeline

| Field label | Property | Type | Required | Default | Allowed values | Author guidance | Example |
| ----------- | -------- | ---- | -------- | ------- | -------------- | --------------- | ------- |
| Anchor ID | `classes_anchor` | text | No | — | regExp: ^anchor-[a-z0-9][a-z0-9-]*$; customErrorMsg: Start with anchor-, then lower-case letters, digits and hyphens. | A unique ID of the block on the page, starting with anchor-, e.g. anchor-our-services; link to it with #anchor-our-services. Delivered as a block class. | — |
| Hide block | `classes_hideblock` | boolean | No | `false` | on / off | Hides the whole block on the page until it is turned off (shown faded in the editor). Delivered as a block class. | — |
| Animation Type | `classes_animation` | select | No | "" | None (""), Fade in (`motion-fade-in`), Fade up (`motion-fade-up`), Fade down (`motion-fade-down`), Fade left (`motion-fade-left`), Fade right (`motion-fade-right`), Slide up (`motion-slide-up`), Slide down (`motion-slide-down`), Slide left (`motion-slide-left`), Slide right (`motion-slide-right`), Scale in (`motion-scale-in`) | How the block's content appears; repeated items (cards, list items, accordion items, columns) appear one after another. None: shown as is. Not played in the editor or when the visitor prefers reduced motion. Delivered as a block class. | — |
| Motion Speed | `classes_animationspeed` | select | No | "" | Medium (""), Fast (`motion-fast`), Slow (`motion-slow`) | How fast the animation runs: 0.3, 0.6 or 0.9 seconds. Shown when `classes_animation` is set and `classes_animation` is not empty. Delivered as a block class. | — |
| Animation Trigger | `classes_animationtrigger` | select | No | "" | On Scroll / Viewport Entry (""), On Page Load (`motion-on-load`) | When the block's animations run. On Scroll: when the block comes into view (at once if it is in view when the page opens). On Page Load: as soon as the block is ready, wherever it is on the page. Shown when `classes_animation` is set and `classes_animation` is not empty. Delivered as a block class. | — |
| Padding left | `classes_paddingleft` | select | No | "" | Default (""), 0 (none) (`pl-0`), 0.25rem (space-100) (`pl-100`), 0.5rem (space-200) (`pl-200`), 0.75rem (space-300) (`pl-300`), 1rem (space-400) (`pl-400`), 1.25rem (space-500) (`pl-500`), 1.5rem (space-600) (`pl-600`), 2rem (space-800) (`pl-800`), 2.5rem (space-1000) (`pl-1000`), 3rem (space-1200) (`pl-1200`), 4rem (space-1600) (`pl-1600`), 5rem (space-2000) (`pl-2000`), 6rem (space-2400) (`pl-2400`), 7.5rem (space-3000) (`pl-3000`) | Delivered as a block class. | — |
| Padding right | `classes_paddingright` | select | No | "" | Default (""), 0 (none) (`pr-0`), 0.25rem (space-100) (`pr-100`), 0.5rem (space-200) (`pr-200`), 0.75rem (space-300) (`pr-300`), 1rem (space-400) (`pr-400`), 1.25rem (space-500) (`pr-500`), 1.5rem (space-600) (`pr-600`), 2rem (space-800) (`pr-800`), 2.5rem (space-1000) (`pr-1000`), 3rem (space-1200) (`pr-1200`), 4rem (space-1600) (`pr-1600`), 5rem (space-2000) (`pr-2000`), 6rem (space-2400) (`pr-2400`), 7.5rem (space-3000) (`pr-3000`) | Delivered as a block class. | — |
| Padding top | `classes_paddingtop` | select | No | "" | Default (""), 0 (none) (`pt-0`), 0.25rem (space-100) (`pt-100`), 0.5rem (space-200) (`pt-200`), 0.75rem (space-300) (`pt-300`), 1rem (space-400) (`pt-400`), 1.25rem (space-500) (`pt-500`), 1.5rem (space-600) (`pt-600`), 2rem (space-800) (`pt-800`), 2.5rem (space-1000) (`pt-1000`), 3rem (space-1200) (`pt-1200`), 4rem (space-1600) (`pt-1600`), 5rem (space-2000) (`pt-2000`), 6rem (space-2400) (`pt-2400`), 7.5rem (space-3000) (`pt-3000`) | Delivered as a block class. | — |
| Padding bottom | `classes_paddingbottom` | select | No | "" | Default (""), 0 (none) (`pb-0`), 0.25rem (space-100) (`pb-100`), 0.5rem (space-200) (`pb-200`), 0.75rem (space-300) (`pb-300`), 1rem (space-400) (`pb-400`), 1.25rem (space-500) (`pb-500`), 1.5rem (space-600) (`pb-600`), 2rem (space-800) (`pb-800`), 2.5rem (space-1000) (`pb-1000`), 3rem (space-1200) (`pb-1200`), 4rem (space-1600) (`pb-1600`), 5rem (space-2000) (`pb-2000`), 6rem (space-2400) (`pb-2400`), 7.5rem (space-3000) (`pb-3000`) | Delivered as a block class. | — |
| Margin left | `classes_marginleft` | select | No | "" | Default (""), 0 (none) (`ml-0`), 0.25rem (space-100) (`ml-100`), 0.5rem (space-200) (`ml-200`), 0.75rem (space-300) (`ml-300`), 1rem (space-400) (`ml-400`), 1.25rem (space-500) (`ml-500`), 1.5rem (space-600) (`ml-600`), 2rem (space-800) (`ml-800`), 2.5rem (space-1000) (`ml-1000`), 3rem (space-1200) (`ml-1200`), 4rem (space-1600) (`ml-1600`), 5rem (space-2000) (`ml-2000`), 6rem (space-2400) (`ml-2400`), 7.5rem (space-3000) (`ml-3000`) | Delivered as a block class. | — |
| Margin right | `classes_marginright` | select | No | "" | Default (""), 0 (none) (`mr-0`), 0.25rem (space-100) (`mr-100`), 0.5rem (space-200) (`mr-200`), 0.75rem (space-300) (`mr-300`), 1rem (space-400) (`mr-400`), 1.25rem (space-500) (`mr-500`), 1.5rem (space-600) (`mr-600`), 2rem (space-800) (`mr-800`), 2.5rem (space-1000) (`mr-1000`), 3rem (space-1200) (`mr-1200`), 4rem (space-1600) (`mr-1600`), 5rem (space-2000) (`mr-2000`), 6rem (space-2400) (`mr-2400`), 7.5rem (space-3000) (`mr-3000`) | Delivered as a block class. | — |
| Margin top | `classes_margintop` | select | No | "" | Default (""), 0 (none) (`mt-0`), 0.25rem (space-100) (`mt-100`), 0.5rem (space-200) (`mt-200`), 0.75rem (space-300) (`mt-300`), 1rem (space-400) (`mt-400`), 1.25rem (space-500) (`mt-500`), 1.5rem (space-600) (`mt-600`), 2rem (space-800) (`mt-800`), 2.5rem (space-1000) (`mt-1000`), 3rem (space-1200) (`mt-1200`), 4rem (space-1600) (`mt-1600`), 5rem (space-2000) (`mt-2000`), 6rem (space-2400) (`mt-2400`), 7.5rem (space-3000) (`mt-3000`) | Delivered as a block class. | — |
| Margin bottom | `classes_marginbottom` | select | No | "" | Default (""), 0 (none) (`mb-0`), 0.25rem (space-100) (`mb-100`), 0.5rem (space-200) (`mb-200`), 0.75rem (space-300) (`mb-300`), 1rem (space-400) (`mb-400`), 1.25rem (space-500) (`mb-500`), 1.5rem (space-600) (`mb-600`), 2rem (space-800) (`mb-800`), 2.5rem (space-1000) (`mb-1000`), 3rem (space-1200) (`mb-1200`), 4rem (space-1600) (`mb-1600`), 5rem (space-2000) (`mb-2000`), 6rem (space-2400) (`mb-2400`), 7.5rem (space-3000) (`mb-3000`) | Delivered as a block class. | — |

#### Milestone (`history-timeline-item`)

Model `history-timeline-item`; template name "Milestone" (the block class AEM renders).

##### Milestone tab — Milestone

| Field label | Property | Type | Required | Default | Allowed values | Author guidance | Example |
| ----------- | -------- | ---- | -------- | ------- | -------------- | --------------- | ------- |
| Year | `year` | text | No | — | — | e.g. 1968 or Today. The first and last milestones’ years label the timeline line. | — |
| Title | `title` | text | No | — | — | — | — |
| Description | `description` | richtext | No | "" | — | — | — |
| Image | `image` | reference | No | — | — | — | — |
| Image Alt Text | `imageAlt` | text | No | — | — | Describe the image; leave empty when it is decorative. Delivered with `image` (field collapse). | — |
| CTA Link | `link` | aem-content | No | — | — | Optional: a page or URL the milestone links to. | — |
| CTA Text | `linkText` | text | No | — | — | e.g. Learn more. Delivered with `link` (field collapse). | — |

<!-- END GENERATED: fields -->

Notes:

- **Image Alt Text** collapses into the image and **CTA Text** into the CTA Link (AEM delivery rules): they are delivered as the image's alt and the link's text.
- **Milestone heading level** applies to every milestone title of the block (H3 by default). Choose the level after the heading above the timeline so the page's heading hierarchy doesn't skip a level.
- **Start label** / **End label** empty: the first / last milestone's Year. The year row is shown when both ends have a label.
- Figma layer → field: Header "Year label" 1968 → Start label; "Year label" Today → End label; Article "Date column" → Year; "Content column" → Title and Description; "Figure" → Image and Image Alt Text; "Story continues" → Closing panel. The year row line and the previous / next buttons aren't authored.
- **Closing panel** empty: the panel shows the placeholder `historyTimelineEnd` ("The story continues").

## Screenshot-Based Authoring Steps

#### Authoring Step 1: Add the History Timeline

Not recorded: no Universal Editor screenshots were taken (Blocked: author access).

#### Values to Enter

| Field | Value |
| --- | --- |
| Component | History Timeline (in the section's Add menu) |
| Start label | 1968 |
| End label | Today |
| Closing panel | The story continues |
| Milestone heading level | H3 (a heading H2 above the block) |

#### Authoring Step 2: Add the milestones

Not recorded: no Universal Editor screenshots were taken (Blocked: author access).

#### Values to Enter

| Field | Value |
| --- | --- |
| Year | 1968 |
| Title | An idea takes shape |
| Description | Mr. Fakir Chand Kohli, fondly known as the Father of Indian IT, brings together a young team … |
| Image | A portrait from the DAM |
| Image Alt Text | Portrait of F. C. Kohli |
| CTA Link / CTA Text | Optional, e.g. /about and Learn more |

## Variations

#### Default

The Figma design: eight milestones, staggered cards, "The story continues" closing panel.

#### With CTAs

A milestone with a CTA Link shows it under its description as a link button (semibold, underlined, with a chevron). The Figma frame has no CTA: its style is the site's link button.

#### Custom or hidden closing panel

Closing panel sets the panel's text; Hide closing panel (Style tab) removes it.

#### Without images

A milestone without an image holds its text only (aligned at the bottom of its card on desktop).

## Complete Authoring Example

The test page `drafts/history-timeline.html` holds the Figma content (eight milestones) and a second timeline with CTAs, a custom closing panel and a milestone without an image. As delivered by AEM (a key-value row per property, then a row per Milestone: the tab cell, year, title, description, image, link):

```html
<div class="history-timeline">
  <div><div>headingLevel</div><div>h3</div></div>
  <div><div></div><div><p>1968</p></div><div><p>An idea takes shape</p></div><div><p>Mr. Fakir Chand Kohli …</p></div><div><picture><img src="…" alt="Portrait of F. C. Kohli"></picture></div><div></div></div>
  <div><div></div><div><p>2005</p></div><div><p>Global Expansion</p></div><div><p>…</p></div><div><picture>…</picture></div><div><p><a href="/history">Read More</a></p></div></div>
</div>
```

| Year | Title | Description | Image | CTA Text | CTA Link |
| --- | --- | --- | --- | --- | --- |
| 1995 | Company Founded | Description | image.jpg | Learn More | /about |
| 2005 | Global Expansion | Description | image.jpg | Read More | /history |

## Content and Asset Guidelines

- Keep descriptions to about 40 words: on desktop the text and the image share the card's Figma height, so longer text leaves less image (the image keeps at least 12.5rem, and a card grows when its text needs more).
- Images are cropped to fill their space (`object-fit: cover`): keep the subject in the centre. Landscape and portrait images both work; at least 900px wide.
- Write alt text for informative images (a person, a place, an event); leave it empty for decorative ones.
- Year: a four-digit year is marked up as `<time datetime="YYYY">`; other values (Today, 1990s) are plain text.

## Troubleshooting

| Symptom | Cause | Resolution |
| --- | --- | --- |
| A milestone isn't shown | It has no year, title, description or image | Fill in at least one of them |
| The year row is missing | No Start / End label and fewer than two milestones with a year | Fill in Start label and End label |
| History Timeline isn't in the editor's Add menu, or its fields can't be edited | Universal Editor reads the component definitions (`component-definition.json`, `component-models.json`, `component-filters.json`) and the block code from the branch the site is configured with (`main`): a block only on a feature branch isn't offered | Merge the pull request into `main` (or point the site configuration at the feature branch for testing) |
| The buttons are missing | The strip doesn't scroll (all cards fit) | Expected |
| Button labels in English on a localized page | The placeholders aren't in the locale's sheet | Add the keys under For Site Administrators |

## Screenshots

> **Screenshot required**
>
> - Required screen: History Timeline dialog in Universal Editor (every tab, including Additional)
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
