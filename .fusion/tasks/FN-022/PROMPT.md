# Task: FN-022 — KISA MARKALAR - Icerik Zenginlestirme (8 Brand Pages)

**Created:** 2026-05-26
**Size:** M

## Review Level: 1 (Plan Only)

**Assessment:** Coordination and quality verification task for 8 brand page enrichments already split into FN-025 (Group A: aqualine, nobo, radyal, rain-bird) and FN-026 (Group B: sanihydro, sukar, tekneciler, vitra). This task waits for both subtasks to complete, then runs cross-cutting verification (byte counts, title fixes, image comments, MDX validity, documentation). Blast radius is read-only for all 8 files. Pattern novelty is zero — pure verification. Low risk.
**Score:** 1/8 — Blast radius: 0, Pattern novelty: 0, Security: 0, Reversibility: 1

## Mission

This task is the parent coordination task for enriching 8 "short" brand pages in `markalar/` (each currently ~870–1020 bytes, needs ≥2000 bytes). The actual content creation work is delegated to two implementation subtasks:

- **FN-025** — enriches aqualine.mdx, nobo.mdx, radyal.mdx, rain-bird.mdx (Group A)
- **FN-026** — enriches sanihydro.mdx, sukar.mdx, tekneciler.mdx, vitra.mdx (Group B)

Once both subtasks are complete, this task runs a final cross-cutting verification: validates that all 8 pages meet the ≥2000 byte requirement, the Radyal title fix was applied correctly, all CardGroups are valid MDX with correct hrefs, and image placement research HTML comments exist on each page. Finally, it saves a structured documentation summary consumable by **FN-016** (quality control for all 47 brand pages).

## Dependencies

- **Task:** FN-025 (KISA MARKALAR - Grup A: aqualine, nobo, radyal, rain-bird — must be complete before verification starts)
- **Task:** FN-026 (KISA MARKALAR - Grup B: sanihydro, sukar, tekneciler, vitra — must be complete before verification starts)

## Context to Read First

- `markalar/grundfos.mdx` — reference for well-developed brand page structure (header image, external link-cards, model tables)
- `markalar/baymak.mdx` — reference for detailed brand page with Ürün Grupları, Teknolojik Özellikler, Sertifikalar sections
- `hizmetlerimiz/su-aritma-sistemleri.mdx` — reference for `<CardGroup>` / `<Card>` syntax
- `custom.css` — existing CSS classes used on the site

## File Scope

All files in scope are read-only verification targets (no modifications expected unless fixes are needed):

- `markalar/aqualine.mdx` (verify — read only)
- `markalar/nobo.mdx` (verify — read only)
- `markalar/radyal.mdx` (verify — read only, CRITICAL: verify title fix)
- `markalar/rain-bird.mdx` (verify — read only)
- `markalar/sanihydro.mdx` (verify — read only)
- `markalar/sukar.mdx` (verify — read only)
- `markalar/tekneciler.mdx` (verify — read only)
- `markalar/vitra.mdx` (verify — read only)

## Steps

### Step 0: Preflight — Confirm Subtask Completion

- [ ] Verify FN-025 is in "done" or "archived" column via `fn_task_get(FN-025)`
- [ ] Verify FN-026 is in "done" or "archived" column via `fn_task_get(FN-026)`
- [ ] If either subtask is not yet complete, STOP and wait — do not proceed (this task has nothing to verify until the implementations land)
- [ ] Read the documentation outputs from both subtasks using `fn_task_document_read(key="docs")` to understand what was done
- [ ] Verify all 8 target `.mdx` files exist under `markalar/`

### Step 1: Cross-Cutting Verification — Byte Count

- [ ] Run `wc -c markalar/aqualine.mdx markalar/nobo.mdx markalar/radyal.mdx markalar/rain-bird.mdx markalar/sanihydro.mdx markalar/sukar.mdx markalar/tekneciler.mdx markalar/vitra.mdx`
- [ ] Confirm ALL 8 files are ≥ 2000 bytes. Record exact byte counts for the documentation.

**Acceptable exception:** If a file is between 1900-1999 bytes due to image placement comments taking less space, it may pass with a note. If any file is below 1900 bytes, create a refinement task on the responsible subtask (FN-025 or FN-026) requesting the shortfall be fixed.

### Step 2: Cross-Cutting Verification — Radyal Title Fix (CRITICAL)

- [ ] Read `markalar/radyal.mdx` frontmatter and H1 heading
- [ ] Verify frontmatter `title:` no longer contains "Vanalar" or "Pompa" — it must reflect aluminum radiators and towel warmers (e.g., "Radyal Alüminyum Radyatör ve Havlupan Sistemleri")
- [ ] Verify `# Radyal ...` H1 heading matches the corrected title (no "Vanalar" or "Pompa" in the heading)
- [ ] If the title was NOT fixed, file a refinement task on FN-025 requesting the fix with exact instructions:
  - `title:` should be `"Radyal Alüminyum Radyatör ve Havlupan Sistemleri"`
  - `#` heading should be `# Radyal Alüminyum Radyatör ve Havlupan Sistemleri`

### Step 3: Cross-Cutting Verification — Content Structure

For each of the 8 files, verify the following sections exist:

- **Hakkında** — a section (either `## Hakkında` or equivalent) containing:
  - Kuruluş yılı or brand establishment context
  - Merkez (headquarters location)
  - Sektör pozisyonu (market position statement)
- **Ürün Grupları** — detailed product listing (bulleted list or sub-headings with min 1-2 description sentences per group)
- **Gül-tekin Mühendislik ile İlişkimiz** — paragraph explaining relationship
- **Bodrum'da {Brand} Uygulamaları** — local Bodrum application examples with specific locations
- **İlgili Hizmetlerimiz** — `<CardGroup>` with `<Card>` components linking to service pages
- **HTML Comment for image placement** — a `<!-- GÖRSEL ÖNERİSİ: ... -->` comment documenting image placement opportunity

- [ ] For each of the 8 files, read and verify all 6 content sections listed above
- [ ] If any file is missing one or more required sections, create a refinement task on the responsible subtask (FN-025 or FN-026)

**Brand-specific section requirements to verify:**

| Brand | Submitter | Special requirements |
|---|---|---|
| aqualine | FN-025 | Pollet Water Group, ters osmoz |
| nobo | FN-025 | Norveç menşeli, elektrikli konvektör |
| radyal | FN-025 | CRITICAL: no "vana/pompa" reference in title. Alüminyum radyatör ve havlupan focus |
| rain-bird | FN-025 | 1933 kuruluş, sulama lideri, "The Intelligent Use of Water™" |
| sanihydro | FN-026 | SFA Group, atık su pompaları, WC grinder |
| sukar | FN-026 | 1998 kuruluş, Kokumatik patent, title should NOT say "Su Depoları ve Tanklar" |
| tekneciler | FN-026 | 1993 kuruluş, 30+ ülke ihracat, yerden ısıtma |
| vitra | FN-026 | Eczacıbaşı, banyo seramik, vitrifiye |

### Step 4: Cross-Cutting Verification — MDX Syntax & Links

- [ ] For each of the 8 files, verify proper MDX syntax:
  - Frontmatter YAML is properly wrapped in `---` delimiters
  - No unclosed HTML tags (especially `<CardGroup>`, `<Card>`)
  - All `<CardGroup>` has a matching `</CardGroup>` closing tag
  - All `<Card>` tags are self-closing (`<Card ... />` or `<Card ...></Card>`) — no unclosed Card tags
- [ ] Extract all `href` values from Card components and verify the target files exist on disk:

**Expected service page paths per brand (verify each exists):**

| Brand | Service pages to link to |
|---|---|
| aqualine | `hizmetlerimiz/su-aritma-sistemleri.mdx`, `hizmetlerimiz/pompalar.mdx`, `hizmetlerimiz/hidrofor-sistemleri.mdx` |
| nobo | `hizmetlerimiz/akilli-oda-termostatlari.mdx`, `hizmetlerimiz/isi-pompalari.mdx` |
| radyal | `hizmetlerimiz/radyator.mdx`, `hizmetlerimiz/yerden-isitma-sistemleri.mdx`, `hizmetlerimiz/mekanik-sihhi-tesisat.mdx` |
| rain-bird | `hizmetlerimiz/sulama-sistemleri.mdx`, `hizmetlerimiz/pompalar.mdx`, `hizmetlerimiz/hidrofor-sistemleri.mdx` |
| sanihydro | `hizmetlerimiz/tahliye-istasyonu.mdx`, `hizmetlerimiz/pompalar.mdx`, `hizmetlerimiz/mekanik-sihhi-tesisat.mdx` |
| sukar | `hizmetlerimiz/mekanik-sihhi-tesisat.mdx`, `hizmetlerimiz/su-depolari.mdx`, `hizmetlerimiz/tahliye-istasyonu.mdx` |
| tekneciler | `hizmetlerimiz/yerden-isitma-sistemleri.mdx`, `hizmetlerimiz/radyator.mdx`, `hizmetlerimiz/mekanik-sihhi-tesisat.mdx` |
| vitra | `hizmetlerimiz/mekanik-sihhi-tesisat.mdx`, `hizmetlerimiz/pompalar.mdx` |

- [ ] If any href points to a non-existent file, create a refinement task on the responsible subtask
- [ ] Verify no Card uses an `icon` attribute (unless the project icon set supports it — check by reading first)

### Step 5: Documentation & Delivery

- [ ] Save the structured documentation summary via `fn_task_document_write`:

**Document structure (key="docs"):**

```markdown
# FN-022 — KISA MARKALAR Enrichment Summary

## Subtasks
- FN-025: {status} — aqualine, nobo, radyal, rain-bird
- FN-026: {status} — sanihydro, sukar, tekneciler, vitra

## Byte Count Verification

| Brand | File | Size (bytes) | ≥2000? |
|---|---|---|---|
| Aqualine | markalar/aqualine.mdx | {size} | {pass/fail} |
| Nobo | markalar/nobo.mdx | {size} | {pass/fail} |
| Radyal | markalar/radyal.mdx | {size} | {pass/fail} |
| Rain Bird | markalar/rain-bird.mdx | {size} | {pass/fail} |
| Sanihydro | markalar/sanihydro.mdx | {size} | {pass/fail} |
| Sukar | markalar/sukar.mdx | {size} | {pass/fail} |
| Tekneciler | markalar/tekneciler.mdx | {size} | {pass/fail} |
| VitrA | markalar/vitra.mdx | {size} | {pass/fail} |

## Radyal Title Fix
- [ ] Title corrected from "Radyal Vanalar ve Pompa Sistemleri" → "{actual corrected title}"

## Content Structure Verification

| Brand | Hakkında | Ürün Grupları | Gül-tekin İlişkisi | Bodrum Uyg. | İlgili Hizmetler | Görsel Yorumu |
|---|---|---|---|---|---|---|
| aqualine | pass/fail | pass/fail | pass/fail | pass/fail | pass/fail | pass/fail |
| ... | ... | ... | ... | ... | ... | ... |

## MDX Syntax Verification
- [ ] All 8 files have valid MDX frontmatter
- [ ] All CardGroup/Card tags properly closed
- [ ] All href targets exist on disk

## Issues Found
{list any issues requiring refinement tasks}
```

- [ ] If any verification step found issues requiring fixes by the subtask implementers, create refinement tasks via `fn_task_refine(FN-025, "description of issue")` and/or `fn_task_refine(FN-026, "description of issue")`

## Documentation Requirements

**Must Update:**
- None — this task produces its output via `fn_task_document_write` only

**Check If Affected:**
- `markalar.mdx` — ensure the index page still lists all 8 brand slugs (no accidental removal by subtasks)

## Completion Criteria

- [ ] Both FN-025 and FN-026 are complete
- [ ] All 8 brand pages verified ≥ 2000 bytes
- [ ] Radyal title fix verified correct (no "Vanalar/Pompa" in frontmatter or H1)
- [ ] All 6 required content sections present on every page
- [ ] All `<CardGroup>` / `<Card>` tags properly closed with valid MDX
- [ ] All Card href values point to existing service pages
- [ ] All pages have image placement research HTML comments
- [ ] Documentation summary saved via `fn_task_document_write`

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-022): complete Step N — description`
- **Bug fixes:** `fix(FN-022): description`
- **Refinement task creation:** `chore(FN-022): file refinement tasks for {subtaks-id} — {issue}`

## Do NOT

- Modify any of the 8 brand `.mdx` files directly during this coordination task — verification only
- If issues are found, create refinement tasks on the responsible subtasks rather than fixing directly
- Proceed before FN-025 and FN-026 are complete
- Skip any of the 8 pages in verification
- Remove, delete, or gut modules, settings, interfaces, exports, or test files outside the File Scope
- Commit without the task ID prefix

## Changeset Requirements

No changeset needed — this task performs verification and documentation only, no code or content changes.
