# Task: FN-008 — Convert varmeks.md to .mdx Format

**Created:** 2026-05-26
**Size:** S

## Review Level: 0 (None)

**Assessment:** Trivial rename operation on a single file with no content changes. The file already contains valid Markdown with YAML frontmatter — MDX is a superset, so no content transformation is needed. docs.json already uses extensionless Mintlify paths that auto-resolve. Blast radius is one file; fully reversible via `git restore`.

**Score:** 1/8 — Blast radius: 0, Pattern novelty: 0, Security: 0, Reversibility: 1

## Mission

`markalar/varmeks.md` is the only `.md` file in the `markalar/` directory — all 46 other brand pages use `.mdx`. Rename it to `markalar/varmeks.mdx` for consistency across the project and to enable JSX component usage in future edits. No content changes are needed: the existing Markdown and YAML frontmatter are valid MDX as-is. Despite `.mdx` being a Mintlify requirement only when JSX components are present, standardizing all brand pages to `.mdx` eliminates a source of inconsistency and tooling issues (e.g., the `add_meta_descriptions.py` script only processes `.mdx` files, as noted in FN-009).

## Dependencies

- **None**

## Context to Read First

- `markalar/varmeks.md` — The single source file being renamed (read to confirm its content is clean Markdown)
- `docs.json` — Mintlify navigation config; verify existing `markalar/varmeks` references use extensionless paths

## File Scope

- `markalar/varmeks.md` → `markalar/varmeks.mdx` (renamed)

## Steps

### Step 0: Preflight

- [ ] `markalar/varmeks.md` exists and contains valid YAML frontmatter + Markdown content
- [ ] Every other file in `markalar/` is `.mdx` (confirm with `ls markalar/*.md`)
- [ ] `docs.json` references `"markalar/varmeks"` using extensionless paths (no `.md` or `.mdx` suffix) — these will auto-resolve after the rename

### Step 1: Rename varmeks.md → varmeks.mdx

- [ ] Rename `markalar/varmeks.md` to `markalar/varmeks.mdx` using `git mv markalar/varmeks.md markalar/varmeks.mdx` (preserves git history)
- [ ] Confirm the file content is byte-for-byte identical (only the filename changed)
- [ ] Run `ls markalar/varmeks.md` to confirm no `.md` file remains
- [ ] Run `ls markalar/varmeks.mdx` to confirm the `.mdx` file exists
- [ ] Run `ls markalar/*.md` to confirm no `.md` files remain in `markalar/`

**Artifacts:**
- `markalar/varmeks.mdx` (renamed from `markalar/varmeks.md`)

### Step 2: Verify docs.json References

Mintlify resolves extensionless page paths like `"markalar/varmeks"` by searching for the matching file — it will find `markalar/varmeks.mdx` after the rename. No changes to `docs.json` are needed.

- [ ] Confirm `grep '"markalar/varmeks"' docs.json` returns exactly 3 matches (one per navigation group)
- [ ] Each reference is the bare path `"markalar/varmeks"` without any file extension

**Artifacts:**
- `docs.json` (unchanged — verified correct)

### Step 3: Testing & Verification

> This project has no test framework, lint runner, or typechecker. Verification is manual but thorough.

- [ ] `markalar/varmeks.mdx` reads correctly (frontmatter intact, content unmodified)
- [ ] `markalar/varmeks.md` no longer exists
- [ ] No other `.md` files exist in `markalar/` (`ls markalar/*.md` returns nothing)
- [ ] `git log --follow markalar/varmeks.mdx` shows the file's rename history (git mv preserved it)

### Step 4: Documentation & Delivery

- [ ] Save a task document via `fn_task_document_write` (key="docs", content="Renamed markalar/varmeks.md → markalar/varmeks.mdx. Content unchanged. docs.json references already use extensionless Mintlify paths and auto-resolve to the new .mdx file. All markalar/ files are now consistently .mdx.")
- [ ] If any out-of-scope findings emerge, create new tasks via `fn_task_create`

## Documentation Requirements

**Must Update:**
- None (file rename only; docs.json needs no changes)

**Check If Affected:**
- `docs.json` — references already use extensionless paths; verify, do not modify

## Completion Criteria

- [ ] `markalar/varmeks.md` renamed to `markalar/varmeks.mdx` via `git mv` (history preserved)
- [ ] File content is identical to the original
- [ ] All `markalar/` files are now `.mdx` (no `.md` files remain)
- [ ] `docs.json` references verified to work with the renamed file

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-008): complete Step N — description`
- **Bug fixes:** `fix(FN-008): description`

## Do NOT

- Change the file content (the existing Markdown is valid MDX as-is)
- Modify `docs.json` (its extensionless paths already auto-resolve)
- Merge or combine content from `warmeks.mdx` (that is FN-002's scope)
- Delete `markalar/varmeks.md` with `rm` instead of `git mv` (preserve git history)
- Expand scope to fix anything outside this rename operation
- Commit without the task ID prefix

## Changeset Requirements

No changeset needed — this task does not remove functionality; it renames a file while preserving its content and git history.
