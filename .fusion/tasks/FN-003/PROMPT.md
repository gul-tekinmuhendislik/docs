# Task: FN-003 — Add TSE page to Mintlify navigation and markalar index

**Created:** 2026-05-26
**Size:** S

## Review Level: 0 (None)

**Assessment:** Adding a single page reference to two files — no logic, no new components, no risk patterns.
**Score:** 1/8 — Blast radius: 0, Pattern novelty: 0, Security: 0, Reversibility: 1

## Mission

The `markalar/tse.mdx` page exists and renders correctly when accessed directly, but it is not listed in the Mintlify sidebar navigation under the "Ana Menü > Tüm Markalar" group, nor is it linked from the `markalar.mdx` brand index page. This means users cannot discover the TSE page through normal site navigation. TSE (Türk Standartları Enstitüsü) is a standards body, not a commercial brand, but the page provides important quality/standards context for the company's offerings. Add a navigation entry in `docs.json` under the "Tüm Markalar" group and add the link to `markalar.mdx`.

## Dependencies

- **None** (FN-005 depends on this task, not the other way around — see FN-005's PROMPT.md)

## Context to Read First

- `docs.json` — Mintlify config; specifically the `navigation.tabs[0].groups[2]` ("Tüm Markalar") pages array
- `markalar.mdx` — brand index page listing all partner brands
- `markalar/tse.mdx` — the page that needs to be surfaced

## File Scope

- `docs.json` — add `"markalar/tse"` to the "Tüm Markalar" group's pages array
- `markalar.mdx` — add `- [TSE](/markalar/tse)` link

## Steps

### Step 0: Preflight

- [ ] `markalar/tse.mdx` exists (verify the file is present)
- [ ] `docs.json` is valid JSON and readable
- [ ] `markalar.mdx` exists and is readable

### Step 1: Add TSE to Mintlify navigation

- [ ] In `docs.json`, locate the `navigation.tabs[0].groups[2]` ("Tüm Markalar") pages array
- [ ] Insert `"markalar/tse"` at the correct alphabetical position — **after `"markalar/toshiba"` and before `"markalar/varmeks"`** (alphabetical sort: `tekneciler` → `teksan` → `toshiba` → `tse` → `varmeks`)
- [ ] Verify the resulting JSON is valid (parse with `node -e "JSON.parse(require('fs').readFileSync('docs.json','utf8'))"` or equivalent)

**Artifacts:**
- `docs.json` (modified)

### Step 2: Add TSE to markalar.mdx index page

- [ ] Read `markalar.mdx` and locate the alphabetical insertion point — after the `Sukar` entry
- [ ] Insert `- [TSE](/markalar/tse)` at the correct alphabetical position by display name (after `Sukar` and before any brand starting with `T` like `Teksan` or `Tekneciler`)
- [ ] Match existing link format: `- [Display Name](/markalar/slug)`
- [ ] Verify no duplicate entries were introduced

**Artifacts:**
- `markalar.mdx` (modified)

### Step 3: Testing & Verification

> ZERO test failures allowed.

- [ ] Run `node -e "JSON.parse(require('fs').readFileSync('docs.json','utf8'))"` to confirm `docs.json` is valid JSON
- [ ] Verify `docs.json` contains exactly one instance of `"markalar/tse"` in the navigation
- [ ] Verify `markalar.mdx` contains exactly one instance of `[TSE](/markalar/tse)`
- [ ] Verify no existing navigation entries or markalar links were removed or altered

### Step 4: Documentation & Delivery

- [ ] Save documentation deliverables as task documents via `fn_task_document_write` (key="docs", content="Added `markalar/tse` to Mintlify navigation (Ana Menü > Tüm Markalar, after toshiba, before varmeks) and to the markalar.mdx index page.")
- [ ] Out-of-scope findings created as new tasks via `fn_task_create` tool

## Documentation Requirements

**Must Update:**
- `docs.json` — navigation entry added
- `markalar.mdx` — link added

**Check If Affected:**
- None

## Completion Criteria

- [ ] `markalar/tse` appears in the "Ana Menü > Tüm Markalar" sidebar navigation in `docs.json` between `toshiba` and `varmeks`
- [ ] `markalar/tse` is linked from `markalar.mdx` in alphabetical position after `Sukar`
- [ ] `docs.json` is valid JSON
- [ ] No duplicate entries exist
- [ ] No existing entries were removed or modified

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-003): complete Step 1 — add TSE to Mintlify navigation`
- **Step completion:** `feat(FN-003): complete Step 2 — add TSE to markalar index`
- **Bug fixes:** `fix(FN-003): description`
- **Tests:** `test(FN-003): description`

## Do NOT

- Remove, reorder, or modify any existing navigation entries
- Change the TSE page content or frontmatter
- Add TSE to any other navigation tab groups (it belongs only in "Tüm Markalar")
- Remove or modify any brand pages
- Add any other missing brands to navigation or index (those are covered by FN-005)
- Commit without the task ID prefix

## Changeset Requirements

No changeset required — this task adds entries rather than removing functionality.
