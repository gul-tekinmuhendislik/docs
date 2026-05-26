# Task: FN-001 — Codebase Audit — Mintlify Documentation Infrastructure

**Created:** 2026-05-26
**Size:** M

## Review Level: 1 (Plan Only)

**Assessment:** Read-only audit of a Mintlify documentation site. No code is created or removed. Patterns are well-understood. No security surface. Fully reversible by discarding the audit report.
**Score:** 2/8 — Blast radius: 0, Pattern novelty: 1, Security: 0, Reversibility: 1

## Mission

Perform a comprehensive audit of the Gül-tekin Mühendislik Mintlify documentation site. The purpose is to catalogue the full infrastructure, assess content quality and consistency across all service and brand pages, evaluate the automation scripts (daily enrichment pipeline, meta-description generation), identify structural issues, gaps, and improvement opportunities, and produce a structured written report saved as a task document. This audit will inform downstream improvement tasks and provide a baseline reference for future work.

## Dependencies

- **None**

## Context to Read First

Start by reading these files to understand the project's structure and conventions:

- `docs.json` — Mintlify configuration (tabs, navigation, theme, topbar, footer, search, banner)
- `index.mdx` — Landing page
- `hizmetlerimiz.mdx` — Service index page
- `markalar.mdx` — Brand index page
- `custom.css` — All custom CSS (link cards, brand grid, badges, responsive breakpoints)
- `add_meta_descriptions.py` — Bulk meta-description enrichment script
- `scripts/daily-docs-enrichment.sh` — Daily NotebookLM-driven enrichment pipeline
- `scripts/docs-enrichment.log` — Recent enrichment run log
- `contact.mdx` — Contact page pattern

Then read representative samples from each content category to understand content quality and consistency:

- `hizmetlerimiz/isi-pompalari.mdx` (rich, well-structured service page)
- `hizmetlerimiz/su-aritma-sistemleri.mdx` (NLM-enriched service page)
- `markalar/baymak.mdx` (rich, well-structured brand page)
- `markalar/baylan.mdx` (NLM-enriched brand page)
- `isi-pompalari/genel-bilgi.md` (supporting content outside Mintlify's MDX convention)

## File Scope

This task is **read-only**. No files are created or modified. The deliverable is a structured audit report saved as a task document via `fn_task_document_write`.

- `.fusion/tasks/FN-001/PROMPT.md` (this spec — already written)

## Steps

### Step 0: Preflight

- [ ] Verify all files listed in "Context to Read First" exist and are readable
- [ ] List the full directory tree with `ls -R` to capture all project files
- [ ] Recursively count all `.mdx`, `.md`, `.css`, `.py`, `.sh`, `.json` files

### Step 1: Infrastructure & Configuration Audit

- [ ] Read and document every field in `docs.json` — theme, colors, navigation structure (tabs, groups, pages), topbar links, footer socials, banner, search config, feedback settings
- [ ] Verify that all pages referenced in `docs.json` navigation actually exist as files (no broken nav links)
- [ ] Check for unlisted pages — files on disk that are NOT referenced in any navigation tab or group
- [ ] Document custom CSS patterns: what components are styled (`.link-card`, `.brand-grid`, `.brand-card`, `.badge`), dark mode support, responsive breakpoints, any accessibility concerns

**Artifacts:**
- None (read-only — findings feed into Step 4 report)

### Step 2: Content Inventory & Quality Assessment

- [ ] Read and assess every `.mdx` file in `hizmetlerimiz/` (15 files). For each, note:
  - Frontmatter completeness (title, description presence and quality)
  - Content structure (headings, sections, depth)
  - Whether the page was NLM-enriched (look for `{"value": {"answer": ...}}` JSON blocks)
  - Whether Mintlify card components (`<Card>`, `<CardGroup>`) are used vs. raw markdown lists
  - Internal link quality — do linked brand/service pages exist?
  - Overall content depth (thin < 20 lines, adequate 20-100, rich > 100)
- [ ] Read and assess every `.mdx`/`.md` file in `markalar/` (43+ files). For each, note:
  - Same criteria as services above
  - Whether the file extension is `.mdx` or `.md` (inconsistency check)
- [ ] Check `isi-pompalari/` support files — are they linked from any index or navigation?
- [ ] Identify pages with duplicate or boilerplate descriptions from the `add_meta_descriptions.py` script

**Artifacts:**
- None (read-only — findings feed into Step 4 report)

### Step 3: Automation & Scripting Audit

- [ ] Read and understand `add_meta_descriptions.py`:
  - What does it do? How does it generate descriptions?
  - Does it handle non-MDX files? (Check `markalar/varmeks.md` vs `.mdx`)
  - Are there any bugs, edge cases, or hardcoded paths?
- [ ] Read and understand `scripts/daily-docs-enrichment.sh`:
  - Full flow: NotebookLM session management, weakest page selection, query strategy, content enrichment, git commit/push
  - Identify hardcoded assumptions (DB_URL, REPO_DIR, notebook name)
  - Identify failure modes (expired sessions, NLM API errors, empty responses)
  - Review the enrichment log — what has been enriched, how many runs, any failures
- [ ] Assess whether the enrichment script correctly handles both `.mdx` and `.md` extensions for brand files

**Artifacts:**
- None (read-only — findings feed into Step 4 report)

### Step 4: Report & Delivery

- [ ] Write a comprehensive structured audit report as a task document via `fn_task_document_write`
- [ ] The report must be structured in Turkish (matching the project language) with the following sections:

  **Report Structure:**
  1. **Proje Genel Bakış** (Project Overview) — directory structure, total file counts by type
  2. **Mintlify Yapılandırma Denetimi** (Mintlify Configuration Audit) — docs.json analysis, navigation completeness, unlisted pages
  3. **Hizmet Sayfaları Değerlendirmesi** (Service Pages Assessment) — per-page quality table with columns: Dosya, Başlık, Uzunluk, Zenginleştirme Durumu, Zorunlu Bileşenler (frontmatter, cards, internal links, headings), Not
  4. **Marka Sayfaları Değerlendirmesi** (Brand Pages Assessment) — same tabular format
  5. **Script ve Otomasyon Denetimi** (Script & Automation Audit) — findings on both scripts, bugs, failure modes, improvement suggestions
  6. **Tutarlılık Sorunları** (Consistency Issues) — file extension mix (.md vs .mdx), missing frontmatter fields, duplicate descriptions, broken links
  7. **Performans ve Bakım** (Performance & Maintenance) — image sizes, custom CSS bloat, enrichment pipeline sustainability
  8. **Öneriler** (Recommendations) — prioritized list of concrete improvements (e.g., fix broken links, standardize file extensions, add missing pages to navigation, improve script error handling, add SEO metadata)
  9. **Özet** (Summary) — key takeaways in 3-5 bullet points

- [ ] The report must be saved as a task document with `fn_task_document_write(key="audit-report", content="...")`
- [ ] For each actionable issue found, create a follow-up task via `fn_task_create` with a clear title and description scoped to fix just that issue

**Artifacts:**
- Task document: `audit-report` (via `fn_task_document_write`)

## Documentation Requirements

**Must Update:**
- None (read-only audit — deliverable is the report document)

**Check If Affected:**
- This README.md may need a note about the audit findings if the final report recommends structural changes to the project

## Completion Criteria

- [ ] All files in "Context to Read First" have been read and analyzed
- [ ] All `.mdx` files in `hizmetlerimiz/` and `markalar/` have been individually assessed
- [ ] Both automation scripts have been audited
- [ ] Structured audit report saved as task document (`fn_task_document_write(key="audit-report")`)
- [ ] Actionable findings converted to follow-up tasks via `fn_task_create`

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `docs(FN-001): complete Step N — description`
- **Report delivery:** `docs(FN-001): deliver audit report with findings and recommendations`

## Do NOT

- Modify or create any project files (this is a read-only audit)
- Delete, remove, or rename any files
- Change any content, scripts, or configuration
- Run any scripts that modify files (e.g., the enrichment script or meta-description script)
- Expand scope to fix issues found — create follow-up tasks instead
- Skip reading any content file — every `.mdx` and `.md` file must be assessed
- Hardcode assumptions about file count — derive from actual filesystem listing

## Changeset Requirements

Not applicable — this task makes no code/documentation changes.
