# Task: FN-006 — Hizmetlerimiz index sayfasına eksik hizmet linklerini ekleme

**Created:** 2026-05-26
**Size:** S

## Review Level: 0 (None)

**Assessment:** Simple content addition to a single Markdown index page. Two new bullet-point links added. No code changes, no build, no security surface. Fully reversible — just add two lines.
**Score:** 0/8 — Blast radius: 0, Pattern novelty: 0, Security: 0, Reversibility: 0

## Mission

`hizmetlerimiz.mdx` (the services index page) currently lists 14 services in a bullet-point list. However, the `hizmetlerimiz/` directory contains 16 `.mdx` files — two service pages exist on disk but are missing from the index: `gunes-enerjisi-ile-elektrik-uretimi` (Güneş Enerjisi ile Elektrik Üretimi) and `gunes-enerjisi-ile-su-isitma` (Güneş Enerjisi ile Su Isıtma). Add links for these two pages to the end of the existing "Güneş Enerjisi" section of the list, ensuring users can discover all services from the central index page. The `docs.json` navigation already includes these two pages under the "Güneş Enerjisi" tab — no navigation changes are needed.

## Dependencies

- **None**

## Context to Read First

- `hizmetlerimiz.mdx` — The index page to edit (current 14-entry bullet list)
- `hizmetlerimiz/` directory — List all `.mdx` files to confirm the two missing pages exist
- `hizmetlerimiz/gunes-enerjisi-ile-elektrik-uretimi.mdx` — Read frontmatter `title:` to confirm display name
- `hizmetlerimiz/gunes-enerjisi-ile-su-isitma.mdx` — Read frontmatter `title:` to confirm display name

## File Scope

- `hizmetlerimiz.mdx` (modified — add two missing service links)

## Steps

### Step 0: Preflight

- [ ] Read `hizmetlerimiz.mdx` — confirm the current list contains exactly 14 entries, and that `gunes-enerjisi-ile-elektrik-uretimi` and `gunes-enerjisi-ile-su-isitma` are NOT present
- [ ] List files in `hizmetlerimiz/` — confirm that `gunes-enerjisi-ile-elektrik-uretimi.mdx` and `gunes-enerjisi-ile-su-isitma.mdx` exist on disk
- [ ] Read frontmatter of both files to confirm their display titles:
  - `gunes-enerjisi-ile-elektrik-uretimi.mdx` → title: **"Güneş Enerjisi ile Elektrik Üretimi"**
  - `gunes-enerjisi-ile-su-isitma.mdx` → title: **"Güneş Enerjisi ile Su Isıtma"**

### Step 1: Add missing links to hizmetlerimiz.mdx

- [ ] **Locate insertion point:** The existing list entry for `Güneş Enerjisi` is at position 11 (the link `- [Güneş Enerjisi](/hizmetlerimiz/gunes-enerjisi)`). The two new links go immediately after this line — they are sub-pages under the Güneş Enerjisi category, placed right after the parent entry.
- [ ] **Insert both links** after the `- [Güneş Enerjisi](/hizmetlerimiz/gunes-enerjisi)` line, maintaining the same bullet format:
  ```
  - [Güneş Enerjisi ile Elektrik Üretimi](/hizmetlerimiz/gunes-enerjisi-ile-elektrik-uretimi)
  - [Güneş Enerjisi ile Su Isıtma](/hizmetlerimiz/gunes-enerjisi-ile-su-isitma)
  ```
- [ ] **Do NOT** remove or modify any existing links — only insert these two new lines
- [ ] **Do NOT** change the ordering of any existing entries

### Step 2: Verification

- [ ] Read the updated `hizmetlerimiz.mdx` and verify:
  - Exactly 16 entries in the list (14 original + 2 new)
  - `Güneş Enerjisi ile Elektrik Üretimi` links to `/hizmetlerimiz/gunes-enerjisi-ile-elektrik-uretimi`
  - `Güneş Enerjisi ile Su Isıtma` links to `/hizmetlerimiz/gunes-enerjisi-ile-su-isitma`
  - Both links appear immediately after the existing `- [Güneş Enerjisi](/hizmetlerimiz/gunes-enerjisi)` entry
  - No duplicate entries
  - No existing links removed or altered
- [ ] Cross-reference with `hizmetlerimiz/` directory — every `.mdx` file in the directory now has a matching `- [Title](/hizmetlerimiz/slug)` line in `hizmetlerimiz.mdx`
- [ ] Confirm `docs.json` already contains both pages in the "Güneş Enerjisi" tab's `pages` array — no need to modify navigation

### Step 3: Documentation & Delivery

- [ ] Save a summary as a task document via `fn_task_document_write` (key="docs", content=Markdown summary listing the two added services with their display names, slugs, and frontmatter titles)

## Documentation Requirements

**Must Update:**
- `hizmetlerimiz.mdx` — Add two missing service links after the existing "Güneş Enerjisi" entry

**Check If Affected:**
- `docs.json` — Review only. Both pages (`gunes-enerjisi-ile-elektrik-uretimi`, `gunes-enerjisi-ile-su-isitma`) already exist in the "Güneş Enerjisi" tab navigation. No modification needed.

## Completion Criteria

- [ ] All steps complete
- [ ] `hizmetlerimiz.mdx` contains exactly 16 service entries
- [ ] `Güneş Enerjisi ile Elektrik Üretimi` linked to `/hizmetlerimiz/gunes-enerjisi-ile-elektrik-uretimi`
- [ ] `Güneş Enerjisi ile Su Isıtma` linked to `/hizmetlerimiz/gunes-enerjisi-ile-su-isitma`
- [ ] Both links appear immediately after the existing "Güneş Enerjisi" entry
- [ ] Every `.mdx` file in `hizmetlerimiz/` has a corresponding link in `hizmetlerimiz.mdx`
- [ ] No existing links removed or altered
- [ ] No duplicate entries
- [ ] Documentation delivered as task document

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step 1 completion:** `feat(FN-006): add missing service links to hizmetlerimiz.mdx`
- **Bug fixes:** `fix(FN-006): description`
- **Docs update:** `docs(FN-006): add delivery summary`

## Do NOT

- Modify `docs.json` — navigation already covers both pages
- Remove, rename, or delete any files in `hizmetlerimiz/`
- Change the display name convention (use the full `title:` frontmatter value as the link text)
- Add services that don't have a corresponding `.mdx` file in `hizmetlerimiz/`
- Reorder existing list items — only insert the two new lines after the "Güneş Enerjisi" entry
- Add duplicate entries
- Add leading/trailing whitespace changes unrelated to the insertions
