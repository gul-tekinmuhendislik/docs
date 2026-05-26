# Task: FN-012 — Add Mintlify Card/CardGroup components to service and brand pages

**Created:** 2026-05-26
**Size:** L

## Review Level: 2 (Plan and Code)

**Assessment:** Modifies ~23 content (.mdx) files across two directories with the same mechanical pattern (markdown brand/service lists → Mintlifiy CardGroup). High file count but each change is small, reversible, and follows an existing reference pattern from `su-aritma-sistemleri.mdx`. No security or logic risk.

**Score:** 4/8 — Blast radius: 2, Pattern novelty: 1, Security: 0, Reversibility: 1

## Mission

Currently only `hizmetlerimiz/su-aritma-sistemleri.mdx` uses Mintlify's native `<CardGroup>` and `<Card>` components to display brand listings. All other service pages use raw markdown bullet lists or custom `.brand-grid` HTML to list related brands, and nine brand pages use plain markdown links for their `## Hizmetler` sections. This task converts those listings to Mintlify Card components — delivering consistent navigation, better visual hierarchy, and native Mintlify rendering. Each conversion follows the exact same pattern already established in `su-aritma-sistemleri.mdx`. All existing links, content order, and page structure are preserved.

## Dependencies

- **Task:** FN-002 (Varmeks/Warmeks merge — may rename/merge files under `markalar/`; FN-012 must work with whatever file state results)
- **Task:** FN-003 (TSE navigation/index addition — already done, `markalar/tse.mdx` and docs.json may differ from baseline)
- **No hard ordering constraint** — this task reads and modifies different files than FN-002/003/005. If FN-002 and FN-005 are already done, the directory will have the correct file set. If not, the executor works with whatever files exist.

## Context to Read First

- `hizmetlerimiz/su-aritma-sistemleri.mdx` — the only existing CardGroup usage; read for formatting reference
- `custom.css` — confirms existing `.brand-grid` / `.brand-card` CSS selectors; the task will remove the `.brand-grid` div from `hidrofor-sistemleri.mdx` (but NOT delete the CSS)
- `docs.json` — navigation groupings show which brands associate with which services; useful for icon mapping

## File Scope

**Service pages (14 files — add/replace brand listings with CardGroup):**

- `hizmetlerimiz/isi-pompalari.mdx` (modified)
- `hizmetlerimiz/hidrofor-sistemleri.mdx` (modified)
- `hizmetlerimiz/gunes-enerjisi.mdx` (modified)
- `hizmetlerimiz/yerden-isitma-sistemleri.mdx` (modified)
- `hizmetlerimiz/su-depolari.mdx` (modified)
- `hizmetlerimiz/termosifonik-sistemler.mdx` (modified)
- `hizmetlerimiz/klima-sistemleri.mdx` (modified)
- `hizmetlerimiz/pompalar.mdx` (modified)
- `hizmetlerimiz/radyator.mdx` (modified)
- `hizmetlerimiz/sulama-sistemleri.mdx` (modified)
- `hizmetlerimiz/tahliye-istasyonu.mdx` (modified)
- `hizmetlerimiz/mekanik-sihhi-tesisat.mdx` (modified)
- `hizmetlerimiz/akilli-oda-termostatlari.mdx` (modified)
- `hizmetlerimiz/su-aritma-sistemleri.mdx` — **NOT modified** (already has CardGroup)

**Brand pages (9 files — convert `## Hizmetler` markdown lists to CardGroup):**

- `markalar/alarko.mdx` (modified)
- `markalar/aldea.mdx` (modified)
- `markalar/aqualine.mdx` (modified)
- `markalar/astral.mdx` (modified)
- `markalar/atlantis.mdx` (modified)
- `markalar/atlas.mdx` (modified)
- `markalar/baymak.mdx` (modified)
- `markalar/beser.mdx` (modified)
- `markalar/caleffi.mdx` (modified)

## Steps

### Step 0: Preflight

- [ ] All files listed in File Scope exist and are readable (read each to confirm)
- [ ] `hizmetlerimiz/su-aritma-sistemleri.mdx` exists and shows the CardGroup pattern
- [ ] Run `git status` to confirm no uncommitted changes that could cause merge conflicts
- [ ] Note current state of FN-002, FN-003, FN-005 in case they've modified any brand page listings

### Step 1: Convert service page brand listings to CardGroup

For each of the 14 service pages (excluding `su-aritma-sistemleri.mdx` which already has CardGroup), locate the section that lists related brands. Replace the existing brand listing with `<CardGroup>` containing `<Card>` components.

**Transformation rules:**

1. **Simple bullet lists** (most pages): Each `* [Brand](/markalar/brand)` becomes a `<Card>`. If there's a subsequent italic description line (`*description*`), include it as Card body text. Example:

   Before:
   ```
   * **[Alarko](/markalar/alarko)**
       * *Isıtma, soğutma ve havalandırma alanlarında bütünsel çözümler...*
   ```

   After:
   ```
   <Card title="Alarko" icon="building" href="/markalar/alarko">
     Isıtma, soğutma ve havalandırma alanlarında bütünsel çözümler...
   </Card>
   ```

2. **Custom `.brand-grid` HTML** (`hidrofor-sistemleri.mdx`): Replace the entire `<div class="brand-grid">...</div>` block with `<CardGroup>`, preserving all brand names, descriptions, and href values.

3. **Sectioned lists** (pages with `###` sub-headings like `klima-sistemleri.mdx`, `pompalar.mdx`, `mekanik-sihhi-tesisat.mdx`, `radyator.mdx`, `sulama-sistemleri.mdx`, `akilli-oda-termostatlari.mdx`): Keep each sub-heading as `###` above its own `<CardGroup>`. Group Card components under the sub-heading they belong to.

4. **Pages with complex inline brand references** (`gunes-enerjisi.mdx`, `yerden-isitma-sistemleri.mdx`): These have rich markdown descriptions (product categories, detailed bullet lists with technology names). Extract the core brand entry (`* **[Brand](/markalar/brand)**` with `*description*`) and convert to CardGroup. Keep any additional sub-bullets or detail paragraphs that are brand-specific directly below the Card component containing that brand.

**Icon mapping:**

Use these lucide icon names for Card `icon` attributes in service pages. For brand icons on service pages, use the generic icon from the service context:

| Context / Section | Icon |
|---|---|
| Isı Pompaları brands | `thermometer` |
| Güneş Enerjisi brands | `sun` |
| Hidrofor Sistemleri brands | `droplet` |
| Su Depoları brands | `database` |
| Su Arıtma Sistemleri brands | `droplets` |
| Yerden Isıtma brands | `flame` |
| Klima Sistemleri brands | `wind` |
| Pompalar brands | `droplet` |
| Radyatör brands | `flame` |
| Sulama Sistemleri brands | `sprout` |
| Tahliye İstasyonu brands | `trash-2` |
| Termosifonik Sistemler brands | `sun` |
| Akıllı Oda Termostatları brands | `thermostat` |
| Mekanik Sıhhi Tesisat brands | `wrench` |
| Genel brand icons (brand pages) | `building` |

- [ ] For `hizmetlerimiz/isi-pompalari.mdx`: Convert "## İlgili Markalar" bullet list (12 brands + Havuz section) to CardGroup
- [ ] For `hizmetlerimiz/hidrofor-sistemleri.mdx`: Replace `<div class="brand-grid">` with CardGroup (11 brands)
- [ ] For `hizmetlerimiz/su-depolari.mdx`: Convert "## İlgili Markalar" list (3 brands) to CardGroup
- [ ] For `hizmetlerimiz/tahliye-istasyonu.mdx`: Convert "## İlgili Markalar" list (11 brands) to CardGroup
- [ ] For `hizmetlerimiz/termosifonik-sistemler.mdx`: Convert "## İlgili Markalar" list (6 brands) to CardGroup
- [ ] For `hizmetlerimiz/yerden-isitma-sistemleri.mdx`: Convert "## İlgili Markalar ve Çözümlerimiz" section to CardGroup
- [ ] For `hizmetlerimiz/gunes-enerjisi.mdx`: Convert "## İlgili Markalar ve Çözümlerimiz" section to CardGroup
- [ ] For `hizmetlerimiz/klima-sistemleri.mdx`: Convert each `###` brand subsection to its own CardGroup
- [ ] For `hizmetlerimiz/pompalar.mdx`: Convert each `###` brand subsection to CardGroup
- [ ] For `hizmetlerimiz/radyator.mdx`: Convert `###` brand sections to CardGroup
- [ ] For `hizmetlerimiz/sulama-sistemleri.mdx`: Convert each `###` brand subsection to CardGroup
- [ ] For `hizmetlerimiz/mekanik-sihhi-tesisat.mdx`: Convert each `###` brand subsection to CardGroup
- [ ] For `hizmetlerimiz/akilli-oda-termostatlari.mdx`: Convert each `###` brand subsection to CardGroup
- [ ] Run targeted verification: for each converted page, confirm all brand `href` paths exist on disk (`grep -r "markalar/BRAND"` as spot-check)

**Artifacts:**
- 14 service `.mdx` files (modified)

### Step 2: Convert brand page service listings to Card components

For each of the 9 brand pages with a `## Hizmetler` section, replace the markdown bullet list with a `<CardGroup>` containing `<Card>` components linking to the corresponding service pages.

**Pattern:**

Before:
```
## Hizmetler

- [Isı Pompaları](/hizmetlerimiz/isi-pompalari)
- [Hidrofor Sistemleri](/hizmetlerimiz/hidrofor-sistemleri)
```

After:
```
## Hizmetler

<CardGroup>
  <Card title="Isı Pompaları" icon="thermometer" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Hidrofor Sistemleri" icon="droplet" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
</CardGroup>
```

**Icon mapping for card links (use service-specific icons):**

| Service | Icon |
|---|---|
| Isı Pompaları | `thermometer` |
| Hidrofor Sistemleri | `droplet` |
| Su Depoları | `database` |
| Su Arıtma Sistemleri | `droplets` |
| Tahliye İstasyonu | `trash-2` |
| Termosifonik Sistemler | `sun` |
| Pompalar | `droplet` |
| Radyatör | `flame` |
| Klima Sistemleri | `wind` |
| Güneş Enerjisi | `sun` |
| Akıllı Oda Termostatları | `thermostat` |
| Mekanik Sıhhi Tesisat | `wrench` |
| Sulama Sistemleri | `sprout` |
| Yerden Isıtma | `flame` |

- [ ] For `markalar/baymak.mdx`: Convert "## Hizmetler" list (5 services) to CardGroup
- [ ] For `markalar/alarko.mdx`: Convert "## Hizmetler" list to CardGroup
- [ ] For `markalar/aldea.mdx`: Convert "## Hizmetler" list to CardGroup
- [ ] For `markalar/aqualine.mdx`: Convert "## Hizmetler" list to CardGroup
- [ ] For `markalar/astral.mdx`: Convert "## Hizmetler" list to CardGroup
- [ ] For `markalar/atlantis.mdx`: Convert "## Hizmetler" list to CardGroup
- [ ] For `markalar/atlas.mdx`: Convert "## Hizmetler" list to CardGroup
- [ ] For `markalar/beser.mdx`: Convert "## Hizmetler" list to CardGroup
- [ ] For `markalar/caleffi.mdx`: Convert "## Hizmetler" list to CardGroup
- [ ] For each brand page, verify: (a) the `## Hizmetler` section header is preserved, (b) all service `href` paths exist on disk, (c) no extraneous text remains between the heading and the CardGroup

**Do NOT convert:**
- `## 🌟 Isı Pompası Hizmetlerimiz` or similar sections with emoji — those use external link-card URLs (e.g., `https://isi-pompasi.gul-tekinmuhendislik.com/`) and should remain as-is
- `## 🌟 Bodrum Hidrofor Hizmetlerimiz` — same reason
- Any section with `class="link-card featured"` — those use custom HTML, not plain markdown lists

**Artifacts:**
- 9 brand `.mdx` files (modified)

### Step 3: Testing & Verification

> No test framework or lint tooling exists in this project. Verification is manual but thorough — every modified file must be checked for correctness.

- [ ] **Tag validation**: grep all modified files for `<CardGroup` and `<Card` — verify every opening tag has a corresponding closing tag (`</CardGroup>` and `</Card>`). Run:
  ```
  grep -c '<Card[^G]' hizmetlerimiz/*.mdx markalar/*.mdx
  grep -c '</Card>' hizmetlerimiz/*.mdx markalar/*.mdx
  ```
  The counts for `<Card` and `</Card>` must match within each file.

- [ ] **Href integrity**: Extract all `href=` values from Card components across all modified files and verify each path resolves to an existing `.mdx` file on disk:
  ```
  grep -ohP 'href="([^"]+)"' hizmetlerimiz/*.mdx markalar/*.mdx | sed 's|"||g; s|href=||' | while read path; do
    slug=$(echo "$path" | sed 's|^/||')
    # Check for matching file
    find . -path "./${slug}.mdx" -o -path "./${slug}.md" 2>/dev/null | head -1
  done
  ```

- [ ] **No content loss**: For each modified file, diff the list of markdown links `\[...\]\(...\)` that were removed against the href values in the new Card components — all original link destinations must be preserved as Card components

- [ ] **No leftover custom HTML in hidrofor-sistemleri.mdx**: Verify the old `<div class="brand-grid">` block was fully removed:
  ```
  grep -n 'brand-grid' hizmetlerimiz/hidrofor-sistemleri.mdx
  ```
  Should return no matches.

- [ ] **MDX parse check**: Read each modified file end-to-end and confirm no bare text exists between `<CardGroup>` and `</CardGroup>` (outside of `<Card>` tags), which would break Mintlify rendering

- [ ] **Fix all failures found** — if a brand file doesn't exist (e.g., from FN-002 merge), adjust the Card component to point to the canonical path

### Step 4: Documentation & Delivery

- [ ] Save documentation deliverables as task documents via `fn_task_document_write` (key="docs", content=Markdown summary with: (a) list of all modified files, (b) icon mapping table used, (c) any files skipped and why)
- [ ] Out-of-scope findings created as new tasks via `fn_task_create` tool (e.g., if `custom.css` `.brand-grid`/`.brand-card` selectors are now entirely unused, create a cleanup task)

## Documentation Requirements

**Must Update:**
- None (this is a content-presentation change — no documentation files exist for this pattern)

**Check If Affected:**
- `custom.css` — if `.brand-grid`, `.brand-card`, `.brand-card-icon`, `.brand-card-link`, `.brand-card h3`, `.brand-card p` selectors are no longer referenced after removing the `<div class="brand-grid">` from `hidrofor-sistemleri.mdx`, create a follow-up task to consider CSS cleanup. Do NOT delete CSS in this task.

## Completion Criteria

- [ ] All 14 service pages (excluding `su-aritma-sistemleri.mdx`) have CardGroup components replacing their brand listing sections
- [ ] All 9 brand pages have CardGroup components replacing their `## Hizmetler` markdown lists
- [ ] No original brand/service link destinations were lost in the conversion
- [ ] All Card components use appropriate icons from the icon mapping tables
- [ ] All `<CardGroup>` and `<Card>` tags are properly paired and closed
- [ ] The `<div class="brand-grid">` block is fully removed from `hidrofor-sistemleri.mdx`
- [ ] Documentation summary saved via `fn_task_document_write`

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-012): complete Step N — description`
- **Bug fixes:** `fix(FN-012): description`

## Do NOT

- Modify `hizmetlerimiz/su-aritma-sistemleri.mdx` — it already has CardGroup
- Modify `hizmetlerimiz/gunes-enerjisi-ile-elektrik-uretimi.mdx` or `hizmetlerimiz/gunes-enerjisi-ile-su-isitma.mdx` — they embed brands inline in prose, not in structured lists
- Convert `## 🌟 [Emoji] ...` sections — these use external URLs with custom link-card HTML and are not plain markdown lists
- Delete `.brand-grid`, `.brand-card`, or any CSS selectors from `custom.css` even if they become unused
- Add new brand or service links that weren't in the original markdown listing
- Change any section heading text (keep `## İlgili Markalar`, `## Hizmetler`, `### ...` headings unchanged)
- Remove content above or below the converted sections
- Modify `markalar.mdx` (index page) or `hizmetlerimiz.mdx` (index page) — they are out of scope
- Modify files in `isi-pompalari/` directory — those are separate
- Commit without the task ID prefix

## Changeset Requirements

No changeset needed — this task only ADDS Mintlify Card component markup and does not remove any existing functionality. (The `.brand-grid` div removal from `hidrofor-sistemleri.mdx` is a presentation replacement, not a feature removal — the same brand links remain as Card components.)
