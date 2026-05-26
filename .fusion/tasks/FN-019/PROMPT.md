# Task: FN-019 — Brand Pages — Add İlgili Hizmetlerimiz to pages with external link-cards

**Created:** 2026-05-26
**Size:** M

## Review Level: 1 (Plan Only)

**Assessment:** Adds a new Mintlify CardGroup section to 23 brand `.mdx` files using a mechanical mapping pattern derived from existing external link-card headings. Each change is small and reversible. No data risk, no new functionality — purely additive internal navigation. Blast radius is medium (many files) but each change is identical in structure.
**Score:** 2/8 — Blast radius: 1, Pattern novelty: 0, Security: 0, Reversibility: 1

## Mission

Many brand pages in `markalar/` have external promotional sections (headings like `## 🌟 Isı Pompası Hizmetlerimiz`, `## 🌟 Yerden Isıtma Hizmetlerimiz`, `## 🌟 Güneş Enerjisi Hizmetlerimiz`, `## 🌟 Bodrum Hidrofor Hizmetlerimiz`, `## 🌟 Su Deposu Hizmetlerimiz`) that link to external microsites with `class="link-card featured"`. These sections already reveal which service(s) each brand is associated with. This task adds a new `## İlgili Hizmetlerimiz` section immediately after the last external link-card section on each page, containing a `<CardGroup>` with `<Card>` components linking to the corresponding internal Mintlify service pages. This improves internal navigation and provides a consistent "related services" callout across all brand pages. All existing external link-cards are preserved intact.

## Dependencies

- **None**

## Context to Read First

- `hizmetlerimiz/su-aritma-sistemleri.mdx` — reference implementation showing `<CardGroup>` / `<Card>` syntax (lines 6-12)
- The 23 target files listed below (read each before editing to confirm current state)

## File Scope

All files in `markalar/` directory (23 files total, all modified):

- `markalar/demirdokum.mdx`
- `markalar/eca.mdx`
- `markalar/lg.mdx`
- `markalar/general.mdx`
- `markalar/toshiba.mdx`
- `markalar/rehau.mdx`
- `markalar/panasonic.mdx`
- `markalar/grundfos.mdx`
- `markalar/honeywell.mdx`
- `markalar/wilo.mdx`
- `markalar/wepomp.mdx`
- `markalar/solimpeks.mdx`
- `markalar/hakan-plastik.mdx`
- `markalar/vesbo.mdx`
- `markalar/jinko.mdx`
- `markalar/siemens.mdx`
- `markalar/eds.mdx`
- `markalar/fronius.mdx`
- `markalar/standart.mdx`
- `markalar/mega.mdx`
- `markalar/teksan.mdx`
- `markalar/yelkenci.mdx`
- `markalar/eraslan.mdx`

## Steps

### Step 0: Preflight

- [ ] Verify all 23 target `.mdx` files exist under `markalar/`
- [ ] Verify the reference file `hizmetlerimiz/su-aritma-sistemleri.mdx` exists for CardGroup syntax reference
- [ ] Verify all five referenced service pages exist:
  - `hizmetlerimiz/isi-pompalari.mdx`
  - `hizmetlerimiz/yerden-isitma-sistemleri.mdx`
  - `hizmetlerimiz/gunes-enerjisi.mdx`
  - `hizmetlerimiz/hidrofor-sistemleri.mdx`
  - `hizmetlerimiz/su-depolari.mdx`

### Step 1: Process pages with a single `## 🌟 Isı Pompası Hizmetlerimiz` section

**Pages:** demirdokum.mdx, eca.mdx, lg.mdx, general.mdx, toshiba.mdx

**Pattern:** Each page has one external link-card section: `## 🌟 Isı Pompası Hizmetlerimiz` → maps to service `/hizmetlerimiz/isi-pompalari`.

**Action:** After the entire external link-card `<a>` block (the last line containing `</a>` that closes the link-card for this section), insert:

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
</CardGroup>
```

**Important spacing:** Leave exactly ONE blank line before the new `## İlgili Hizmetlerimiz` heading and ONE blank line after the `</CardGroup>` closing tag.

**Context details per page:**
- **demirdokum.mdx**: The file ends with the external link-card `</a>` and has no content after it. The new section will be the last content on the page.
- **eca.mdx**: Same pattern — file ends after the external link-card's `</a>`.
- **lg.mdx**: Same — ends after `</a>`.
- **general.mdx**: Same — ends after `</a>`.
- **toshiba.mdx**: Same — ends after `</a>` (note: toshiba has an extra trailing `</a>` on its own line at the very end — add the new section after the closing `</a>` that marks the end of the link-card).

- [ ] Read each page to confirm current state before editing
- [ ] Add `## İlgili Hizmetlerimiz` CardGroup after the external link-card closing `</a>` for each page

**Artifacts:**
- `markalar/demirdokum.mdx` (modified)
- `markalar/eca.mdx` (modified)
- `markalar/lg.mdx` (modified)
- `markalar/general.mdx` (modified)
- `markalar/toshiba.mdx` (modified)

### Step 2: Process pages with a single `## 🌟 Yerden Isıtma Hizmetlerimiz` section

**Pages:** honeywell.mdx, hakan-plastik.mdx, vesbo.mdx, siemens.mdx

**Pattern:** Each page has one external link-card section: `## 🌟 Yerden Isıtma Hizmetlerimiz` → maps to service `/hizmetlerimiz/yerden-isitma-sistemleri`.

**Action:** After the entire external link-card `<a>` block, insert:

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Yerden Isıtma Sistemleri" href="/hizmetlerimiz/yerden-isitma-sistemleri"></Card>
</CardGroup>
```

- [ ] Read each page to confirm current state
- [ ] Add the new section after the external link-card closing `</a>` for each page

**Artifacts:**
- `markalar/honeywell.mdx` (modified)
- `markalar/hakan-plastik.mdx` (modified)
- `markalar/vesbo.mdx` (modified)
- `markalar/siemens.mdx` (modified)

### Step 3: Process pages with a single `## 🌟 Güneş Enerjisi Hizmetlerimiz` section

**Pages:** jinko.mdx, fronius.mdx, teksan.mdx, eraslan.mdx

**Pattern:** Each page has one external link-card section: `## 🌟 Güneş Enerjisi Hizmetlerimiz` → maps to service `/hizmetlerimiz/gunes-enerjisi`.

**Action:** After the entire external link-card `<a>` block, insert:

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Güneş Enerjisi Sistemleri" href="/hizmetlerimiz/gunes-enerjisi"></Card>
</CardGroup>
```

- [ ] Read each page to confirm current state
- [ ] Add the new section after the external link-card closing `</a>` for each page

**Artifacts:**
- `markalar/jinko.mdx` (modified)
- `markalar/fronius.mdx` (modified)
- `markalar/teksan.mdx` (modified)
- `markalar/eraslan.mdx` (modified)

### Step 4: Process pages with a single `## 🌟 Bodrum Hidrofor Hizmetlerimiz` section

**Pages:** eds.mdx, mega.mdx

**Pattern:** Each page has one external link-card section: `## 🌟 Bodrum Hidrofor Hizmetlerimiz` → maps to service `/hizmetlerimiz/hidrofor-sistemleri`.

**Action:** After the entire external link-card `<a>` block, insert:

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Hidrofor Sistemleri" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
</CardGroup>
```

- [ ] Read each page to confirm current state
- [ ] Add the new section after the external link-card closing `</a>` for each page

**Artifacts:**
- `markalar/eds.mdx` (modified)
- `markalar/mega.mdx` (modified)

### Step 5: Process multi-section pages (2-3 external link-card sections)

**Pages:** rehau.mdx, grundfos.mdx, wilo.mdx, wepomp.mdx, standart.mdx, yelkenci.mdx

**Pattern:** These pages have 2 or 3 different `## 🌟 ... Hizmetlerimiz` sections. The `## İlgili Hizmetlerimiz` CardGroup should contain ONE Card for EACH distinct service derived from ALL the external sections on that page. Place the new section AFTER the LAST external link-card's closing `</a>`.

**Page-specific mappings:**

| Page | External sections found | Cards to include |
|---|---|---|
| **rehau.mdx** | `## 🌟 Yerden Isıtma Hizmetlerimiz`, `## 🌟 Isı Pompası Hizmetlerimiz`, `## 🌟 Güneş Enerjisi Hizmetlerimiz` | Yerden Isıtma Sistemleri, Isı Pompaları, Güneş Enerjisi Sistemleri |
| **grundfos.mdx** | `## 🌟 Yerden Isıtma Hizmetlerimiz`, `## 🌟 Bodrum Hidrofor Hizmetlerimiz` | Yerden Isıtma Sistemleri, Hidrofor Sistemleri |
| **wilo.mdx** | `## 🌟 Yerden Isıtma Hizmetlerimiz`, `## 🌟 Bodrum Hidrofor Hizmetlerimiz`, `## 🌟 Güneş Enerjisi Hizmetlerimiz` | Yerden Isıtma Sistemleri, Hidrofor Sistemleri, Güneş Enerjisi Sistemleri |
| **wepomp.mdx** | `## 🌟 Yerden Isıtma Hizmetlerimiz`, `## 🌟 Bodrum Hidrofor Hizmetlerimiz` | Yerden Isıtma Sistemleri, Hidrofor Sistemleri |
| **standart.mdx** | `## 🌟 Yerden Isıtma Hizmetlerimiz`, `## 🌟 Bodrum Hidrofor Hizmetlerimiz` | Yerden Isıtma Sistemleri, Hidrofor Sistemleri |
| **yelkenci.mdx** | `## 🌟 Su Deposu Hizmetlerimiz`, `## 🌟 Güneş Enerjisi Hizmetlerimiz` | Su Depoları, Güneş Enerjisi Sistemleri |

**Action:** For each page, after the LAST external link-card's closing `</a>`, insert:

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Yerden Isıtma Sistemleri" href="/hizmetlerimiz/yerden-isitma-sistemleri"></Card>
  <Card title="Hidrofor Sistemleri" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
</CardGroup>
```

(Adjust the Card list for each page per the mapping table above.)

**Card title to slug mapping:**

| Card title | href slug |
|---|---|
| Isı Pompaları | /hizmetlerimiz/isi-pompalari |
| Yerden Isıtma Sistemleri | /hizmetlerimiz/yerden-isitma-sistemleri |
| Güneş Enerjisi Sistemleri | /hizmetlerimiz/gunes-enerjisi |
| Hidrofor Sistemleri | /hizmetlerimiz/hidrofor-sistemleri |
| Su Depoları | /hizmetlerimiz/su-depolari |

- [ ] Read each page to identify the LAST external link-card section's closing `</a>`
- [ ] For each page, add the CardGroup with all applicable Cards
- [ ] Verify Cards are in a sensible order (try to match the order the external sections appear on the page)

**Artifacts:**
- `markalar/rehau.mdx` (modified)
- `markalar/grundfos.mdx` (modified)
- `markalar/wilo.mdx` (modified)
- `markalar/wepomp.mdx` (modified)
- `markalar/standart.mdx` (modified)
- `markalar/yelkenci.mdx` (modified)

### Step 6: Process special-case pages (panasonic.mdx, solimpeks.mdx)

Two pages have heading patterns that differ from the standard `## 🌟 ... Hizmetlerimiz` format but still contain `class="link-card featured"` link-cards and are listed as targets.

#### panasonic.mdx

**Current state:** Has a single external link-card section: `## 🌟 İlgili Hizmetlerimiz` (with star emoji and "İlgili" text). The link-card points to Isı Pompası external site. Page content covers both Isı Pompaları/Klima and Güneş Enerjisi.

**Action:** After the external link-card's closing `</a>`, add a new `## İlgili Hizmetlerimiz` section (without star emoji) with Cards for both services mentioned on the page:

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Güneş Enerjisi Sistemleri" href="/hizmetlerimiz/gunes-enerjisi"></Card>
</CardGroup>
```

The result will have two adjacent "İlgili Hizmetlerimiz" sections — the original `## 🌟` external one followed by the new `##` internal one. This is intentional per the task spec.

#### solimpeks.mdx

**Current state:** Has two external `class="link-card featured"` link-cards under `## Öne Çıkan Solimpeks Çözümleri` heading (not `## 🌟 ... Hizmetlerimiz`). One links to Isı Pompası external site, the other to Güneş Enerjisi external site. After the link-cards, there's a `## Solimpeks Ürün Grupları` heading.

**Action:** After the last external link-card's closing `</a>` (before `## Solimpeks Ürün Grupları`), insert:

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Güneş Enerjisi Sistemleri" href="/hizmetlerimiz/gunes-enerjisi"></Card>
</CardGroup>
```

- [ ] Read panasonic.mdx and solimpeks.mdx to confirm current state and identify exact insertion points
- [ ] Add the new section to each page per the instructions above

**Artifacts:**
- `markalar/panasonic.mdx` (modified)
- `markalar/solimpeks.mdx` (modified)

### Step 7: Testing & Verification

> ZERO test failures allowed. Mintlify docs site validation as quality gate.
> If keeping lint/build green requires edits outside the initial File Scope, make those fixes as part of this task.

- [ ] For each of the 23 modified files, verify:
  - All `<CardGroup>` and `<Card>` tags are properly closed (no unclosed tags)
  - The `## İlgili Hizmetlerimiz` heading is properly formatted (no emoji, correct capitalization)
  - All Card `href` values point to valid service pages under `/hizmetlerimiz/` that exist on disk (check: isi-pompalari, yerden-isitma-sistemleri, gunes-enerjisi, hidrofor-sistemleri, su-depolari)
  - All existing external link-card sections (`## 🌟 ... Hizmetlerimiz` with `class="link-card featured"`) are STILL INTACT and unchanged
  - No content outside the targeted section was modified
  - No duplicate or missing Cards (the CardGroup contains exactly the Cards specified in the mapping)
- [ ] If `npx mintlify` CLI is available, run `npx mintlify dev --check` or equivalent to verify the site builds
- [ ] Fix all failures — if fixes require editing outside the declared File Scope, make those fixes anyway

### Step 8: Documentation & Delivery

- [ ] Save a summary of changes as a task document: `fn_task_document_write(key="docs", content=structured summary listing all 23 pages modified, the external sections found on each, and the Card titles added)`
- [ ] Create any out-of-scope findings as new tasks via `fn_task_create`

## Documentation Requirements

**Must Update:**
- None — this is a content change only, no documentation files need updating

**Check If Affected:**
- None

## Completion Criteria

- [ ] All 23 brand pages have a new `## İlgili Hizmetlerimiz` section with `<CardGroup>` / `<Card>` components
- [ ] Each CardGroup contains the correct Cards derived from the external link-card sections on that page
- [ ] All Cards use the correct `title` and `href` from the mapping tables above
- [ ] No `icon` attribute is used on any Card (per task instruction: omit icon)
- [ ] All existing external link-card sections (`## 🌟 ... Hizmetlerimiz`) are preserved intact
- [ ] All `<CardGroup>` and `<Card>` tags are properly closed — valid MDX syntax
- [ ] Documentation summary saved via `fn_task_document_write`

## External Heading to Service Mapping Reference

Use this table to determine which service slug to use for each external heading pattern:

| External heading text | Internal service Card title | Internal slug |
|---|---|---|
| Isı Pompası Hizmetlerimiz | Isı Pompaları | /hizmetlerimiz/isi-pompalari |
| Yerden Isıtma Hizmetlerimiz | Yerden Isıtma Sistemleri | /hizmetlerimiz/yerden-isitma-sistemleri |
| Güneş Enerjisi Hizmetlerimiz | Güneş Enerjisi Sistemleri | /hizmetlerimiz/gunes-enerjisi |
| Bodrum Hidrofor Hizmetlerimiz | Hidrofor Sistemleri | /hizmetlerimiz/hidrofor-sistemleri |
| Su Deposu Hizmetlerimiz | Su Depoları | /hizmetlerimiz/su-depolari |
| İlgili Hizmetlerimiz | Based on page content (see panasonic) | (see panasonic) |

## Service Pages Reference

Ensure these `.mdx` files exist under `hizmetlerimiz/` (all verified during preflight):

| Service | File |
|---|---|
| Isı Pompaları | hizmetlerimiz/isi-pompalari.mdx |
| Yerden Isıtma Sistemleri | hizmetlerimiz/yerden-isitma-sistemleri.mdx |
| Güneş Enerjisi Sistemleri | hizmetlerimiz/gunes-enerjisi.mdx |
| Hidrofor Sistemleri | hizmetlerimiz/hidrofor-sistemleri.mdx |
| Su Depoları | hizmetlerimiz/su-depolari.mdx |

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-019): complete Step N — processed {page-group} pages`
- **Bug fixes:** `fix(FN-019): description`
- **Final commit:** `feat(FN-019): add İlgili Hizmetlerimiz CardGroups to 23 brand pages`

## Do NOT

- Modify or remove any existing `## 🌟 ... Hizmetlerimiz` external link-card sections — these must remain intact
- Add `icon` attribute to any Card component
- Alter any content outside the newly added `## İlgili Hizmetlerimiz` section
- Change any existing headings, lists, or prose on the pages
- Remove, delete, or gut modules, settings, interfaces, exports, or test files outside the File Scope
- Refuse to fix issues found during verification, even if the fix touches adjacent content in the 23 target files

## Changeset Requirements

No changeset needed — this task only ADDS new CardGroup sections and does not remove any existing functionality.
