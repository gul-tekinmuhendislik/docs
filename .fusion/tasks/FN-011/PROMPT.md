# Task: FN-011 — Fix favicon mismatch between docs.json reference and actual disk file

**Created:** 2026-05-26
**Size:** S

## Review Level: 1 (Plan Only)

**Assessment:** Small, reversible asset creation task. Blast radius is one new file + zero config changes. No tests or build steps exist in this project; validation is manual via XML parsing. The task is straightforward — create a missing SVG favicon to match an existing docs.json reference.
**Score:** 2/8 — Blast radius: 1, Pattern novelty: 0, Security: 0, Reversibility: 1

## Mission

`docs.json` (Mintlify config) declares `"favicon": "/favicon.svg"`, but no `favicon.svg` file exists on disk — only a legacy `favicon.ico` binary file. Create a proper `favicon.svg` using the existing brand "G" letter mark vector path from `logo/dark.svg`, so the favicon renders correctly in browser tabs and bookmarks. **Do NOT** change the docs.json path to `/favicon.ico` — the SVG approach is the intended modern format for Mintlify sites and matches the existing config. Keep `favicon.ico` untouched as a legacy fallback.

## Frontend UX Criteria

- [ ] **Design tokens only** — no hardcoded `px` values except `0`, no hardcoded hex/rgb colors; use CSS custom properties (`--color-*`, `--spacing-*`, etc.)
- [ ] **Icon sizing** — match the surrounding component's icon size convention (default lucide size unless the local pattern already uses an explicit `size={N}`)
- [ ] **Semantic color tokens for status** — use `--color-error` for stderr/error states, `--color-warning` for starting/pending states; never hardcode status colors
- [ ] **Component reuse** — reach for existing classes (`.btn`, `.btn-icon`, `.card`, `.input`) before writing one-off styles
- [ ] **Responsive scaffolding** — add `@media (max-width: 768px)` overrides for any new layout; verify mobile usability
- [ ] **Single canonical nav destination** — each route must appear in exactly one of: Header primary nav, Header overflow menu, or MobileNavBar More; no duplicates across all three
- [ ] **Status-indicator dot convention** — use the existing `.status-dot` pattern (size, border, animation) rather than custom dot styling
- [ ] **Visual hierarchy preserved** — new elements must not disrupt heading levels, content flow, or information architecture established in the surrounding page

## Dependencies

- **None**

## Context to Read First

- `docs.json` — see `"favicon": "/favicon.svg"` on line 3 (this reference is correct; the target file just doesn't exist)
- `logo/dark.svg` — contains the brand "G" letter mark as a `<path>` element with `d="M24 4C10.745 4..."`. Full viewBox is `0 0 448 48` but the G letter occupies roughly x:0–44, y:4–52.
- `logo/light.svg` — same G letter path, different fill color (`#003F7F`). Use as reference.
- `favicon.ico` — exists at project root, binary ICO format. **Do NOT delete or modify.**

## File Scope

- `favicon.svg` (create)
- `docs.json` (read-only verification — no changes needed)
- `logo/dark.svg` (read-only — source for the G path)

## Steps

### Step 0: Preflight

- [ ] `favicon.ico` exists at project root (confirmed by the `fn_task_get` output — it's a real binary ICO file)
- [ ] `logo/dark.svg` and `logo/light.svg` exist with the G letter mark path
- [ ] `docs.json` line 3 reads `"favicon": "/favicon.svg"` — the config is correct, no change needed
- [ ] No `favicon.svg` exists yet (confirm via `ls favicon.svg 2>/dev/null || echo "not found"`)

### Step 1: Create SVG favicon from brand G letter mark

- [ ] Extract the G letter mark `<path>` from `logo/dark.svg` — it's the element with `d="M24 4C10.745 4 0 14.745 0 28C0 41.255 10.745 52 24 52C32.5 52 39.8 47.5 44 40.5V32H28V40H36C34 43.5 29.5 44 24 44C15.163 44 8 36.837 8 28C8 19.163 15.163 12 24 12C28.5 12 32.5 13.5 35.5 16L40.5 11C36 6.5 30.5 4 24 4Z"`
- [ ] Create `favicon.svg` at project root with the following exact content:

```svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 4 48 48" width="48" height="48">
  <path d="M24 4C10.745 4 0 14.745 0 28C0 41.255 10.745 52 24 52C32.5 52 39.8 47.5 44 40.5V32H28V40H36C34 43.5 29.5 44 24 44C15.163 44 8 36.837 8 28C8 19.163 15.163 12 24 12C28.5 12 32.5 13.5 35.5 16L40.5 11C36 6.5 30.5 4 24 4Z" fill="#60A5FA"/>
</svg>
```

  - **viewBox rationale:** The G letter path spans x:0→44, y:4→52. `viewBox="0 4 48 48"` creates a tight 48×48 square cropped to the letter, with ~4px padding on the right.
  - **Fill color:** `#60A5FA` (the brand blue from `logo/dark.svg`).
  - **No text or extra elements** — just the G letter mark, matching the existing brand identity.
- [ ] Validate the SVG file is well-formed XML (use `python3 -c "import xml.etree.ElementTree as ET; ET.parse('favicon.svg'); print('Valid SVG')"`)

**Artifacts:**
- `favicon.svg` (new)

### Step 2: Verify docs.json and entire project

- [ ] Confirm `docs.json` `"favicon"` key still points to `"/favicon.svg"` — no change needed, just verify
- [ ] Grep the entire project for any other stale references to `favicon` paths that might conflict (e.g., check for hardcoded `/favicon.ico` in any HTML or config): `grep -rn "favicon" --include="*.json" --include="*.mdx" --include="*.md" --include="*.html" --include="*.css" .`
- [ ] Verify JSON validity: `python3 -c "import json; json.load(open('docs.json')); print('Valid JSON')"`

### Step 3: Testing & Verification

> This project has no automated test framework. Manual validation is the quality gate.

- [ ] `favicon.svg` exists and is a valid SVG (passes `xml.etree.ElementTree.parse()`)
- [ ] `docs.json` is valid JSON (passes `json.load()`)
- [ ] `favicon.ico` is still present and unmodified
- [ ] The SVG contains exactly one `<svg>` element and one `<path>` element — no text, no extra elements
- [ ] The viewBox is `"0 4 48 48"` — not `"0 0 48 48"` (which would clip the letter)
- [ ] The fill color is `#60A5FA` (the brand blue)

### Step 4: Documentation & Delivery

- [ ] Save a structured summary of the fix as a task document via `fn_task_document_write(key="docs", content="...")` describing:
  - What was wrong: docs.json referenced `/favicon.svg` but no such file existed
  - What was done: Created `favicon.svg` from the brand G letter mark vector path
  - Why this approach: SVG favicons scale crisply at any resolution; docs.json already pointed to SVG
  - Legacy file status: `favicon.ico` preserved as-is

## Documentation Requirements

**Must Update:**
- No existing documentation needs updating — this is a pure asset creation task

**Check If Affected:**
- `docs.json` — read-only verification (no changes expected)
- `README.md` — favicon not mentioned; no update needed

## Completion Criteria

- [ ] `favicon.svg` exists at project root with valid SVG XML and correct viewBox
- [ ] `docs.json` `"favicon"` key still references `"/favicon.svg"` (unchanged)
- [ ] `docs.json` is valid JSON
- [ ] `favicon.ico` is preserved (not deleted or modified)
- [ ] No other favicon-related stale references exist in the project
- [ ] Documentation delivered via `fn_task_document_write`

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-011): complete Step N — description`
- **Bug fixes:** `fix(FN-011): description`

## Do NOT

- Delete or modify `favicon.ico` — it remains as a legacy fallback
- Change `docs.json` — the `"favicon": "/favicon.svg"` reference is already correct
- Modify any navigation, content, configuration, or CSS in the project
- Add any text, labels, or additional elements to the SVG favicon beyond the single G letter mark path
- Use `viewBox="0 0 48 48"` — this would clip the bottom of the G letter (the path goes to y=52)
- Change the favicon path to `/favicon.ico` — the SVG format is the intended modern approach
- Refuse or skip the fix because the project has no test framework — manual XML/JSON validation is sufficient
- Remove, delete, or gut any modules, settings, interfaces, exports, or test files outside the File Scope

## Changeset Requirements

No changeset needed — this task ADDS a new asset file (`favicon.svg`) and does not remove any existing functionality.
