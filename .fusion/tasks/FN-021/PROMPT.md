# Task: FN-021 — Format Fixes: warmeks.mdx JSON → Markdown & varmeks.md → .mdx

**Created:** 2026-05-26
**Size:** S

## Review Level: 1 (Plan Only)

**Assessment:** Two isolated format fixes in one directory. No logic changes, no new features. Blast radius is two files. Fully reversible via `git restore`. No security implications.

**Score:** 2/8 — Blast radius: 0, Pattern novelty: 1, Security: 0, Reversibility: 1

## Mission

Fix two format problems in `markalar/` that prevent the brand pages from rendering cleanly:

1. **warmeks.mdx** contains an embedded raw JSON data blob (`{"value": {"answer": "..."}}`) dumped by the NLM enrichment pipeline. The JSON wraps substantial technical content about Varmeks' product series (Varm Up, Varm Silent Pool, Varm Boost, Varm Fuzzy), refrigerants (R290/R32/R410A), COP values, and -30°C operation — details that should be readable Markdown, not encoded JSON. Extract the `answer` field, convert it to proper structured Markdown sections, and repair the truncated content (the JSON ends mid-sentence with "Büyük ölçekl").

2. **varmeks.md** uses the `.md` extension while all 46 other brand pages in `markalar/` use `.mdx`. Rename it to `.mdx` and transfer its content. Varmeks' 7 product series, technical specs, COP values, application areas, and certifications are well-structured in the current `.md` file — preserve everything as-is during the conversion.

Also research and confirm whether "Warmeks" and "Varmeks" are the same brand or different. Evidence from the JSON content (`"Varmeks (veya kaynaklarda geçtiği haliyle Warmeks)"`) strongly indicates they're the same brand with a misspelling — document the finding.

This task provides the format fixes needed by FN-016 (quality audit) to scan clean files. Note: FN-002 (Varmeks/Warmeks dosya birleştirme) has overlapping scope — it handles these same files plus a full merge, spelling fixes, and markalar.mdx updates. FN-021 is narrower: it fixes the format issues independently without merging files or resolving the naming conflict. FN-002 will consume FN-021's output when it runs.

## Dependencies

- **None** (FN-016 depends on this task, not the other way around)

## Context to Read First

- `markalar/warmeks.mdx` — contains raw JSON blob; title says "Warmeks" but JSON answer field says "Varmeks"
- `markalar/varmeks.md` — clean, well-structured content, but `.md` extension instead of `.mdx`
- Any reference brand page (e.g. `markalar/panasonic.mdx` or `markalar/baymak.mdx`) — to confirm standard frontmatter + section format

## File Scope

- `markalar/warmeks.mdx` (modified — JSON extracted to clean Markdown)
- `markalar/varmeks.md` → `markalar/varmeks.mdx` (renamed + content transferred; original .md deleted)

## Steps

### Step 0: Preflight

- [ ] `markalar/warmeks.mdx` exists and contains an `{"value": {"answer": "..."}}` JSON blob
- [ ] `markalar/varmeks.md` exists and is the only `.md` file in `markalar/` (confirm with `ls markalar/*.md`)
- [ ] Read one reference brand page (e.g. `markalar/panasonic.mdx` or `markalar/baymak.mdx`) to internalize the standard frontmatter + section pattern

### Step 1: Research warmeks vs varmeks Identity

> Determine whether "Warmeks" and "Varmeks" are the same brand.

- [ ] Read the JSON answer field in `markalar/warmeks.mdx` — the content explicitly says: `"Gül-Tekin Mühendislik'in ürün portföyünde yer alan **Varmeks** (veya kaynaklarda geçtiği haliyle Warmeks)"` — this is the primary source confirming they are the same brand
- [ ] Cross-check: The product series described in warmeks.mdx (Varm Up, Varm Silent Pool, Varm Boost, Varm Fuzzy) match the product series in varmeks.md (Varm Up, Varm Fuzzy, Varm Commercial, Varm Plus, Varm Pool, Varm BCP, Varm All)
- [ ] Read `scripts/docs-enrichment.log` — it shows `Querying NLM for brand: warmeks` and `Enriching brand: markalar/warmeks.mdx`, confirming the NLM pipeline treats "warmeks" as the brand slug
- [ ] Check `docs.json` — it references `"markalar/varmeks"` (3 occurrences) but no `"markalar/warmeks"` reference, confirming "varmeks" is the canonical navigation name
- [ ] **Conclusion:** "Warmeks" is a misspelling of "Varmeks" — they are the same brand. Save this finding.

**Artifacts:**
- In-memory research finding: warmeks = Varmeks (same brand, misspelled name)

### Step 2: Fix warmeks.mdx — Extract JSON to Clean Markdown

> Convert the raw `{"value": {"answer": "..."}}` JSON blob into proper structured Markdown sections.
> The JSON is the only content under `## Teknik Bilgi` — replace that section and remove the JSON wrapper entirely.
> Also fix the title and description in the frontmatter (currently says "Warmeks" — change to "Varmeks").
> The JSON content is truncated ("Büyük ölçekl" cuts off) — the extracted content will be incomplete, but convert what's available cleanly.

- [ ] Parse the JSON: extract the `value.answer` string — this contains the actual Markdown content
- [ ] In `markalar/warmeks.mdx`:
  - Change frontmatter `title` from `"Warmeks Isıtma Sistemleri"` to `"Varmeks Isıtma Sistemleri"`
  - Change frontmatter `description` from `"warmeks - Gül-tekin ..."` to a proper Varmeks description (use the description from `varmeks.md` as a template: `"Varmeks ısı pompaları ve enerji verimli çözümler. Varm Up, Varm Silent Pool, Varm Boost ve Varm Fuzzy serileri hakkında detaylı bilgiler."`)
  - Replace the entire `## Teknik Bilgi` section and the JSON block with the extracted `answer` content formatted as clean Markdown
  - The extracted answer content has section headers like `### 1. Varmeks Ürün Serileri ve Teknik Özellikleri` — these should be demoted one level to `## 1. ...` since they are top-level sections after the main title
  - Fix "Warmeks" references in the non-JSON body content: change `## Gül-Tekin Mühendislik ile Warmeks` to `## Gül-Tekin Mühendislik ile Varmeks` and fix the paragraph below it
  - Remove any remaining JSON wrapper artifacts, citation brackets like `[1-3]`, `[4, 5]`, `[6, 7]` etc. (these are NLM citation markers, not useful in production docs)
- [ ] Verify no JSON wrapper remains in the file (`grep '^{' markalar/warmeks.mdx` should return nothing for the JSON block)
- [ ] Verify all "Warmeks" → "Varmeks" replacements are applied throughout the file
- [ ] Verify the file still has valid YAML frontmatter (starts with `---`, ends with `---`)

**Artifacts:**
- `markalar/warmeks.mdx` (modified)

### Step 3: Convert varmeks.md → varmeks.mdx

> Rename varmeks.md to .mdx (preserving git history) with identical content.
> varmeks.md already contains clean, well-structured Markdown — no content changes needed for the rename itself.

- [ ] Rename `markalar/varmeks.md` to `markalar/varmeks.mdx` using `git mv markalar/varmeks.md markalar/varmeks.mdx` (preserves git history)
- [ ] Confirm the file content is byte-for-byte identical (only the filename changed)
- [ ] Run `ls markalar/varmeks.md` to confirm no `.md` file remains
- [ ] Run `ls markalar/varmeks.mdx` to confirm the `.mdx` file exists
- [ ] Run `ls markalar/*.md` to confirm no `.md` files remain in `markalar/`

**Artifacts:**
- `markalar/varmeks.mdx` (renamed from `markalar/varmeks.md`)

### Step 4: Testing & Verification

> This project has no test framework, lint runner, or typechecker. Verification is manual but thorough.

- [ ] `markalar/warmeks.mdx` has no JSON wrapper remaining (confirm with `grep -c '"value"' markalar/warmeks.mdx` returns 0)
- [ ] `markalar/warmeks.mdx` has no "Warmeks" references remaining (confirm with `grep -i -c 'warmeks' markalar/warmeks.mdx` returns 0)
- [ ] `markalar/warmeks.mdx` has valid frontmatter (YAML between `---` markers)
- [ ] `markalar/varmeks.mdx` exists and has identical content to the original `markalar/varmeks.md`
- [ ] `markalar/varmeks.md` no longer exists
- [ ] No `.md` files remain in `markalar/` (`ls markalar/*.md` returns nothing)
- [ ] `git log --follow markalar/varmeks.mdx` shows the rename history (git mv preserved it)
- [ ] Both files are readable as valid Markdown (sections render properly, no broken formatting)
- [ ] `docs.json` references to `"markalar/varmeks"` still resolve (extensionless Mintlify paths auto-resolve to .mdx files — no changes needed)

### Step 5: Documentation & Delivery

- [ ] Save documentation deliverables via `fn_task_document_write` (key="docs", content=JSON extraction summary + rename summary + research findings)
  - **Research finding:** warmeks = Varmeks (same brand, "Warmeks" is a misspelling of "Varmeks"). Evidence: the JSON answer field explicitly states this, product series match, docs.json only references "varmeks".
  - **Format fix #1:** Extracted JSON `value.answer` from warmeks.mdx into clean Markdown sections. Removed citation brackets. Fixed frontmatter title/description from "Warmeks" to "Varmeks". Content remains truncated at the end (original data was incomplete).
  - **Format fix #2:** Renamed varmeks.md → varmeks.mdx via git mv. Content unchanged. No .md files remain in markalar/.
- [ ] Out-of-scope findings created as new tasks via `fn_task_create` tool

## Documentation Requirements

**Must Update:**
- `markalar/warmeks.mdx` — JSON removed, frontmatter fixed, "Warmeks" → "Varmeks" in body
- `markalar/varmeks.mdx` — created from rename of `varmeks.md`

**Check If Affected:**
- `docs.json` — verify references to `"markalar/varmeks"` still work with `.mdx` file (no changes needed — extensionless paths auto-resolve)

## Completion Criteria

- [ ] JSON data blob removed from `markalar/warmeks.mdx` — content converted to clean Markdown
- [ ] All "Warmeks" references in `warmeks.mdx` changed to "Varmeks" (frontmatter and body)
- [ ] Citation brackets `[1-3]`, `[4, 5]` etc. removed from warmeks.mdx
- [ ] `markalar/varmeks.md` renamed to `markalar/varmeks.mdx` via `git mv` (history preserved)
- [ ] `markalar/varmeks.md` no longer exists
- [ ] No `.md` files remain in `markalar/`
- [ ] Research documented: warmeks = Varmeks (same brand, misspelling)
- [ ] Documentation saved via `fn_task_document_write`

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-021): complete Step N — description`
- **Bug fixes:** `fix(FN-021): description`

## Do NOT

- Delete `markalar/warmeks.mdx` (that's FN-002's scope — this task fixes it in-place)
- Add Varmeks to `markalar.mdx` (that's FN-002's or FN-005's scope)
- Modify `docs.json` (its extensionless paths already auto-resolve)
- Merge the two files (that's FN-002's scope — this task fixes both files independently)
- Delete `markalar/varmeks.md` with `rm` instead of `git mv` (preserve git history)
- Change the content of `markalar/varmeks.md` during the rename (content is already clean and well-structured)
- Add or modify any brand page other than warmeks.mdx and varmeks.md
- Add service card groups or external link-card sections (those are FN-018/FN-019/FN-020 scope)
- Create a changeset (no functionality is removed — files are fixed and renamed, not deleted in a way that removes features)

## Changeset Requirements

No changeset needed — this task does not remove existing functionality; it fixes format issues and renames a file while preserving content.
