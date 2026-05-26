# Task: FN-007 — Add isi-pompalari technical reference pages to navigation

**Created:** 2026-05-26
**Size:** S

## Review Level: 0 (None)

**Assessment:** Two files being renamed and added to navigation. Content already high quality with valid frontmatter. Simple rename + config change. No security surface. Fully reversible by reverting the rename and config change.
**Score:** 1/8 — Blast radius: 1, Pattern novelty: 0, Security: 0, Reversibility: 0

## Mission

Two valuable technical reference documents — `isi-pompalari/genel-bilgi.md` (Isı Pompaları Hakkında Genel Bilgiler) and `isi-pompalari/varmeks-seriler.md` (Varmeks Isı Pompaları Seriler ve Özellikleri) — exist on disk but are not linked from any navigation tab or group in `docs.json`. They are currently `.md` files while the rest of the project uses `.mdx`. Convert both to `.mdx` (rename) and add them to the "Isı Pompaları" tab in `docs.json` under a new "Teknik Bilgiler" group, so users can discover this content from the navigation sidebar.

## Dependencies

- **None**

## Context to Read First

- `docs.json` — The Mintlify navigation config. The "Isı Pompaları" tab structure needs a new group.
- `isi-pompalari/genel-bilgi.md` — Content to convert and add to nav. Already has valid frontmatter (`title: "Isı Pompaları Hakkında Genel Bilgiler"`, `description`).
- `isi-pompalari/varmeks-seriler.md` — Content to convert and add to nav. Already has valid frontmatter (`title: "Varmeks Isı Pompaları Seriler ve Özellikleri"`, `description`).
- `hizmetlerimiz/isi-pompalari.mdx` — The main heat pump service page. Read for context on how these technical reference pages relate.
- `markalar/tse.mdx` — Reference for how other standalone technical reference pages (non-service, non-brand) are structured in the project.

## File Scope

- `isi-pompalari/genel-bilgi.md` (rename to `.mdx`)
- `isi-pompalari/varmeks-seriler.md` (rename to `.mdx`)
- `docs.json` (modified — add new "Teknik Bilgiler" group under "Isı Pompaları" tab)

## Steps

### Step 0: Preflight

- [ ] Read `docs.json` and confirm the current "Isı Pompaları" tab structure:
  - Main page: `hizmetlerimiz/isi-pompalari`
  - Group "Isı Pompası Markaları" (8 brand pages)
  - Group "İlgili Hizmetler" (3 service pages)
- [ ] Confirm that neither `isi-pompalari/genel-bilgi` nor `isi-pompalari/varmeks-seriler` appears anywhere in `docs.json` navigation
- [ ] Read both files and confirm they have valid frontmatter (`title`, `description` fields) and no MDX-specific syntax issues — they are plain Markdown with standard frontmatter, safe to rename to `.mdx`
- [ ] Confirm there is no existing `isi-pompalari/genel-bilgi.mdx` or `isi-pompalari/varmeks-seriler.mdx` that would conflict with the rename

### Step 1: Convert .md to .mdx

- [ ] Rename `isi-pompalari/genel-bilgi.md` → `isi-pompalari/genel-bilgi.mdx` using `git mv` (preserves git history)
- [ ] Rename `isi-pompalari/varmeks-seriler.md` → `isi-pompalari/varmeks-seriler.mdx` using `git mv` (preserves git history)
- [ ] Verify both renamed files read correctly — same content, same frontmatter, file extension is now `.mdx`

### Step 2: Add navigation entries in docs.json

- [ ] Locate the "Isı Pompaları" tab in `docs.json` (the object with `"tab": "Isı Pompaları"`)
- [ ] Add a new group `"Teknik Bilgiler"` as the second entry in the `pages` array (immediately after the main `"hizmetlerimiz/isi-pompalari"` entry, before the "Isı Pompası Markaları" group), with the following structure:

```json
{
  "group": "Teknik Bilgiler",
  "pages": [
    "isi-pompalari/genel-bilgi",
    "isi-pompalari/varmeks-seriler"
  ]
}
```

- [ ] Verify the resulting "Isı Pompaları" tab `pages` array order is:
  1. `"hizmetlerimiz/isi-pompalari"` (main service page)
  2. `{"group": "Teknik Bilgiler", "pages": ["isi-pompalari/genel-bilgi", "isi-pompalari/varmeks-seriler"]}` (new group — technical reference)
  3. `{"group": "Isı Pompası Markaları", "pages": [...]}` (brands)
  4. `{"group": "İlgili Hizmetler", "pages": [...]}` (related services)
- [ ] Run targeted validation: ensure the `docs.json` is valid JSON (e.g., `python3 -c "import json; json.load(open('docs.json'))"`)

### Step 3: Testing & Verification

> ZERO test failures allowed. Full test suite as quality gate.

- [ ] Run `python3 -c "import json; d=json.load(open('docs.json')); nav=d['navigation']['tabs']; hp=[t for t in nav if t['tab']=='Isı Pompaları'][0]; pages=hp['pages']; assert any(g.get('group')=='Teknik Bilgiler' for g in pages if isinstance(g,dict)), 'Teknik Bilgiler group missing'; tb=[g for g in pages if isinstance(g,dict) and g.get('group')=='Teknik Bilgiler'][0]; assert 'isi-pompalari/genel-bilgi' in tb['pages'], 'genel-bilgi missing'; assert 'isi-pompalari/varmeks-seriler' in tb['pages'], 'varmeks-seriler missing'; print('Navigation validation PASSED')"`
- [ ] Verify both `.mdx` files exist: `test -f isi-pompalari/genel-bilgi.mdx && test -f isi-pompalari/varmeks-seriler.mdx && echo "All files exist"`
- [ ] Verify no `.md` versions remain: `test ! -f isi-pompalari/genel-bilgi.md && test ! -f isi-pompalari/varmeks-seriler.md && echo "No stale .md files"`
- [ ] Run `python3 -c "import json; d=json.load(open('docs.json')); nav=d['navigation']['tabs']; hp=[t for t in nav if t['tab']=='Isı Pompaları'][0]; assert len(hp['pages']) == 4, f'Expected 4 entries in Isı Pompaları tab pages array, got {len(hp[\"pages\"])}'; print(f'OK: Isı Pompaları tab has {len(hp[\"pages\"])} groups/pages')"`
- [ ] Run any project-level lint or validity checks if available (e.g., Mintlify's `mintlify dev` node check — try `npx mintlify dev --check` if `mintlify` is a dependency in `package.json`; if no package.json or no mintlify CLI, this is optional)
- [ ] Fix all failures immediately — do not skip

### Step 4: Documentation & Delivery

- [ ] Save a delivery summary as a task document via `fn_task_document_write` (key="docs", content=Markdown summary listing the two converted files, their new paths, and their navigation placement)
- [ ] Out-of-scope findings created as new tasks via `fn_task_create` tool (if any related issues are discovered)

## Documentation Requirements

**Must Update:**
- `docs.json` — Add "Teknik Bilgiler" group with the two pages under the "Isı Pompaları" tab

**Check If Affected:**
- `isi-pompalari/` directory listing — no index/readme page to update, but verify no other references to the old `.md` paths exist in the project

## Completion Criteria

- [ ] `isi-pompalari/genel-bilgi.md` renamed to `isi-pompalari/genel-bilgi.mdx`
- [ ] `isi-pompalari/varmeks-seriler.md` renamed to `isi-pompalari/varmeks-seriler.mdx`
- [ ] No stale `.md` files remain in `isi-pompalari/`
- [ ] `docs.json` "Isı Pompaları" tab has a new "Teknik Bilgiler" group containing both pages
- [ ] `docs.json` is valid JSON (passes `json.load()`)
- [ ] Navigation structure maintained — existing groups and pages in the "Isı Pompaları" tab are undisturbed
- [ ] Delivery summary saved as task document

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step 1 completion:** `feat(FN-007): convert isi-pompalari .md files to .mdx`
- **Step 2 completion:** `feat(FN-007): add Teknik Bilgiler group under Isı Pompaları tab`
- **Bug fixes:** `fix(FN-007): description`
- **Docs update:** `docs(FN-007): add delivery summary`

## Do NOT

- Modify, edit, or change the content of either `.mdx` file — the task is only rename + navigation addition
- Remove, delete, or modify any existing navigation entries in `docs.json` — only add the new group
- Create new files beyond the renamed `.mdx` files and any `fn_task_document_write` documents
- Add these pages to any tab other than "Isı Pompaları"
- Modify `hizmetlerimiz/isi-pompalari.mdx` — it does not need links to these reference pages (they are secondary reference, not primary service content)
- Rename or move files to a different directory — keep them in `isi-pompalari/`
- Add these files to the "Ana Menü > Tüm Hizmetlerimiz" group — they are not service pages, they are technical reference

## Changeset Requirements

Not applicable — this task adds content and navigation entries (net-positive change, no deletions).
