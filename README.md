# tcs-corp-delivery

Delivery repository of the TCS Corporate Website (the site's code: [sradha-tcs/tcs-corp](https://github.com/sradha-tcs/tcs-corp)):
the tcs.com content migration driven by `URLMapping_Final_All_Levels.csv` (8,447 rows) and the EMA ETL migration
prompt. It holds migration deliverables only (no site code): the discovery and readiness report, the Knowledge Base,
the content packages batch by batch, the consolidated sheets and reports, the tools and scripts, and the site's
role-specific documentation (`docs/handover/`).

> **Moved here on 15 November 2026** from the branch `migrated-page-content-edam` of the code repository (decision
> KB-D-070), so that the code repository holds only code. The content is the same, at the same paths, with a fresh
> history. The packages of the former branch `home-content-package` and of the tag
> `archive/migrated-page-content-2026-11-08` are kept below [`archive/`](archive), the documents of the tag
> `archive/docs-before-role-docs-2026-11-08` below `archive/docs-before-role-docs-2026-11-08/`.

| Folder | Contents |
|---|---|
| `discovery/` | Discovery and Migration Readiness Report (`00-DISCOVERY-READINESS-REPORT.md`) and the reports 01–17 |
| `knowledge-base/` | The structured Knowledge Base (JSON): blocks, variations, design pages, canonical mapping, gaps, batches, pilot, decisions |
| `packages/<batch>/` | The content packages of each batch (installed in AEM with Package Manager; each page and asset has its own filter) with the batch report and `batch-results.csv` |
| `consolidated/` | Every package in installation order (`packages/`), the fix packages (`packages-fixes/`), the consolidated sheets, the reconciliation and reports, and `tools/` (automatic installation, Mac and Windows) |
| `packages-earlier-run-assets/` | 13 asset packages with the 1,342 assets of earlier migration runs the pages use, for **fresh environments** |
| `packages-for-edam-sites/` | The EDAM set-up (assets on a separate AEM Assets environment) |
| `docs/handover/` | The role-specific documentation of the site (below) |
| `archive/` | Older packages and documents (above) |

## Getting the content

The repository is about **28 GB**, almost all of it package zips ([PACKAGES.md](PACKAGES.md) lists them with their
sizes and checksums). Three ways:

- **Read the documents and reports** on GitHub: nothing to download.
- **Everything** (about 28 GB): `git clone https://github.com/sradha-tcs/tcs-corp-delivery.git`, or GitHub Desktop
  (it always downloads everything).
- **Without the packages** (about 0.6 GB), then only the packages you need:

  ```bash
  git clone --filter=blob:none --sparse https://github.com/sradha-tcs/tcs-corp-delivery.git
  cd tcs-corp-delivery
  git sparse-checkout set --no-cone '/*' '!*.zip'
  bash download-packages.sh --batch B001        # or --release <group>, --all, --archive; --dry-run lists
  ```

  On Windows (PowerShell, with Git installed) the same `git` commands, then
  `powershell -ExecutionPolicy Bypass -File download-packages.ps1 -Batch B001`. The download scripts put every
  package at its usual path (so the scripts below find it) and check its SHA-256.

## The packages

The **current packages**, for the language master below **`/content/tcs-corp/language-masters`** (published at
`/language-masters/en/`, KB-D-065) and the EDAM set-up:

| Packages | Version | Where |
|---|---|---|
| Page packages (60 batches) | **1.3.0** (below `/content/tcs-corp/language-masters`) | `packages/<batch>/`, `consolidated/packages/` |
| Asset packages (338) | **1.2.0** (DAM paths, unchanged by the move) | `packages/<batch>/`, `consolidated/packages/` |
| Fix packages (unpublished pages, folder renames) | 1.0.0 | `consolidated/packages-fixes/` |
| Assets of earlier runs (13, fresh environments) | 1.2.0, merge filters | `packages-earlier-run-assets/` |
| EDAM zips and content packages | pilot B001's zips; `1.3.0-edam` once the asset IDs are exported | `packages-for-edam-sites/` |

Install as in `consolidated/packages/INSTALL-ORDER.md` (per batch the asset packages, then the page package); on a
fresh environment `packages-earlier-run-assets/` first. The packages of the old root (`/content/tcs-corp/language-master`:
page packages 1.2.0) and the superseded 1.0.0 / 1.1.0 packages are in `archive/archive-migrated-page-content-2026-11-08/`
(the former `migrated-page-content` branch, deleted on 8 November 2026), the home content packages in
`archive/home-content-package/`. The reports (`batch-results.csv`, the reconciliation) keep the workbook's paths (below
the old root; the new path is the same with `language-masters`). See `discovery/17-MIGRATION-MODEL.md`, sections 7 to 9.

## Documentation (KB-D-066, KB-D-069, KB-D-070)

[`docs/handover/`](docs/handover/README.md) holds the **role-specific documentation** of the site (KB-D-069, 8 November
2026): 01 architecture, 02 development (a folder per block and curated design page), 03 authoring (a guide per
component), 04 business analysis, 05 quality assurance (test cases, execution results with evidence), 06 operations,
07 administration and governance (with the Dynamic Media set-up), 08 release and DevOps, 09 knowledge base (humans,
AI agents, LLM retrieval, machine-readable inventories), 10 training, 11 audit and remediation; Markdown with paired
PDFs and real screenshots of the published reference pages. Every code change updates it: its generator is
[`docs-tools/`](docs-tools/README.md). The former consolidated handover, guides, proposals and reports are kept in the
folder [`archive/docs-before-role-docs-2026-11-08/`](archive/docs-before-role-docs-2026-11-08/docs) (copied from that tag of the code repository). The knowledge base for code work stays in the code repository
([docs/handover/knowledge-base](https://github.com/sradha-tcs/tcs-corp/blob/main/docs/handover/knowledge-base/README.md)).

## Dynamic Media (decided 8 November 2026, KB-D-067)

After the installation below, the assets are approved and delivered by **Dynamic Media with OpenAPI** from the
Sites environment's delivery tier, and the 8,432 migrated pages below `/language-masters/en` are rebuilt with the
assets' delivery URLs and reinstalled: `edam-assets.sh --steps 4,5` and `aem-sites.sh` against the **Sites author**
(details and the asset picker set-up: [docs/handover/07-administration-governance/markdown/DYNAMIC-MEDIA-SETUP.md](docs/handover/07-administration-governance/markdown/DYNAMIC-MEDIA-SETUP.md)).

## The three roots (KB-D-068)

| Author path | Published at | Purpose |
|---|---|---|
| `/content/tcs-corp/language-master/en` | `/language-master/en/` | Testing: page functionality with dummy content, content limitations and other test aspects (DAM paths) |
| `/content/tcs-corp/language-masters/en` | `/language-masters/en/` | The language master: the 8,432 migrated pages of these packages, validated (functionality, layout, content) with the real sheet data; later the source of the global website and the regions and languages (MSM or separate content to be decided once the content is final) |
| `/content/tcs-corp/design-block-master/en` | `/design-block-master/en/` | The block library and the curated design pages |

Each root is a site of its own (its own references, error pages and sheets), mapped in the site configuration and
in the code (`REVIEW_ROOTS`).

The redirects sheet (`consolidated/sheets/redirects.csv`) maps the tcs.com URLs of the 8,432 migrated pages
(source: the tcs.com path, e.g. `/careers`) to their pages below `/language-masters/en`.

## How to install (decided 8 November 2026)

The assets stay in the **Sites author's own DAM** (the delivery host is the Sites environment's own: there is no
separate AEM Assets environment) and the pages reference them by **DAM path**: the standard set-up. Install the
packages of `consolidated/packages/` on the Sites author in the order of its `INSTALL-ORDER.md` (per batch the
asset packages, then the page package), with one command from `consolidated/`:

```bash
export AEM_AUTHOR=https://author-p<program>-e<environment>.adobeaemcloud.com
read -r -s -p "Access token: " AEM_TOKEN; export AEM_TOKEN; echo
bash tools/install-packages.sh --dry-run          # the list, nothing installed
bash tools/install-packages.sh --batch B001       # pilot
bash tools/install-packages.sh                    # everything (resumable: run it again after a stop)
```

```powershell
$env:AEM_AUTHOR = "https://author-p<program>-e<environment>.adobeaemcloud.com"
powershell -ExecutionPolicy Bypass -File tools\install-packages.ps1 -DryRun
powershell -ExecutionPolicy Bypass -File tools\install-packages.ps1 -Batch B001
powershell -ExecutionPolicy Bypass -File tools\install-packages.ps1
```

(The PowerShell version asks for the token, hidden.) On a fresh environment install `packages-earlier-run-assets/`
first (its README). Then publish the DAM videos, audio and documents, replace and publish the sheets, publish and
index the pages (`consolidated/packages/INSTALL-ORDER.md`). `packages-for-edam-sites/` isn't used.

## The two scripts

With the Dynamic Media decision they run against the **Sites author** (`EDAM_AUTHOR` = `SITES_AUTHOR` = the Sites
author; `edam-assets` with `--steps 4,5` only, the assets being installed by the packages); with a separate AEM
Assets environment they would do the whole set-up. From this folder (details: `RUN-SCRIPTS.md`):

1. **`edam-assets.sh`** (Mac) / **`edam-assets.ps1`** (Windows): the assets to the Assets environment (extract,
   tags, upload, metadata, approval) and their IDs exported to `edam-state/asset-ids.csv`.
2. **`aem-sites.sh`** (Mac) / **`aem-sites.ps1`** (Windows): the content packages 1.3.0-edam built with the
   assets' delivery URLs and installed on the Sites author.

Pilot with `--batch B001` / `-Batch B001` first. Both are resumable (run the same command again to continue).

Each package and report traces back to its workbook rows (Row ID = the CSV row number).
