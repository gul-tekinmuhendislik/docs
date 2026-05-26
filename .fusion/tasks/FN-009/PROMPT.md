# Task: FN-009 — Fix add_meta_descriptions.py: hardcoded root, .md exclusion, HTML cleaning

**Created:** 2026-05-26
**Size:** S

## Review Level: 1 (Plan Only)

**Assessment:** Three focused bugs in a single standalone Python script with no dependencies beyond stdlib. Each fix is a small, isolated change. The script is not called by any other pipeline, so blast radius is limited to the one file. All changes are fully reversible via `git checkout`.

**Score:** 1/8 — Blast radius: 0, Pattern novelty: 0, Security: 0, Reversibility: 1

## Mission

The `add_meta_descriptions.py` script at the repo root generates YAML frontmatter `description` fields for Mintlify documentation pages. It has three bugs that make it unusable in the current repo: (1) `root_dir` is hardcoded to `/home/gul-tekin/docs-1` (a stale path on a different machine) instead of accepting the directory as a CLI argument, (2) the file scanner only processes `.mdx` files while ignoring `.md` files (e.g., `isi-pompalari/genel-bilgi.md`), and (3) `get_description_from_content()` does not strip HTML tags and also skips all lines starting with `<` via a guard clause, which means pages with inline HTML or lines starting with an HTML element (like the `<a>` link card in `hizmetlerimiz/isi-pompalari.mdx`) either produce descriptions with raw HTML or fall back to a generic default. Fix all three issues so the script can be run as `python3 add_meta_descriptions.py .` on the current repo and produce clean, usable descriptions for all Markdown/MDX files.

## Dependencies

- **None** (the script fix is independent; FN-007 and FN-008 convert `.md` files to `.mdx` but this script should defensively handle both formats regardless of their completion)

## Context to Read First

- `add_meta_descriptions.py` — The script to fix (read fully before making any changes)
- `hizmetlerimiz/isi-pompalari.mdx` — Contains `<a>`, `<div>`, `<span>` HTML tags in the first content paragraph; the `<` guard currently causes this page to fall back to a generic title-based description
- `index.mdx` — Root page for edge-case testing (in a subdirectory-less path)
- `hizmetlerimiz/akilli-oda-termostatlari.mdx` — Page whose first content paragraph has no HTML tags; should naturally produce a clean description without any stripping needed

## File Scope

- `add_meta_descriptions.py` (modified — fix all three bugs)

## Steps

### Step 0: Preflight

- [ ] `add_meta_descriptions.py` exists at the repo root and is valid Python 3
- [ ] Python 3 is available (`python3 --version`)
- [ ] The script uses only stdlib modules (`os`, `re`) — no requirements.txt or pip install needed
- [ ] Create a git stash for safe revert: `git stash push -m "FN-009-preflight" add_meta_descriptions.py` (optional)

### Step 1: Fix hardcoded root_dir — accept root directory as CLI argument

- [ ] Replace the hardcoded `root_dir = '/home/gul-tekin/docs-1'` (newline 55 in `main()`) with a `sys.argv` read
- [ ] Add `import sys` at the top of the file (currently only `os` and `re` are imported)
- [ ] Add a usage/error guard:
  ```python
  if len(sys.argv) < 2:
      print("Usage: python3 add_meta_descriptions.py <root_directory>")
      sys.exit(1)
  root_dir = sys.argv[1]
  ```
- [ ] **Also validate** that `sys.argv[1]` is an actual directory: if `not os.path.isdir(root_dir)`, print an error and `sys.exit(1)`
- [ ] Remove the old hardcoded `root_dir = '/home/gul-tekin/docs-1'` line
- [ ] Update the `main()` docstring from "Process all MDX files" to "Process all Markdown/MDX files in the given root directory"
- [ ] **Verify:** `python3 add_meta_descriptions.py` (no args) → prints usage message, exits code 1
- [ ] **Verify:** `python3 add_meta_descriptions.py /nonexistent/path` → prints error about invalid directory, exits code 1
- [ ] **Verify:** `python3 add_meta_descriptions.py .` → processes files, exits code 0

**Artifacts:**
- `add_meta_descriptions.py` (modified)

### Step 2: Extend file scanning to include .md files

The script's `os.walk` loop only matches `.mdx` files. Extend it to also match `.md` files. Also fix both locations in `add_meta_description()` where the fallback title is derived from the filename by stripping `.mdx` — these must handle `.md` too.

- [ ] In the `os.walk` loop (in `main()`), change the filter from:
  ```python
  if filename.endswith('.mdx'):
  ```
  to:
  ```python
  if filename.endswith(('.mdx', '.md')):
  ```
- [ ] **Fix location 1** (has-frontmatter branch, line ~35): The fallback title extraction when no `title:` is found in the frontmatter does:
  ```python
  title = os.path.basename(file_path).replace('.mdx', '')
  ```
  Change to:
  ```python
  basename = os.path.basename(file_path)
  for ext in ('.mdx', '.md'):
      if basename.endswith(ext):
          basename = basename[:-len(ext)]
          break
  title = basename
  ```
- [ ] **Fix location 2** (no-frontmatter branch, line ~49): The same `.mdx`-only replace appears again:
  ```python
  title = os.path.basename(file_path).replace('.mdx', '')
  ```
  Apply the same fix as above.
- [ ] Update the print line in `main()` to say `"Processing all MDX and MD files"` or similar inclusive wording
- [ ] **Verify:** Run `python3 add_meta_descriptions.py .` with a file list that includes `.md` files (if any remain in the repo). Confirm they are not silently skipped. If FN-007/FN-008 have already removed all `.md` files, create a quick test: `echo '---\ntitle: Test File\n---\n\nHello world' > /tmp/test_fix.md` and copy it into a temp subdirectory, run the script against that temp dir, and confirm it processes the `.md` file.

**Artifacts:**
- `add_meta_descriptions.py` (modified)

### Step 3: Strip HTML tags and remove the `<` line guard in get_description_from_content()

The function `get_description_from_content()` has two problems that both prevent clean HTML-free descriptions:

**Problem A — the `<` line-level guard (line ~16):**
```python
if line and not line.startswith('#') and not line.startswith('<') and not line.startswith('-') and not line.startswith('*'):
```
This skips any line starting with `<` entirely — the line never reaches the cleaning block. Since we now strip HTML tags at the character level, this guard is unnecessary and counterproductive. **Remove `not line.startswith('<')`** from the condition.

**Problem B — no per-character HTML stripping:**
After removing Markdown links (`re.sub(r'\[([^\]]+)\]\([^\)]+\)', r'\1', line)`) and formatting (`re.sub(r'[*_`]', '', clean_line)`), add an HTML tag stripping step:
```python
clean_line = re.sub(r'<[^>]+>', '', clean_line)  # Strip HTML tags
```

Place this **last** in the cleaning chain (after link removal and formatting removal), so:
```python
clean_line = re.sub(r'\[([^\]]+)\]\([^\)]+\)', r'\1', line)  # Remove links
clean_line = re.sub(r'<[^>]+>', '', clean_line)                # Strip HTML tags
clean_line = re.sub(r'[*_`]', '', clean_line)                  # Remove formatting
```

- [ ] Remove `not line.startswith('<')` from the if-guard on line ~16
- [ ] Add `re.sub(r'<[^>]+>', '', clean_line)` as the HTML stripping step (after link removal, before formatting removal)
- [ ] **Verify with inline HTML:** Run the following and confirm the output has no angle brackets and contains the inner text:
  ```bash
  python3 -c "
import sys; sys.path.insert(0, '.')
from add_meta_descriptions import get_description_from_content
result = get_description_from_content('Metin <span class=\"badge\">etiket</span> devam', 'Test')
print(repr(result))
  "
  ```
  Expected: `'Metin etiket devam'` (no `<` or `>`)
- [ ] **Verify with leading HTML tag:** Run the following and confirm the line is no longer skipped:
  ```bash
  python3 -c "
import sys; sys.path.insert(0, '.')
from add_meta_descriptions import get_description_from_content
result = get_description_from_content('<a href=\"x\"><span class=\"badge\">ONAY</span></a>', 'Test')
print(repr(result))
  "
  ```
  Expected: `'ONAY'` (the HTML-stripped content of the formerly-guarded line)
- [ ] **Verify no regression on clean content:** Run:
  ```bash
  python3 -c "
import sys; sys.path.insert(0, '.')
from add_meta_descriptions import get_description_from_content
result = get_description_from_content('Sade bir metin paragrafi.', 'Test')
print(repr(result))
  "
  ```
  Expected: `'Sade bir metin paragrafi.'` (no change)

**Artifacts:**
- `add_meta_descriptions.py` (modified)

### Step 4: Functional end-to-end verification in a temp directory

Create a temporary test directory and run the script against it to prove all three fixes work together.

- [ ] Create a temp directory with test files:
  ```bash
  TMPDIR=$(mktemp -d)
  # Test file 1: .mdx with leading HTML tag (was skipped by the '<' guard)
  cat > "$TMPDIR/test-leading-html.mdx" << 'EOF'
  ---
  title: "Leading HTML Test"
  ---

  <a href="/x"><span class="badge">YENI</span></a>

  First paragraph text continues here.
  EOF

  # Test file 2: .md file (was skipped by the .mdx-only filter)
  cat > "$TMPDIR/test-md-file.md" << 'EOF'
  ---
  title: "MD File Test"
  ---

  Plain text paragraph with **bold** and [a link](https://example.com).
  EOF

  # Test file 3: .mdx with inline HTML (tests inline stripping)
  cat > "$TMPDIR/test-inline-html.mdx" << 'EOF'
  ---
  title: "Inline HTML Test"
  ---

  Yeni nesil <span class="badge">ÖNE ÇIKAN</span> ürün grubu ile tanışın.
  EOF
  ```
- [ ] Run the script: `python3 add_meta_descriptions.py "$TMPDIR"`
- [ ] **Verify test-leading-html.mdx:** Check its frontmatter `description` field contains `YENI` and contains NO `<` or `>` characters
- [ ] **Verify test-md-file.md:** Check its frontmatter `description` field exists and does not contain raw Markdown link syntax
- [ ] **Verify test-inline-html.mdx:** Check its frontmatter `description` field contains `ÖNE ÇIKAN` and contains NO `<` or `>` characters
- [ ] Clean up: `rm -rf "$TMPDIR"`
- [ ] Fix all failures found during verification
- [ ] **Syntax check:** `python3 -m py_compile add_meta_descriptions.py` must pass

### Step 5: Documentation & Delivery

- [ ] Update the script's module-level docstring or header comment to document CLI usage: `python3 add_meta_descriptions.py <root_directory>`
- [ ] Save documentation deliverables via `fn_task_document_write` (key="docs", content="Fixed add_meta_descriptions.py: (1) root_dir is now a required CLI argument instead of a hardcoded path, (2) file scan extended to include both `.mdx` and `.md` files, (3) the `not line.startswith('<')` guard in `get_description_from_content()` was removed and HTML tags are now stripped character-level with `re.sub(r'<[^>]+>', '', clean_line)`. Usage: `python3 add_meta_descriptions.py <root_directory>`.")
- [ ] Out-of-scope findings created as new tasks via `fn_task_create` tool

## Documentation Requirements

**Must Update:**
- `add_meta_descriptions.py` — header comment / usage message must document the CLI argument

**Check If Affected:**
- `scripts/daily-docs-enrichment.sh` — does not currently call `add_meta_descriptions.py`, so no change needed
- `README.md` — if it references the script (it currently does not), update the usage example

## Completion Criteria

- [ ] `root_dir` is accepted as a required CLI argument — `python3 add_meta_descriptions.py <path>` (no hardcoded paths)
- [ ] Invalid paths and missing arguments produce a clear error message and exit code 1
- [ ] Script processes both `.mdx` and `.md` file extensions
- [ ] The `not line.startswith('<')` guard is removed from `get_description_from_content()`
- [ ] `get_description_from_content()` strips HTML tags at the character level — no `<` or `>` in output descriptions
- [ ] All existing functionality preserved: frontmatter detection, description insertion, default fallback descriptions, files with existing descriptions are skipped
- [ ] `python3 -m py_compile add_meta_descriptions.py` passes
- [ ] Documentation saved via `fn_task_document_write`

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step 1 completion:** `feat(FN-009): accept root_dir as CLI argument instead of hardcoded path`
- **Step 2 completion:** `feat(FN-009): extend file scanning to include .md files alongside .mdx`
- **Step 3 completion:** `feat(FN-009): remove '<' line guard and add HTML tag stripping in description extraction`
- **Bug fixes:** `fix(FN-009): description`

## Do NOT

- Add external Python dependencies (stdlib only: `os`, `re`, `sys`)
- Rename, move, or delete the script
- Change how descriptions are generated beyond the changes explicitly listed (no changes to fallback text format, frontmatter insertion logic, or character limits)
- Modify the `add_meta_description()` function's return type or signature (`bool`)
- Change any file outside `add_meta_descriptions.py`
- Add a test framework or install any testing tools
- Remove features from the script — it should remain a standalone Python 3 script
- Commit without the task ID prefix

## Changeset Requirements

No changeset required — this task fixes bugs in an existing script; it does not remove functionality.
