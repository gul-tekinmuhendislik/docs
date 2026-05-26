# Task: FN-005 — Markalar index sayfasına eksik marka linklerini ekleme

**Created:** 2026-05-26
**Size:** S

## Review Level: 1 (Plan Only)

**Assessment:** Simple content addition to a single Markdown index page. No code, no build, no security surface. Fully reversible — just add list items. Pattern is already well-established.
**Score:** 1/8 — Blast radius: 0, Pattern novelty: 0, Security: 0, Reversibility: 2

## Mission

`markalar.mdx` (the brand index page) currently lists 36 of 47 brand page files from the `markalar/` directory. Several brand pages exist on disk but are missing from the index. Add a link for every brand file that exists in `markalar/` but is not yet listed in `markalar.mdx`, inserted at the correct alphabetical position. This ensures users can discover all brands from the central index page.

## Dependencies

- **Task:** FN-002 (resolves duplication between `warmeks.mdx` and `varmeks.md` — only the canonical file will remain after this task)
- **Task:** FN-003 (adds `tse` link to `markalar.mdx` and `"markalar/tse"` to `docs.json` navigation — TSE will already be in the index when this task starts)

## Context to Read First

- `markalar.mdx` — The index page to edit (after FN-003 has already added the TSE link)
- `markalar/` directory — List all `.mdx` and `.md` files to determine which brands physically exist
- `docs.json` — "Tüm Markalar" navigation group shows which brands Mintlify expects; use this for cross-reference, but do NOT modify it
- `markalar/tse.mdx` — example of a brand page frontmatter pattern (for understanding display name convention)

## File Scope

- `markalar.mdx` (modified — add missing brand links in alphabetical order)

## Steps

### Step 0: Preflight

- [ ] Confirm FN-002 is done (varmeks/warmeks duplication resolved — only one file remains)
- [ ] Confirm FN-003 is done (TSE link already added to `markalar.mdx`)
- [ ] List files in `markalar/` — get the current set of `.mdx`/`.md` brand page files
- [ ] Read `markalar.mdx` — get the current list of links (including the newly-added TSE link from FN-003)

### Step 1: Identify missing brands and add them

- [ ] **Cross-reference:** for each file in `markalar/`, check if a corresponding `- [Name](/markalar/<slug>)` link exists in `markalar.mdx`. The `<slug>` matches the filename without extension. Only add files whose link is completely absent.
- [ ] **Skip TSE** — it was already added by FN-003 (verify it's present in the list; if accidentally missing, add it, but normally it will already be there).
- [ ] For each missing brand, determine the display name by reading the file's `title:` frontmatter field and extracting the **first whitespace-delimited token** (the short brand name). Examples:
  - `teksan.mdx` → frontmatter `title: "Teksan Sanayi Tipi Su Depoları"` → display name `Teksan`
  - `vesbo.mdx` → frontmatter `title: "Vesbo PPR Boru Sistemleri"` → display name `Vesbo`
  - `wepomp.mdx` → frontmatter `title: "Wepomp Su Arıtma Sistemleri"` → display name `Wepomp`
  - `yelkenci.mdx` → frontmatter `title: "Yelkenci Su Depoları"` → display name `Yelkenci`
  - `toshiba.mdx` → frontmatter `title: "Toshiba Klima ve Isıtma Sistemleri"` → display name `Toshiba`
  - `vitra.mdx` → frontmatter `title: "VitrA Banyo ve Vitrifiye Ürünleri"` → display name `VitrA` (preserve exact capitalization from the title)
  - `tekneciler.mdx` → frontmatter `title: "Tekneciler Metal Su Depoları"` → display name `Tekneciler`
  - After FN-002 resolution, only the canonical file (either `varmeks` or `warmeks`) will remain — determine its display name from the frontmatter first token.
- [ ] **Insert each missing link** as a new `- [Display Name](/markalar/<slug>)` line at the correct **alphabetical position** among the existing list items. The list is already alphabetically sorted by display name — maintain that ordering:
  - Sort order: existing entries are alphabetical. Insert the new entries at the correct position relative to existing ones.
  - Turkish locale collation applies (e.g. `ç/Ç` after `c/C`, `ğ/Ğ` after `g/G`, `ı/I` after `i/I`, `ö/Ö` after `o/O`, `ş/Ş` after `s/S`, `ü/Ü` after `u/U`). Since none of the missing brands contain Turkish special characters, standard ASCII alphabetical order is sufficient.
- [ ] **Do NOT** remove or modify any existing links — only insert new ones.
- [ ] **Verify:** after insertion, every `.mdx`/`.md` file in `markalar/` has exactly one corresponding link in `markalar.mdx`, and the list remains in strict alphabetical order.

### Step 2: Verification

- [ ] Read the updated `markalar.mdx` and verify:
  - Every file in `markalar/` (`.mdx` and `.md` extensions) has a matching `- [Name](/markalar/slug)` line
  - No duplicate entries
  - List is in strict alphabetical order by display name
  - All slugs match the filename without extension (e.g., `/markalar/teksan` for `teksan.mdx`)
  - TSE link (from FN-003) is still present and not duplicated
- [ ] Re-read `docs.json` and check the "Ana Menü > Tüm Markalar" navigation group — if any brand files exist on disk but are missing from the navigation (other than `tse` which is tracked by FN-003), create a follow-up task via `fn_task_create`. Note that `docs.json` already contains navigation entries for `tekneciler`, `teksan`, `toshiba`, `vesbo`, `vitra`, `wepomp`, `wilo`, and `yelkenci` — these should already be present and require no action.

### Step 3: Documentation & Delivery

- [ ] Save a summary of what was added as a task document via `fn_task_document_write` (key="docs", content=Markdown list of each added brand with display name, slug, and the brand page's full frontmatter title)
- [ ] If any brand files exist in `markalar/` but are absent from `docs.json`'s "Tüm Markalar" navigation group (aside from `tse`, which is tracked by FN-003), create a new task via `fn_task_create`

## Documentation Requirements

**Must Update:**
- `markalar.mdx` — Add missing brand links in alphabetical order

**Check If Affected:**
- `docs.json` — Do NOT modify. Review only. If navigation entries are missing, create a new task.

## Completion Criteria

- [ ] All steps complete
- [ ] Every `.mdx`/`.md` file in `markalar/` has a corresponding link in `markalar.mdx`
- [ ] All links use correct slug paths matching filename without extension
- [ ] List is in strict alphabetical order by display name
- [ ] No existing links removed or altered
- [ ] No duplicate entries
- [ ] TSE link (from FN-003) present and not duplicated
- [ ] Documentation delivered as task document

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step 1 completion:** `feat(FN-005): add missing brand links to markalar.mdx`
- **Bug fixes:** `fix(FN-005): description`
- **Docs update:** `docs(FN-005): add delivery summary`

## Do NOT

- Modify `docs.json` — navigation updates are separate tasks (FN-003 for TSE, others as new tasks)
- Remove, rename, or delete any files in `markalar/`
- Change the display name style convention (use the first token of `title:` frontmatter)
- Add brands that don't have a corresponding file in `markalar/`
- Reorder existing list items — only insert new ones at the correct position
- Add duplicate entries
- Add leading/trailing whitespace changes unrelated to the insertions
- Re-add TSE if it was already added by FN-003 (check first to avoid duplication)
