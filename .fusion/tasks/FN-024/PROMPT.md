# Task: FN-024 — DOGRULAMA: Kalan 25 Marka Icerik Degerlendirmesi

**Created:** 2026-05-26
**Size:** M

## Review Level: 1 (Plan Only)

**Assessment:** Read-only validation of 25 brand pages against 5 quality criteria; produces a structured gap report and creates fix-instruction tasks for deficiencies. No file modifications. No security impact. Fully reversible (all analysis lives in task documents).
**Score:** 2/8 — Blast radius: 0, Pattern novelty: 1, Security: 0, Reversibility: 1

## Mission

Validate the content quality of the 25 remaining "large" brand pages in `markalar/` (those not covered by FN-022's short-brand enrichment or FN-023's medium-brand enrichment) and produce a structured per-brand gap analysis with actionable fix instructions. Each brand page must be assessed against 5 criteria: marka bilgisi (brand info), teknik detay (technical detail), Gül-tekin ilişkisi (relationship explanation), hizmet sayfalarina link (service page links), and görsel (visual/image). For every deficiency found, write a specific fix instruction. At the end, compile all findings into a comprehensive quality report saved as a task document, and create new tasks for any uncovered gaps that need implementation.

This task is a key dependency for FN-016 (overall brand quality control), which will consume this report.

## Dependencies

- **None** — FN-024 is an independent validation pass on the large brand pages

## Context to Read First

- `.fusion/memory/MEMORY.md` — brand identity notes (warmeks = varmeks)
- `docs.json` — navigation structure for cross-referencing service page paths
- `hizmetlerimiz/*.mdx` — to validate service page href targets mentioned in brand pages
- `custom.css` — understand `.link-card`, `.brand-card`, `.badge` patterns used for visuals

## File Scope

**Read-only — validation targets (no modifications by this task):**
- `markalar/alarko.mdx`
- `markalar/aldea.mdx`
- `markalar/atlantis.mdx`
- `markalar/atlas.mdx`
- `markalar/baylan.mdx`
- `markalar/baymak.mdx`
- `markalar/burak.mdx`
- `markalar/caleffi.mdx`
- `markalar/eraslan.mdx`
- `markalar/grundfos.mdx`
- `markalar/hakan-plastik.mdx`
- `markalar/honeywell.mdx`
- `markalar/jinko.mdx`
- `markalar/panasonic.mdx`
- `markalar/ph-mekanik.mdx`
- `markalar/siemens.mdx`
- `markalar/solimpeks.mdx`
- `markalar/standart.mdx`
- `markalar/teksan.mdx`
- `markalar/toshiba.mdx`
- `markalar/tse.mdx`
- `markalar/varmeks.md`
- `markalar/warmeks.mdx`
- `markalar/wepomp.mdx`
- `markalar/wilo.mdx`
- `markalar/yelkenci.mdx`

**Created:**
- This task's documents (via `fn_task_document_write`)
- New triage tasks for uncovered gaps (via `fn_task_create`)

## Steps

### Step 0: Preflight

- [ ] Confirm all 25 brand files exist under `markalar/` — run `ls markalar/` and verify
- [ ] Note that warmeks.mdx and varmeks.md are the SAME brand (Varmeks); count them as one
- [ ] Read `hizmetlerimiz/` directory listing to know valid service page href paths
- [ ] Verify no other task has produced a validation report for these 25 brands (check task documents on FN-016)

### Step 1: Validate All 25 Brand Pages — Score Each Against 5 Criteria

For every brand file in the File Scope list, read the full content and score it pass/fail on 5 criteria. Record findings in a structured matrix.

#### Criterion Definitions

**A — Marka Bilgisi (Brand Information)**
Pass if the page includes at least 3 of: kuruluş yılı (founding year), merkez/ülke (headquarters), sektör liderliği/konumu (market position statement), ana ürün grupları adları (product categories listed by name).

**B — Teknik Detay (Technical Detail)**
Pass if the page includes at least some specific technical information beyond brand name: model serileri, teknik özellikler (e.g. kW, COP, boyut, verimlilik), sertifikalar, veya karşılaştırmalı ürün bilgisi.

**C — Gül-tekin İlişkisi (Gül-tekin Relationship)**
Pass if the page contains a paragraph or sentence explaining how Gül-tekin Mühendislik works with this brand — e.g. "Gül-Tekin Mühendislik, {brand} ürünlerini kullanarak müşterilerine..." or similar.

**D — Hizmet Sayfalarına Link (Service Page Links)**
Pass if the page includes at least one link to an internal service page under `/hizmetlerimiz/`. This can be either a `<CardGroup>` with `<Card href="/hizmetlerimiz/...">` or a `class="link-card featured"` external link. Plain `/contact` or `/markalar` links do NOT count.

**E — Görsel/Resim (Visual/Image)**
Pass if the page includes an `<img>` tag with a valid `src` attribute, OR has an HTML comment documenting image placement opportunity (`<!-- GÖRSEL ÖNERİSİ:`). Absence of both is a fail.

#### Assessment Matrix

Record results for each brand as a structured row. Example format:

```
| alarko | ✅ | ❌ | ✅ | ✅ | ❌ | 2KB | Marka bilgisi var ama teknik detay yok (ürün serisi, model, vs.) |
```

For each **FAIL** on any criterion, write a specific **Fix Instruction** describing what needs to be added or fixed.

- [ ] Read and score **alarko.mdx** — check: brand info (Alarko Holding + Carrier joint venture), technical detail, relationship, service links, image
- [ ] Read and score **aldea.mdx** — check: founding year (2007), product range (Blue Serisi EVI DC Inverter), relationship, service links, image
- [ ] Read and score **atlantis.mdx** — check: brand info, product range (hidrofor modelleri, fiyatlar), relationship, service links, image
- [ ] Read and score **atlas.mdx** — check: brand info (pompa uzmanı), relationship, service links, image
- [ ] Read and score **baylan.mdx** — check: brand info (su sayacı üreticisi), **raw JSON format issue**, relationship, service links, image
- [ ] Read and score **baymak.mdx** — check: brand info (1946, köklü üretici), technical detail (Iotherm, COP, R32, hidrofor modelleri/fiyatları), relationship, service links, image
- [ ] Read and score **burak.mdx** — check: brand info, product range (boyler kollektör paketleri), relationship, service links, image
- [ ] Read and score **caleffi.mdx** — check: brand info (1961, İtalya), product range, relationship, service links, image
- [ ] Read and score **eraslan.mdx** — check: brand info (güneş enerjisi), product range (170LT/150LT emaye boyler), relationship, service links, image
- [ ] Read and score **grundfos.mdx** — check: brand info (1945, Danimarka), technical detail (SCALA2, CMBE, JP serisi), relationship, service links, image
- [ ] Read and score **hakan-plastik.mdx** — check: brand info (1965, Georg Fischer), product range (SILENTA, AQUASYSTEM), relationship, service links, image
- [ ] Read and score **honeywell.mdx** — check: brand info (100+ yıl, ABD), technical detail, relationship, service links, image
- [ ] Read and score **jinko.mdx** — check: brand info (2006, Çin, Tier 1), technical detail (Tiger Neo, N-Type, 320GW sevkiyat), relationship, service links, image
- [ ] Read and score **panasonic.mdx** — check: brand info (100+ yıl, Japonya), technical detail (Tier 1, HIT, EverVolt, VRF), relationship, service links, image
- [ ] Read and score **ph-mekanik.mdx** — check: brand info (modüler su deposu), **raw JSON format issue**, relationship, service links, image
- [ ] Read and score **siemens.mdx** — check: brand info (1847, Almanya), technical detail (Smart Infrastructure), relationship, service links, image
- [ ] Read and score **solimpeks.mdx** — check: brand info (2001, Konya, Avrupa 3.sü), technical detail (MAXA, COP=4, hijyenik boyler), relationship, service links, image
- [ ] Read and score **standart.mdx** — check: brand info (Türkiye pompa lideri), technical detail (SBM, SBT, CDLF, SVH model tabloları), relationship, service links, image
- [ ] Read and score **teksan.mdx** — check: brand info (1994, jeneratör lideri), **title says "Su Depoları" but brand is generator company!**, relationship, service links, image
- [ ] Read and score **toshiba.mdx** — check: brand info (Japon teknoloji devi), technical detail (Estia, inverter, VRF), relationship, service links, image
- [ ] Read and score **tse.mdx** — check: **NOT A BRAND** (TSE is Türk Standartları Enstitüsü, a standards body), relationship, service links, image
- [ ] Read and score **varmeks.md** and **warmeks.mdx** — check: count as same brand, brand info (Türkiye isi pompası lideri), technical detail (Varm Up, Varm Silent Pool, EVI DC Inverter), relationship, service links, image
- [ ] Read and score **wepomp.mdx** — check: brand info (Türkiye pompa üreticisi), technical detail (12 ürün kategorisi, detaylı), relationship, service links, image
- [ ] Read and score **wilo.mdx** — check: brand info (1872, Almanya), technical detail (Initial Control, Helix, Silent Master modelleri), relationship, service links, image
- [ ] Read and score **yelkenci.mdx** — check: brand info (köklü marka, su deposu), technical detail, relationship, service links, image
- [ ] Record byte sizes for all files: run `wc -c markalar/` for each target file

**Artifacts:**
- (in-memory scoring matrix, to be compiled in Step 2)

### Step 2: Compile Comprehensive Quality Report

- [ ] Build a structured Markdown report with the following sections:

#### Report Sections

**1. Summary Statistics**
- Total brands validated: 25 (varmeks/warmeks counted as one)
- Brands scoring full marks (5/5): count
- Brands scoring 4/5: count
- Brands scoring 3/5 or less: count
- Average score across all brands

**2. Per-Criterion Distribution**
| Kriter | Geçen | Kalan | Geçme Oranı |
|--------|-------|-------|-------------|
| A - Marka Bilgisi | N | N | X% |
| B - Teknik Detay | N | N | X% |
| C - Gül-tekin İlişkisi | N | N | X% |
| D - Hizmet Bağlantıları | N | N | X% |
| E - Görsel/Resim | N | N | X% |

**3. Detailed Scoring Matrix**
Full table with columns: # | Dosya | Bayt | A | B | C | D | E | Top | Notlar

**4. Brands with Issues — Fix Instructions**

For each brand that scored < 5/5 or has special issues, write a specific fix instruction:

**Format Issues:**
- **baylan.mdx** — raw JSON blob embedded in page (`{"value": {"answer": ...}}`). Fix instruction: extract product info from JSON into clean markdown; remove raw JSON block. This is NOT covered by existing tasks (FN-021 only addresses warmeks.mdx).
- **ph-mekanik.mdx** — same raw JSON issue. Fix instruction identical to baylan. NOT covered by existing tasks.
- **varmeks.md** — `.md` extension instead of `.mdx`. Already covered by FN-008/FN-021.
- **warmeks.mdx** — raw JSON block. Already covered by FN-021.
- **teksan.mdx** — **title says "Sanayi Tipi Su Depoları" but Teksan is a JENERATÖR manufacturer (1994, Türkiye lideri).** The title and description mismatch. Fix instruction: change title to reflect generator/power systems; change description accordingly. NOT covered by existing tasks.
- **tse.mdx** — **TSE is NOT a brand.** It is Türk Standartları Enstitüsü, a national standards body. The page functions as an informational explainer, not a brand page. Fix instruction: either (a) move page out of markalar/ to a more appropriate location (e.g., `hizmetlerimiz/` as a standards reference page, or `genel/tse-standartlari`), or (b) add a disclaimer at the top explaining TSE is not a commercial brand. NOT covered by existing tasks.

**Content Deficiencies (by criterion):**

List each brand that failed a criterion with:
```
**{brand}.mdx** — {criterion}
- **Fix:** {specific instruction for what to add/change}
- **Priority:** {high/medium/low}
- **Covered by:** {existing task ID or ❌ uncovered}
```

**5. Task Coverage Map**
Map every identified gap to an existing or newly created task.

- [ ] Compile the full report in markdown
- [ ] Save report via `fn_task_document_write(key="docs", content=<full report>)`

**Artifacts:**
- Quality report document (key="docs")

### Step 3: Create Fix-Instruction Tasks for Uncovered Gaps

Based on the report from Step 2, create new tasks for any gaps NOT already covered by existing tasks (FN-021, FN-022, FN-023, FN-018, FN-019, FN-020, etc.).

**Known uncovered gaps requiring new tasks:**

1. **baylan.mdx raw JSON → clean markdown** — baylan.mdx contains a raw `{"value": {"answer": ...}}` JSON block that needs to be extracted to clean markdown (similar to warmeks.mdx fix in FN-021 but for a different file).

2. **ph-mekanik.mdx raw JSON → clean markdown** — same issue as baylan.mdx; raw JSON block needs extraction.

3. **teksan.mdx title/content mismatch** — title says "Teksan Sanayi Tipi Su Depoları" but Teksan is a generator manufacturer (1994, Türkiye lider jeneratör üreticisi). Fix: change title, description, and H1 to reflect actual brand identity. Add content about generator/güç sistemleri, not su depoları.

4. **tse.mdx identity** — TSE is not a brand; determine appropriate location and add disclaimers.

5. **Brands missing image** — list brands with ❌ on criterion E and no HTML comment. Create a single task for adding image placement research comments.

6. **Brands missing hizmet bağlantıları** — list brands without CardGroup or link-card service links (e.g., burak.mdx, baylan.mdx, ph-mekanik.mdx, tse.mdx, teksan.mdx). Check if FN-018/FN-019/FN-020 already cover these.

- [ ] For each uncovered gap, create a new task via `fn_task_create` with clear description, branding reference, and dependencies
- [ ] Verify each new task's dependency chain references only sibling/pre-existing tasks (never FN-024 itself)

**Artifacts:**
- New tasks created for uncovered gaps (via `fn_task_create`)

### Step 4: Documentation & Delivery

- [ ] Re-read the saved report to verify completeness and accuracy
- [ ] Update `.fusion/memory/MEMORY.md` with critical findings from this validation:
  - teksan.mdx title/content mismatch (su deposu vs jeneratör)
  - tse.mdx is not a brand
  - baylan.mdx and ph-mekanik.mdx have raw JSON (like warmeks)
  - Summary of pass/fail distribution across the 25 brands
- [ ] Save any out-of-scope findings as new tasks via `fn_task_create`

## Documentation Requirements

**Must Save:**
- Comprehensive quality report via `fn_task_document_write(key="docs", content=...)` — per-brand scoring, fix instructions, task coverage map

**Must Update:**
- `.fusion/memory/MEMORY.md` — append critical findings (teksan title mismatch, tse identity, baylan/ph-mekanik raw JSON, summary stats)

## Completion Criteria

- [ ] All 25 brand pages validated against all 5 criteria
- [ ] Complete quality report saved as task document with: summary stats, per-criterion distribution, detailed scoring matrix, per-brand fix instructions, task coverage map
- [ ] All uncovered gaps converted to new tasks via `fn_task_create`
- [ ] Report identifies and flags: teksan title mismatch, tse non-brand identity, baylan/ph-mekanik raw JSON format issues
- [ ] Memory file updated with critical findings

## Git Commit Convention

This task is read-only (no file modifications), so git commits apply only for memory updates or task creation files:

- **Report completion:** `feat(FN-024): complete content validation report — 25 brands scored, N gaps found`
- **New task creation:** `chore(FN-024): create fix-instruction tasks for {gap-count} uncovered gaps`
- **Memory update:** `docs(FN-024): update memory with brand validation findings`

## Do NOT

- Modify any brand `.mdx` or `.md` files — this task is analysis only
- Modify `docs.json`, `hizmetlerimiz.mdx`, `markalar.mdx`, or `custom.css`
- Create tasks that depend on FN-024 (the parent will be deleted if splitting — use sibling task IDs only if splitting)
- Skip brand pages because they "look good enough" — every brand must be scored on all 5 criteria
- Count warmeks.mdx and varmeks.md as separate brands — treat them as one (Varmeks)
- Forget to flag the teksan.mdx title/description mismatch (critical issue)
- Forget to flag tse.mdx as a non-brand page
- Create redundant tasks for issues already covered by FN-021, FN-022, FN-023, FN-018, FN-019, or FN-020
