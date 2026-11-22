---
id: "DEV-B-history-timeline"
title: "History Timeline Block — Developer Guide"
role: "Development"
topic: "block"
audience: "Developers, technical leads, block owners, AI coding agents"
owner: "Technical Lead / Block Owner"
approver: "Product Owner (to be confirmed)"
version: "1.0"
status: "Draft for review"
lastUpdated: "2026-11-22"
lastValidated: "2026-11-22"
sourceFiles: ["blocks/history-timeline/README.md","blocks/history-timeline/_history-timeline.json","blocks/history-timeline/history-timeline.css","blocks/history-timeline/history-timeline.js"]
relatedComponents: ["history-timeline","history-timeline-item"]
relatedPages: []
confidence: "Medium"
primary: true
---

# History Timeline Block — Developer Guide

| Attribute | Value |
| --- | --- |
| Document ID | DEV-B-history-timeline |
| Audience | Developers, technical leads, block owners, AI coding agents |
| Purpose | How the History Timeline block is built: files, model, structure, behaviour, variations, tests and limitations |
| Scope | blocks/history-timeline/ and its components history-timeline, history-timeline-item |
| Prerequisites | — |
| Owner | Technical Lead / Block Owner (proposed) |
| Approver | Product Owner (to be confirmed) |
| Version | 1.0 |
| Status | Draft for review |
| Last updated | 22 November 2026 |
| Last validated | 2026-11-22 (model, files, imports from the code; reference pages from the live site) |
| Source files | blocks/history-timeline/README.md, blocks/history-timeline/_history-timeline.json, blocks/history-timeline/history-timeline.css, blocks/history-timeline/history-timeline.js |
| Related documents | [Variations](./HISTORY-TIMELINE-VARIATIONS.md), [Test coverage](./HISTORY-TIMELINE-TEST-COVERAGE.md), [Authoring guide](../../../03-authoring/components/history-timeline/HISTORY-TIMELINE-AUTHORING-GUIDE.md) |
| Related AEM paths | — |

## Contents

- [Summary](#summary)
- [Overview](#overview)
- [Source files](#source-files)
- [Components, models and filters](#components-models-and-filters)
- [Fields](#fields)
- [Dependencies](#dependencies)
- [For Developers](#for-developers)
- [Extending the Block](#extending-the-block)
- [Responsive Behavior](#responsive-behavior)
- [Accessibility](#accessibility)
- [Data Layer and Analytics](#data-layer-and-analytics)
- [Performance Considerations](#performance-considerations)
- [Security and Privacy](#security-and-privacy)
- [For Architects](#for-architects)
- [Troubleshooting](#troubleshooting)
- [Known limitations of the block](#known-limitations-of-the-block)
- [Change history of the block](#change-history-of-the-block)
- [Reference pages](#reference-pages)
- [Coverage of the required topics](#coverage-of-the-required-topics)
- [Screenshots](#screenshots)
- [Known limitations](#known-limitations)
- [Open items](#open-items)
- [Change history](#change-history)

## Summary

| Attribute | Value |
| --- | --- |
| Block | History Timeline |
| Folder | `blocks/history-timeline` |
| Type | Container |
| Category | content |
| Status | Active |
| Purpose | The company history as a horizontal strip of milestone cards (year, title, description, image, optional CTA) with a progress line and previous / next buttons |
| Variations (summary) | Milestone heading level, closing panel text or hidden |
| Children | history-timeline-item (Milestone) |
| Code size | 536 lines of JS and CSS |

## Overview

- **Business purpose:** presents the company's history (or any chronology: a programme, a partnership, a product) as a story the visitor moves through, with a picture for each step.
- **User experience:** the strip scrolls sideways (swipe, mouse drag, the previous / next buttons, or the arrow keys, Home and End on the focused strip). The line above it shows how far along the timeline the visitor is. On desktop (900px and wider) the cards take the Figma sizes (eight sizes, repeated for more milestones) and line up at the bottom; on mobile and tablet the cards share one width and height.
- **Templates / page types:** any page, typically an About or History page. No template adds the block.
- **Data source:** authored fields only. UI text (the strip's label, the button labels, the default closing panel text) comes from the placeholders.
- **Related blocks:** Cards (`blocks/cards`) for cards without a chronology, in a grid or horizontal scroll; Gen Carousel (`blocks/gen-carousel`) for full-width slides.
- **When to use:** three or more dated milestones that are read in order.
- **When not to use:** a list of unrelated cards (use Cards); a single milestone (use a Teaser); content that must be compared side by side (use a Table).
- **Realistic use cases:** the company history on the About page; the history of a business unit, a partnership or a location.

## Source files

| File | Link |
| --- | --- |
| `README.md` | [GitHub](https://github.com/sradha-tcs/tcs-corp/blob/main/blocks/history-timeline/README.md) |
| `_history-timeline.json` | [GitHub](https://github.com/sradha-tcs/tcs-corp/blob/main/blocks/history-timeline/_history-timeline.json) |
| `history-timeline.css` | [GitHub](https://github.com/sradha-tcs/tcs-corp/blob/main/blocks/history-timeline/history-timeline.css) |
| `history-timeline.js` | [GitHub](https://github.com/sradha-tcs/tcs-corp/blob/main/blocks/history-timeline/history-timeline.js) |

## Components, models and filters

| Component | Title | Resource type | Template name | Model | Children allowed |
| --- | --- | --- | --- | --- | --- |
| `history-timeline` | History Timeline | `core/franklin/components/block/v1/block` | History Timeline | `history-timeline` | history-timeline-item |
| `history-timeline-item` | Milestone | `core/franklin/components/block/v1/block/item` | Milestone | `history-timeline-item` | — |

## Fields

The Additional tab fields (anchor, hide, padding, margin, animation) are common to the blocks and described in the [content modeling guide](../../markdown/CONTENT-MODELING-GUIDE.md).

### History Timeline (`history-timeline`)

| Tab | Label | Property | Type | Required in model | Default | Options | Visibility |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Content | Start label | `startLabel` | text | No | — | — | — |
| Content | End label | `endLabel` | text | No | — | — | — |
| Content | Closing panel | `closingLabel` | text | No | — | — | — |
| Style | Milestone heading level | `headingLevel` | select | No | `h3` | 5 options | — |
| Style | Hide closing panel | `hideClosing` | boolean | No | `false` | — | — |

### Milestone (`history-timeline-item`)

| Tab | Label | Property | Type | Required in model | Default | Options | Visibility |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Milestone | Year | `year` | text | No | — | — | — |
| Milestone | Title | `title` | text | No | — | — | — |
| Milestone | Description | `description` | richtext | No | `""` | — | — |
| Milestone | Image | `image` | reference | No | — | — | — |
| Milestone | Image Alt Text | `imageAlt` | text | No | — | — | — |
| Milestone | CTA Link | `link` | aem-content | No | — | — | — |
| Milestone | CTA Text | `linkText` | text | No | — | — | — |

"Required in model" is the model's `required` flag; whether a field is required in practice is stated in the authoring guide where it is known.

## Dependencies

| Import |
| --- |
| `../../scripts/scripts.js` |
| `../../decorators/button-decorator.js` |
| `../../decorators/content-decorator.js` |
| `../../decorators/editor-item-decorator.js` |
| `../../decorators/heading-decorator.js` |
| `../../decorators/icon-button-decorator.js` |
| `../../decorators/image-decorator.js` |
| `../../decorators/scroller-decorator.js` |
| `../../utils/cells.js` |
| `../../utils/ids.js` |
| `../../utils/links.js` |
| `../../utils/placeholders.js` |
| `../../utils/properties.js` |

## For Developers

<!-- BEGIN GENERATED: files (npm run build:docs) -->

```text
blocks/history-timeline/
├── README.md
├── _history-timeline.json
├── history-timeline.css
└── history-timeline.js
```

| Decorator/Utility | Purpose | Execution or dependency point |
| ----------------- | ------- | ----------------------------- |
| [`scripts/scripts.js`](https://github.com/sradha-tcs/tcs-corp/blob/main/scripts/scripts.js) | Page decoration (moveInstrumentation and shared page helpers) | `history-timeline.js`: { moveInstrumentation } |
| [`decorators/button-decorator.js`](https://github.com/sradha-tcs/tcs-corp/blob/main/decorators/button-decorator.js) | `decorateButton` (option `newTabHint`: a link opening a new tab says so), `createButton`, `setButtonDisabled`, `setButtonAlignment`, `removeButtonDecoration` | `history-timeline.js`: { decorateButton } |
| [`decorators/content-decorator.js`](https://github.com/sradha-tcs/tcs-corp/blob/main/decorators/content-decorator.js) | `fromCell` (property content into an element, keeping editor instrumentation) | `history-timeline.js`: { fromCell } |
| [`decorators/editor-item-decorator.js`](https://github.com/sradha-tcs/tcs-corp/blob/main/decorators/editor-item-decorator.js) | `buildEditorItems`, `editorItemHint` (in Universal Editor, an item the block doesn't render yet, e.g. a CTA just added, as a dashed placeholder the author can select; styles in `styles/lazy-styles.css`; the hint loaded o | `history-timeline.js`: { buildEditorItems, editorItemHint } |
| [`decorators/heading-decorator.js`](https://github.com/sradha-tcs/tcs-corp/blob/main/decorators/heading-decorator.js) | `buildHeading` (Title + Title Type), `HEADINGS` | `history-timeline.js`: { buildHeading } |
| [`decorators/icon-button-decorator.js`](https://github.com/sradha-tcs/tcs-corp/blob/main/decorators/icon-button-decorator.js) | `createIconButton` | `history-timeline.js`: { createIconButton } |
| [`decorators/image-decorator.js`](https://github.com/sradha-tcs/tcs-corp/blob/main/decorators/image-decorator.js) | `pictureOf` (image with its alt text field) | `history-timeline.js`: { pictureOf } |
| [`decorators/scroller-decorator.js`](https://github.com/sradha-tcs/tcs-corp/blob/main/decorators/scroller-decorator.js) | `createScroller` (previous / next, scroll indicator, mouse drag, keyboard, loop and initial item for a CSS horizontal scroller; active only while it scrolls) | `history-timeline.js`: { createScroller } |
| [`utils/cells.js`](https://github.com/sradha-tcs/tcs-corp/blob/main/utils/cells.js) | `itemRows`, `KEY_VALUE_ITEM`, `FIELD_ROW_ITEM` (the item rows of a block: by model in the editor, by their cells on the page), `withoutTabCells` (drops the empty cell AEM renders for each dialog tab of an item model), `m | `history-timeline.js`: { KEY_VALUE_ITEM, itemRows, matchCells, withoutTabCells, } |
| [`utils/ids.js`](https://github.com/sradha-tcs/tcs-corp/blob/main/utils/ids.js) | `nextInstance`, `uniqueId`, `createIdFactory` (unique ids per block instance), `availableId` (an authored id kept, suffixed -2, -3, ... only when taken) | `history-timeline.js`: { uniqueId } |
| [`utils/links.js`](https://github.com/sradha-tcs/tcs-corp/blob/main/utils/links.js) | `NEW_WINDOW`, `linkOf`, `linkPathsOf` (the paths of a page property, one or many), `readLinkItems` (CTA lists with Link Type and the items' other select values), `readLinkRows` (the same from link item rows, e.g. Hero CT | `history-timeline.js`: { linkOf } |
| [`utils/placeholders.js`](https://github.com/sradha-tcs/tcs-corp/blob/main/utils/placeholders.js) | `getPlaceholders`, `loadPlaceholders`, `fillPlaceholder` (UI text from the locale's placeholders, with English fallbacks) | `history-timeline.js`: { getPlaceholders } |
| [`utils/properties.js`](https://github.com/sradha-tcs/tcs-corp/blob/main/utils/properties.js) | `readProperties`, `textOf`, `isOn`, `isOnByDefault` (a toggle that defaults to on), `optionOf`, `normalizeKey`, `textSource` (key-value block properties) | `history-timeline.js`: { isOn, readProperties, textOf } |

<!-- END GENERATED: files -->

- `history-timeline.js` reads the properties (`readProperties`) and the Milestone rows (`itemRows` with `KEY_VALUE_ITEM`, then `withoutTabCells` / `matchCells` against `MILESTONE_LAYOUT`: tab, year, title, description, image, link), builds the year row, the strip (`.history-timeline-viewport` > `.history-timeline-track` > `ol.history-timeline-list` + `.history-timeline-closing`) and the controls, and hands the strip to `createScroller` (`decorators/scroller-decorator.js`) with the year row's line as its indicator.
- The progress line reads the scroller's `--scroller-thumb-offset` (0 to 1) and `--history-timeline-count` (set on the block): its width is `(1 + offset × (count − 1)) / count`, one milestone's share at the start and all of it at the end; 100% when the strip doesn't scroll. No layout is read during decoration.
- Editor: rows without content render as placeholders (`buildEditorItems`); every rendered element keeps its instrumentation (`moveInstrumentation`, `fromCell`, `buildHeading`, `pictureOf`).
- Shared code: `decorators/button-decorator.js` (CTA link button), `icon-button-decorator.js` (previous / next), `content-decorator.js`, `heading-decorator.js`, `image-decorator.js`, `editor-item-decorator.js`, `scroller-decorator.js`; `utils/cells.js`, `ids.js`, `links.js`, `placeholders.js`, `properties.js`.
- Animation: registered in `decorators/motion-decorator.js` (`CONTENT_TARGETS`: the year row and the milestones, one after another).

## Extending the Block

- More card sizes: add `:nth-child()` rules (and change the `8n` cycle) in the `width >= 900px` query of `history-timeline.css`.
- A new Milestone field: add it to the item model, `MILESTONE_LAYOUT`, `MATCHERS` and `test/items/item-rows.test.mjs`, and raise the `history-timeline-item` entry of `xwalk/max-cells` in `.eslintrc.js`.

## Responsive Behavior

| Width | Layout |
| --- | --- |
| < 600px | Cards 17.5rem wide (narrower on phones under 370px, so about 2rem of the next card shows), of equal height (the tallest card's), image at least 12.5rem; gutter 1rem; closing panel 12.5rem |
| 600–899px | Cards 22.5rem; gutter 2.5rem; closing panel 15rem |
| 900–1199px | The Figma cards: eight widths and heights (Article-1 … Article-8: 420 × 669, 380 × 549, 387 × 489, 400 × 579, 450 × 519, 410 × 459, 440 × 559, 420 × 499px), repeated for more milestones, aligned at the bottom of the strip. The strip is a screen high: 49.8125rem (797px, the Figma 1024px frame) on screens 1024px high or more; on lower screens the space above the tallest card shrinks (down to the tallest card, 669px), so the cards keep their Figma sizes; closing panel 16.875rem (270px); gutter 2.5rem |
| ≥ 1200px | As above with the Figma gutter of 5rem (80px) |

In a Fixed Width section the section's own gutter replaces the block's (the block adds only what the section doesn't give). Type follows the site tokens: the year `--heading-font-size-xl` (40px from 900px), the title `--heading-font-size-s` (20px), the year labels `--heading-font-size-m` (24px), the description `--label-font-size` (14px).

## Accessibility

- The milestones are an ordered list (`<ol>`) inside a region labelled with the placeholder `historyTimeline` ("History timeline"); each title is a heading of the authored level.
- The year row (the two labels and the progress line) is `aria-hidden`: the list and the buttons convey the same information.
- Previous / next are `<button>`s with accessible names (placeholders `historyTimelinePrevious`, `historyTimelineNext`) and `aria-controls` pointing at the strip; at the start / end they are `aria-disabled` (not `disabled`, so focus isn't lost) (`decorators/scroller-decorator.js`).
- While the strip scrolls it is keyboard focusable (`tabindex="0"`), with the arrow keys, Home and End; links and CTAs inside are reached with Tab. Focus is shown by the site's focus ring (`--color-border-brand`), drawn inside the strip's edge.
- Contrast: text `--color-text-default` and `--color-text-secondary` (6.9:1) on the block background `#f9f9f9`; the buttons' brand 400 outline and chevron (5.4:1 on white, per `styles/styles.css`). Inside a Dark / Dark green section the block takes the section's colour and the theme contract's light tokens.
- Nothing moves on its own; smooth scrolling is turned off for reduced motion.

## Data Layer and Analytics

The block is added to the Adobe Client Data Layer by `decorators/data-layer-decorator.js` like every block. The previous / next buttons carry `data-cmp-interaction="previous"` / `"next"` and the CTAs `data-cmp-interaction="cta"`; clicks are captured centrally. The block pushes no events itself.

## Performance Considerations

No dependencies and no layout reads while decorating: the scroller measures in a shared animation frame. Images are the authored, optimized `<picture>`s, lazy as delivered. The block is CSS-only for its layout; the progress line is a CSS width from one custom property.

## Security and Privacy

No personal data, no external requests; links are the authored ones.

## For Architects

A new block (no existing block covers a chronological strip with a progress line): it reuses the scroller, button, heading, image and editor item decorators, so it adds no scrolling or button code of its own. Content model: item children (decision log: item children instead of composite multifields). It doesn't replace or overlap another block.

## Troubleshooting

| Symptom | Cause | Resolution |
| --- | --- | --- |
| A milestone isn't shown | It has no year, title, description or image | Fill in at least one of them |
| The year row is missing | No Start / End label and fewer than two milestones with a year | Fill in Start label and End label |
| History Timeline isn't in the editor's Add menu, or its fields can't be edited | Universal Editor reads the component definitions (`component-definition.json`, `component-models.json`, `component-filters.json`) and the block code from the branch the site is configured with (`main`): a block only on a feature branch isn't offered | Merge the pull request into `main` (or point the site configuration at the feature branch for testing) |
| The buttons are missing | The strip doesn't scroll (all cards fit) | Expected |
| Button labels in English on a localized page | The placeholders aren't in the locale's sheet | Add the keys under For Site Administrators |

## Known limitations of the block

- Figma has only a desktop frame: the mobile and tablet layouts are derived from it.
- In Figma the progress line is a static 149px of 1278px; the block fills it by the scroll position (one milestone's share at the start).
- Figma shows both buttons in their default state; at the start / end the block shows the site's disabled button state (grey), as the List and Cards scrollers do.
- Card sizes repeat every eight milestones; they don't adapt to the text length (a card grows only when its text doesn't fit).

## Change history of the block

| Date | Change |
| --- | --- |
| 17 November 2026 | New block from the Figma "Match · History timeline" frame |
| 17 November 2026 | Start label and End label fields (Figma year row); desktop strip follows the screen height; mobile cards narrow so the next one peeks in |

## Reference pages

| Kind | Page | Live URL |
| --- | --- | --- |

## Coverage of the required topics

| Topic | Where |
| --- | --- |
| Purpose | Overview |
| Source files | generated: Files |
| Model, definition, filters, children | generated: Components |
| Dependencies | generated: Dependencies |
| Authored input / rendered output / DOM transformation | For Developers |
| Configuration fields, defaults, required fields | generated: Fields |
| Variations | HISTORY-TIMELINE-VARIATIONS.md |
| Responsive behaviour | Responsive Behavior |
| Accessibility and keyboard | Accessibility |
| Analytics / data layer | Data Layer and Analytics |
| Performance | Performance Considerations |
| Security | Security and Privacy |
| Extending | Extending the Block |
| Known limitations | Known Limitations |
| Troubleshooting | Troubleshooting |
| Tests | HISTORY-TIMELINE-TEST-COVERAGE.md |
| SEO behaviour | Not recorded |
| Caching considerations | Not recorded (Edge Delivery default caching; no block-specific rule) |
| Ownership | Technical Lead / Block Owner (proposed) |

## Screenshots

> **Screenshot required**
>
> - Required screen: History Timeline on its block library page
> - Required role/access: none (published page)
> - Required navigation steps: Open https://main--tcs-corp--sradha-tcs.aem.live/design-block-master/en/block-library/history-timeline
> - Reason unavailable: No block library page of this block was found under /design-block-master/en/block-library
> - Owner: Content Lead / AEM Authoring Lead (proposed)
> - Target completion date: To be confirmed

## Known limitations

- Universal Editor dialogs were not captured: no author access in this program (see the access blockers).

## Open items

- None.

## Change history

| Version | Date | Author | Change |
| --- | --- | --- | --- |
| 1.0 | 22 November 2026 | Delivery team (documentation program) | First version of the role-specific documentation (master documentation prompt), generated from the repository and the published reference pages |
