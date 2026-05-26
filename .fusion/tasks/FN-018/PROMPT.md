# Task: FN-018 — Brand Pages — Convert existing Hizmetler sections to CardGroup

**Created:** 2026-05-26
**Size:** S

## Review Level: 0 (None)

**Assessment:** Pure mechanical markup conversion with a single well-established pattern across 9 brand pages. No new functionality, no data changes, no risk outside the replaced bullet-point lists. Blast radius is limited to the 9 specific `.mdx` files with no downstream dependencies.
**Score:** 1/8 — Blast radius: 0, Pattern novelty: 0, Security: 0, Reversibility: 1

## Mission

Replace the `## Hizmetler` bullet-point link lists in 9 brand pages under `markalar/` with Mintlify `<CardGroup>` / `<Card>` components, following the pattern established in `hizmetlerimiz/su-aritma-sistemleri.mdx`. Each page currently has a flat markdown bullet list of links to service pages under a `## Hizmetler` heading. Replace each list with a `<CardGroup>` containing self-closing `<Card>` tags (no icon attribute — these are service cards, not brand cards). Do NOT modify any `## 🌟 [emoji]` external-promotion sections (e.g. `## 🌟 Isı Pompası Hizmetlerimiz`, `## 🌟 Bodrum Hidrofor Hizmetlerimiz`, `## 🌟 Su Deposu Hizmetlerimiz`, `## 🌟 Güneş Enerjisi Hizmetlerimiz`) — those link to external websites and must remain untouched.

## Dependencies

- **None**

## Context to Read First

1. `hizmetlerimiz/su-aritma-sistemleri.mdx` — reference implementation showing the `<CardGroup>` / `<Card>` pattern (lines 6-12). Note: that file uses brand cards WITH icons. For this task, service cards on brand pages should omit the `icon` attribute.
2. All 9 target files (read each to confirm current state before editing — file states may differ from the task description):
   - `markalar/alarko.mdx`
   - `markalar/aldea.mdx`
   - `markalar/aqualine.mdx`
   - `markalar/astral.mdx`
   - `markalar/atlantis.mdx`
   - `markalar/atlas.mdx`
   - `markalar/baymak.mdx`
   - `markalar/beser.mdx`
   - `markalar/caleffi.mdx`

## File Scope

- `markalar/alarko.mdx`
- `markalar/aldea.mdx`
- `markalar/aqualine.mdx`
- `markalar/astral.mdx`
- `markalar/atlantis.mdx`
- `markalar/atlas.mdx`
- `markalar/baymak.mdx`
- `markalar/beser.mdx`
- `markalar/caleffi.mdx`

## Steps

### Step 0: Preflight

- [ ] Verify all 9 target `.mdx` files exist under `markalar/`
- [ ] Verify the reference file `hizmetlerimiz/su-aritma-sistemleri.mdx` exists
- [ ] Read each target file to confirm current `## Hizmetler` section content before editing — do not rely solely on this spec (file states may have changed)

### Step 1: alarko.mdx — Convert Hizmetler section

Current `## Hizmetler` bullet list (3 links):

```
## Hizmetler

- [Tahliye İstasyonu](/hizmetlerimiz/tahliye-istasyonu)
- [Hidrofor Sistemleri](/hizmetlerimiz/hidrofor-sistemleri)
- [Isı Pompaları](/hizmetlerimiz/isi-pompalari)
```

Replace with:

```
## Hizmetler

<CardGroup>
  <Card title="Tahliye İstasyonu" href="/hizmetlerimiz/tahliye-istasyonu"></Card>
  <Card title="Hidrofor Sistemleri" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
</CardGroup>
```

**Context:** alarko.mdx has a `## 🌟 Isı Pompası Hizmetlerimiz` section BEFORE `## Hizmetler` and a `## 🌟 Bodrum Hidrofor Hizmetlerimiz` section AFTER it. Do NOT touch either of these external-link sections.

- [ ] Replace the bullet-point list under `## Hizmetler` with a CardGroup containing 3 Card components
- [ ] Verify the preceding `## 🌟 Isı Pompası Hizmetlerimiz` section is untouched
- [ ] Verify the following `## 🌟 Bodrum Hidrofor Hizmetlerimiz` section is untouched

### Step 2: aldea.mdx — Convert Hizmetler section

Current `## Hizmetler` bullet list (2 links):

```
## Hizmetler

- [Isı Pompaları](/hizmetlerimiz/isi-pompalari)
- [Termosifonik Sistemler](/hizmetlerimiz/termosifonik-sistemler)
```

Replace with:

```
## Hizmetler

<CardGroup>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Termosifonik Sistemler" href="/hizmetlerimiz/termosifonik-sistemler"></Card>
</CardGroup>
```

**Context:** aldea.mdx has a `## 🌟 Isı Pompası Hizmetlerimiz` section BEFORE `## Hizmetler`. Do NOT touch it.

- [ ] Replace the bullet-point list under `## Hizmetler` with a CardGroup containing 2 Card components
- [ ] Verify the `## 🌟 Isı Pompası Hizmetlerimiz` section is untouched

### Step 3: aqualine.mdx — Convert Hizmetler section

Current `## Hizmetler` bullet list (1 link):

```
## Hizmetler

- [Su Arıtma Sistemleri](/hizmetlerimiz/su-aritma-sistemleri)
```

Replace with:

```
## Hizmetler

<CardGroup>
  <Card title="Su Arıtma Sistemleri" href="/hizmetlerimiz/su-aritma-sistemleri"></Card>
</CardGroup>
```

**Context:** aqualine.mdx has no external `## 🌟` sections. Simple conversion.

- [ ] Replace the single bullet-point under `## Hizmetler` with a CardGroup containing 1 Card component

### Step 4: astral.mdx — Convert Hizmetler section

Current `## Hizmetler` bullet list (3 links):

```
## Hizmetler

- [Isı Pompaları](/hizmetlerimiz/isi-pompalari)
- [Pompalar](/hizmetlerimiz/pompalar)
- [Sulama Sistemleri](/hizmetlerimiz/sulama-sistemleri)
```

Replace with:

```
## Hizmetler

<CardGroup>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
  <Card title="Sulama Sistemleri" href="/hizmetlerimiz/sulama-sistemleri"></Card>
</CardGroup>
```

**Context:** astral.mdx has a `## 🌟 Isı Pompası Hizmetlerimiz` section BEFORE `## Hizmetler`. Do NOT touch it.

- [ ] Replace the bullet-point list under `## Hizmetler` with a CardGroup containing 3 Card components
- [ ] Verify the `## 🌟 Isı Pompası Hizmetlerimiz` section is untouched

### Step 5: atlantis.mdx — Convert Hizmetler section

Current `## Hizmetler` bullet list (4 links):

```
## Hizmetler

- [Tahliye İstasyonu](/hizmetlerimiz/tahliye-istasyonu)
- [Hidrofor Sistemleri](/hizmetlerimiz/hidrofor-sistemleri)
- [Pompalar](/hizmetlerimiz/pompalar)
- [Su Arıtma Sistemleri](/hizmetlerimiz/su-aritma-sistemleri)
```

Replace with:

```
## Hizmetler

<CardGroup>
  <Card title="Tahliye İstasyonu" href="/hizmetlerimiz/tahliye-istasyonu"></Card>
  <Card title="Hidrofor Sistemleri" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
  <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
  <Card title="Su Arıtma Sistemleri" href="/hizmetlerimiz/su-aritma-sistemleri"></Card>
</CardGroup>
```

**Context:** atlantis.mdx has a `## Atlantis Hidrofor Modelleri` section (with extensive content) AFTER `## Hizmetler`, followed by a `## 🌟 Bodrum Hidrofor Hizmetlerimiz` section. Do NOT touch the product details or the external-link section.

- [ ] Replace the bullet-point list under `## Hizmetler` with a CardGroup containing 4 Card components
- [ ] Verify the `## Atlantis Hidrofor Modelleri` content section is untouched
- [ ] Verify the `## 🌟 Bodrum Hidrofor Hizmetlerimiz` section is untouched

### Step 6: atlas.mdx — Convert Hizmetler section

Current `## Hizmetler` bullet list (4 links):

```
## Hizmetler

- [Tahliye İstasyonu](/hizmetlerimiz/tahliye-istasyonu)
- [Hidrofor Sistemleri](/hizmetlerimiz/hidrofor-sistemleri)
- [Pompalar](/hizmetlerimiz/pompalar)
- [Su Arıtma Sistemleri](/hizmetlerimiz/su-aritma-sistemleri)
```

Replace with:

```
## Hizmetler

<CardGroup>
  <Card title="Tahliye İstasyonu" href="/hizmetlerimiz/tahliye-istasyonu"></Card>
  <Card title="Hidrofor Sistemleri" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
  <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
  <Card title="Su Arıtma Sistemleri" href="/hizmetlerimiz/su-aritma-sistemleri"></Card>
</CardGroup>
```

**Context:** atlas.mdx has a `## 🌟 Bodrum Hidrofor Hizmetlerimiz` section AFTER `## Hizmetler`. Do NOT touch it.

- [ ] Replace the bullet-point list under `## Hizmetler` with a CardGroup containing 4 Card components
- [ ] Verify the `## 🌟 Bodrum Hidrofor Hizmetlerimiz` section is untouched

### Step 7: baymak.mdx — Convert Hizmetler section

Current `## Hizmetler` bullet list (5 links):

```
## Hizmetler

- [Tahliye İstasyonu](/hizmetlerimiz/tahliye-istasyonu)
- [Hidrofor Sistemleri](/hizmetlerimiz/hidrofor-sistemleri)
- [Isı Pompaları](/hizmetlerimiz/isi-pompalari)
- [Pompalar](/hizmetlerimiz/pompalar)
- [Termosifonik Sistemler](/hizmetlerimiz/termosifonik-sistemler)
```

Replace with:

```
## Hizmetler

<CardGroup>
  <Card title="Tahliye İstasyonu" href="/hizmetlerimiz/tahliye-istasyonu"></Card>
  <Card title="Hidrofor Sistemleri" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
  <Card title="Termosifonik Sistemler" href="/hizmetlerimiz/termosifonik-sistemler"></Card>
</CardGroup>
```

**Context:** baymak.mdx has extensive content between `## Hizmetler` and the external sections: `## Ürün Grupları` → `### Isı Pompaları` → ... → `### Hidrofor Sistemleri` → ... → `## Sertifikalar` → `## 🌟 Isı Pompası Hizmetlerimiz` → `## 🌟 Bodrum Hidrofor Hizmetlerimiz`. Also has a `## Hakkında` section BEFORE `## Hizmetler`. Do NOT touch any of these.

- [ ] Replace the bullet-point list under `## Hizmetler` with a CardGroup containing 5 Card components
- [ ] Verify all content between `## Hizmetler` and the external sections is untouched
- [ ] Verify the `## Hakkında` section is untouched
- [ ] Verify the `## 🌟 Isı Pompası Hizmetlerimiz` and `## 🌟 Bodrum Hidrofor Hizmetlerimiz` sections are untouched

### Step 8: beser.mdx — Convert Hizmetler section

Current `## Hizmetler` bullet list (1 link):

```
## Hizmetler

- [Su Depoları](/hizmetlerimiz/su-depolari)
```

Replace with:

```
## Hizmetler

<CardGroup>
  <Card title="Su Depoları" href="/hizmetlerimiz/su-depolari"></Card>
</CardGroup>
```

**Context:** beser.mdx has a `## 🌟 Su Deposu Hizmetlerimiz` section BEFORE `## Hizmetler`. Do NOT touch it.

- [ ] Replace the single bullet-point under `## Hizmetler` with a CardGroup containing 1 Card component
- [ ] Verify the `## 🌟 Su Deposu Hizmetlerimiz` section is untouched

### Step 9: caleffi.mdx — Convert Hizmetler section

Current `## Hizmetler` bullet list (4 links):

```
## Hizmetler

- [Akıllı Oda Termostatları](/hizmetlerimiz/akilli-oda-termostatlari)
- [Güneş Enerjisi Sistemleri](/hizmetlerimiz/gunes-enerjisi)
- [Mekanik Sıhhi Tesisat](/hizmetlerimiz/mekanik-sihhi-tesisat)
- [Yerden Isıtma Sistemleri](/hizmetlerimiz/yerden-isitma-sistemleri)
```

Replace with:

```
## Hizmetler

<CardGroup>
  <Card title="Akıllı Oda Termostatları" href="/hizmetlerimiz/akilli-oda-termostatlari"></Card>
  <Card title="Güneş Enerjisi Sistemleri" href="/hizmetlerimiz/gunes-enerjisi"></Card>
  <Card title="Mekanik Sıhhi Tesisat" href="/hizmetlerimiz/mekanik-sihhi-tesisat"></Card>
  <Card title="Yerden Isıtma Sistemleri" href="/hizmetlerimiz/yerden-isitma-sistemleri"></Card>
</CardGroup>
```

**Context:** caleffi.mdx has a `## 🌟 Güneş Enerjisi Hizmetlerimiz` section AFTER `## Hizmetler`. Also has a `<div class="service-header-image">` block at the top. Do NOT touch either.

- [ ] Replace the bullet-point list under `## Hizmetler` with a CardGroup containing 4 Card components
- [ ] Verify the `<div class="service-header-image">` block is untouched
- [ ] Verify the `## 🌟 Güneş Enerjisi Hizmetlerimiz` section is untouched

### Step 10: Testing & Verification

> This is a Mintlify documentation site with no test runner, package.json, or CI pipeline. Validation is done via manual file review.

- [ ] For each of the 9 modified files, verify:
  - No broken Markdown/MDX syntax (all `<CardGroup>` and `<Card>` tags properly opened and closed — `</CardGroup>` and `</Card>` tags present)
  - No leftover bullet-point link syntax (`- [Service Name](/hizmetlerimiz/...)`)
  - All Card `href` values point to valid service pages under `/hizmetlerimiz/` that exist on disk
  - The `## Hizmetler` heading is preserved
  - All `## 🌟 [emoji]` external-promotion sections are untouched and remain as anchor link cards
  - Any content between `## Hizmetler` and subsequent sections (especially in baymak.mdx and atlantis.mdx) is fully intact
- [ ] Run `npx mintlify dev` (if mintlify CLI is available) to verify the site builds without errors and visually confirm CardGroups render correctly
- [ ] Fix any issues found — if fixing requires edits outside the declared File Scope, make those fixes anyway

### Step 11: Documentation & Delivery

- [ ] Save a summary of changes as a task document: `fn_task_document_write(key="changes", content="...")` listing which files were modified and how many service Cards were created per file

**Artifacts:**
- None beyond the modified `.mdx` files

## Documentation Requirements

**Must Update:**
- This task produces no standalone documentation; the `.mdx` file changes are self-documenting

**Check If Affected:**
- `hizmetlerimiz/hizmetlerimiz.mdx` — unlikely, but verify the index page isn't affected by structural changes to brand pages

## Completion Criteria

- [ ] All 9 brand pages have their `## Hizmetler` bullet-point lists replaced with `<CardGroup>` / `<Card>` components
- [ ] All Card components are self-closing (`<Card title="..." href="..."></Card>`) with no `icon` attribute
- [ ] All original service links, display names, and ordering are preserved exactly
- [ ] All `## 🌟 [emoji]` external-promotion sections remain untouched
- [ ] All product detail content, headings, and descriptive sections remain unchanged
- [ ] No broken MDX syntax in any modified file
- [ ] Changes summary saved as task document

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-018): complete Step N — converted {page-name} Hizmetler to CardGroup`
- **Bug fixes:** `fix(FN-018): description`
- **Final:** `feat(FN-018): convert Hizmetler sections to CardGroup in 9 brand pages`

## Do NOT

- Add `icon` attributes to Card components — these are service cards on brand pages, not brand cards on service pages
- Modify any `## 🌟 [emoji]` external-promotion sections (e.g. `Isı Pompası Hizmetlerimiz`, `Bodrum Hidrofor Hizmetlerimiz`, `Su Deposu Hizmetlerimiz`, `Güneş Enerjisi Hizmetlerimiz`)
- Change product detail sections, headings, or descriptive content (especially in baymak.mdx's extensive `## Ürün Grupları` and atlantis.mdx's `## Atlantis Hidrofor Modelleri`)
- Reorder, add, or remove service links from the lists
- Modify files outside the declared File Scope
- Refuse to fix issues found during verification, even if the fix touches adjacent content

## Changeset Requirements

This task does NOT remove existing functionality — it only replaces markup. No changeset file is required.
