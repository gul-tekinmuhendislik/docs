# Task: FN-025 — KISA MARKALAR - Grup A: aqualine, nobo, radyal, rain-bird

**Created:** 2026-05-26
**Size:** M

## Review Level: 1 (Plan Only)

**Assessment:** Content enrichment of 4 brand `.mdx` files following established patterns from existing enriched brand pages (baymak, caleffi, grundfos). Each page gets expanded from ~870–1020 bytes to ≥2000 bytes with header images, Hakkında, Ürün Grupları, relationship sections, and service CardGroups. Radyal title fix is a critical item. No security risk, low blast radius (4 files), fully reversible via git revert.
**Score:** 2/8 — Blast radius: 1, Pattern novelty: 0, Security: 0, Reversibility: 1

## Mission

Enrich 4 "short" brand pages in `markalar/` to reach ≥2000 bytes each by adding structured content sections. Each page currently has only a title, description, short opening paragraph, and a minimal Hizmetler CardGroup. This task adds a header image, a detailed **Hakkında** section with establishment year / headquarters / market position, a **Ürün Grupları** section with detailed product descriptions, a **Gül-tekin Mühendislik ile İlişkimiz** section explaining the Bodrum relationship, a **Bodrum'da {Brand} Uygulamaları** section with local project examples, an **İlgili Hizmetlerimiz** `<CardGroup>` of internal Mintlify `<Card>` links, and an external promotional **## 🌟 ... Hizmetlerimiz** section with `class="link-card featured"` cards. The **radyal.mdx** page has a critical title fix: change `"Radyal Vanalar ve Pompa Sistemleri"` to `"Radyal Alüminyum Radyatör ve Havlupan Sistemleri"` in both frontmatter title and H1 heading.

This task is consumed by **FN-022** (coordination/verification for all 8 short brand pages), which will verify byte counts, content structure, and MDX validity.

## Dependencies

- **Task:** FN-019 (Add İlgili Hizmetlerimiz CardGroups to 23 brand pages — reference for CardGroup/Mintlify Card syntax pattern)

## Context to Read First

- `markalar/baymak.mdx` — reference for full brand page structure with **Hakkında**, **Ürün Grupları**, **Hizmetler** CardGroup, and external link-card sections
- `markalar/caleffi.mdx` — reference for header image placement + CardGroup + external link-card pattern
- `markalar/grundfos.mdx` — reference for detailed header image with `<div class="service-header-image">` and multiple external link-card sections
- `markalar/honeywell.mdx` — reference for a simpler enriched page (single external link-card section)
- `hizmetlerimiz/su-aritma-sistemleri.mdx` — reference for CardGroup/Card syntax
- `hizmetlerimiz/akilli-oda-termostatlari.mdx` — reference for Nobo service page (contains Nobo Card reference)
- `hizmetlerimiz/radyator.mdx` — reference for Radyal service page (contains Radyal Card reference)
- `hizmetlerimiz/sulama-sistemleri.mdx` — reference for Rain Bird service page (contains Rain Bird reference)
- `custom.css` — CSS for `.service-header-image`, `.link-card`, `.link-card.featured`, `.badge`, `.link-card-content` classes (up to line 80)

## File Scope

- `markalar/aqualine.mdx` (modified)
- `markalar/nobo.mdx` (modified)
- `markalar/radyal.mdx` (modified — CRITICAL: title fix)
- `markalar/rain-bird.mdx` (modified)

## Steps

### Step 0: Preflight

- [ ] All 4 target `.mdx` files exist under `markalar/`
- [ ] Verify current byte counts: `wc -c markalar/aqualine.mdx markalar/nobo.mdx markalar/radyal.mdx markalar/rain-bird.mdx` — confirm each is < 1200 bytes (current short state)
- [ ] Verify `images/yerden-isitma/` directory has at least 12 images (002 through 011, header_001, yerden-isitma-insaat.jpg)
- [ ] Verify the following service `.mdx` files exist (for Card href verification):

| Service slug | File path |
|---|---|
| su-aritma-sistemleri | `hizmetlerimiz/su-aritma-sistemleri.mdx` |
| akilli-oda-termostatlari | `hizmetlerimiz/akilli-oda-termostatlari.mdx` |
| radyator | `hizmetlerimiz/radyator.mdx` |
| sulama-sistemleri | `hizmetlerimiz/sulama-sistemleri.mdx` |
| pompalar | `hizmetlerimiz/pompalar.mdx` |
| hidrofor-sistemleri | `hizmetlerimiz/hidrofor-sistemleri.mdx` |
| yerden-isitma-sistemleri | `hizmetlerimiz/yerden-isitma-sistemleri.mdx` |
| mekanik-sihhi-tesisat | `hizmetlerimiz/mekanik-sihhi-tesisat.mdx` |
| isi-pompalari | `hizmetlerimiz/isi-pompalari.mdx` |

- [ ] Read FN-019 PROMPT.md (via `fn_task_get`) to understand the CardGroup/Card approximation and external link-card convention

### Step 1: Enrich aqualine.mdx

Transform `markalar/aqualine.mdx` from its current short state (~870 bytes) into a full enriched page (≥2000 bytes).

**Current state:** Has frontmatter (title + description), H1 heading, one short paragraph, and a `## Hizmetler` section with one Card linking to su-aritma-sistemleri.

**Required structure (in order):**

1. **Header image** — After H1, before the first paragraph:
   ```html
   <div class="service-header-image">
     <img src="/images/yerden-isitma/008_gul-tekin-muhendislik.jpg" alt="Aqualine Su Arıtma Sistemleri" />
   </div>
   ```

2. **Keep existing opening paragraph** — The paragraph starting "Aqualine, Pollet Water Group'un bir parçası olarak..."

3. **Replace the existing `## Hizmetler` CardGroup** section with a richer set of sections. Remove the old `## Hizmetler` + CardGroup entirely. Add these new sections:

   **`## Hakkında`** — A detailed section (2-3 paragraphs minimum) covering:
   - Aqualine's founding context (part of Pollet Water Group, established by ESLI in Turkey, expanded to Middle East)
   - Headquarters (Türkiye / Orta Doğu bölgesel operasyon)
   - Sector position (water and wastewater treatment leader, serving industrial/ commercial/ medical/ residential)

   **`## Ürün Grupları`** — Detailed bulleted list with sub-headings:

   ```markdown
   ### Ters Osmoz (Reverse Osmosis) Sistemleri
   - ... (2-3 sentence explanation of RO technology, applications)
   
   ### Filtrasyon Sistemleri
   - ... (2-3 sentences about sediment, carbon, multimedia filtration)
   
   ### Endüstriyel Su Arıtma Tesisleri
   - ... (2-3 sentences about large-scale treatment plants)
   
   ### Medikal Su Sistemleri
   - ... (2-3 sentences about pure/ultrapure water for medical use)
   
   ### Evsel Su Arıtma Çözümleri
   - ... (2-3 sentences about home water treatment)
   ```

   **`## Gül-tekin Mühendislik ile İlişkimiz`** — Paragraph explaining:
   - Gül-Tekin Mühendislik's partnership with Aqualine
   - Which Aqualine products are used in Bodrum projects
   - What services these products relate to (water treatment, pumping, hydrofor)

   **`## Bodrum'da Aqualine Uygulamaları`** — Paragraph with:
   - Specific Bodrum locations/neighborhoods (Yalıkavak, Gümüşlük, Göltürkbükü, Bitez, Konacık, Türkbükü)
   - Types of projects (villa su arıtma, residential complexes)
   - Value provided (water quality improvement, descaling, safe drinking water)

   **`## İlgili Hizmetlerimiz`** — CardGroup with Mintlify Cards:
   ```markdown
   <CardGroup>
     <Card title="Su Arıtma Sistemleri" href="/hizmetlerimiz/su-aritma-sistemleri"></Card>
     <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
     <Card title="Hidrofor Sistemleri" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
   </CardGroup>
   ```

   **`## 🌟 Su Arıtma Hizmetlerimiz`** — External link-card:
   ```markdown
   <a href="https://su-aritma.gul-tekinmuhendislik.com/" target="_blank" rel="noopener noreferrer" class="link-card featured">
     <div class="link-card-content">
       <span class="badge">ÖNE ÇIKAN</span>
       <h3>Su Arıtma Sistemleri</h3>
       <p>Aqualine marka su arıtma sistemleri kurulumu, bakımı ve onarımı hizmetlerimiz için özel sitemizi ziyaret edin.</p>
       <span class="link-card-cta">Yeni Pencerede Aç →</span>
     </div>
   </a>
   ```

- [ ] Write all content for aqualine.mdx per the structure above
- [ ] Ensure total file size is ≥ 2000 bytes (`wc -c markalar/aqualine.mdx`)
- [ ] Verify all Card href values point to existing files under `hizmetlerimiz/`
- [ ] Verify no unclosed HTML tags, valid MDX syntax

**Artifacts:**
- `markalar/aqualine.mdx` (modified)

### Step 2: Enrich nobo.mdx

Transform `markalar/nobo.mdx` from current short state (~870 bytes) to ≥2000 bytes.

**Current state:** Has frontmatter, H1, one short paragraph, and NO Hizmetler CardGroup section.

**Required structure (in order):**

1. **Header image** — After H1:
   ```html
   <div class="service-header-image">
     <img src="/images/yerden-isitma/007_gul-tekin-muhendislik.jpg" alt="Nobo Elektrikli Isıtıcılar" />
   </div>
   ```

2. **Keep existing opening paragraph**

3. **`## Hakkında`** — 2-3 paragraphs covering:
   - Nobo's Norwegian origin (Norge — Norveç)
   - Establishment history (1918 as a company, electric heating from 1940s onwards — use general Nobo history context)
   - Headquarters (Norway, with European operations)
   - Sector position (leader in electric convection heating, known for energy efficiency, safety, design)

   **`## Ürün Grupları`** — Detailed bulleted list:

   ```markdown
   ### Elektrikli Konvektör Isıtıcılar
   - ... (2-3 sentences about natural convection, silent operation, wall-mounted/freestanding)
   
   ### Akıllı Termostat Teknolojisi
   - ... (2-3 sentences about precision temperature control, energy optimization)
   
   ### Nobo Energy Control (NEC) Sistemleri
   - ... (2-3 sentences about central control, scheduling, energy management)
   
   ### Nobo Safety Series
   - ... (2-3 sentences about safety features: overheat protection, cool-touch surfaces)
   ```

   **`## Gül-tekin Mühendislik ile İlişkimiz`** — Paragraph explaining:
   - How Gül-Tekin Mühendislik uses Nobo products in Bodrum projects
   - Context: supplemental heating, spaces without central heating, smart temperature control
   - Relationship between electric heaters and smart thermostat systems

   **`## Bodrum'da Nobo Uygulamaları`** — Paragraph with:
   - Villa projects, residential applications
   - Locations: Yalıkavak, Gümüşlük, Göltürkbükü, Bitez, Konacık, Türkbükü
   - Benefits in Bodrum's climate: supplementary heating for cooler months, zoned temperature control

   **`## İlgili Hizmetlerimiz`** — CardGroup:
   ```markdown
   <CardGroup>
     <Card title="Akıllı Oda Termostatları" href="/hizmetlerimiz/akilli-oda-termostatlari"></Card>
     <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
   </CardGroup>
   ```

   **`## 🌟 Akıllı Isıtma Hizmetlerimiz`** — External link-card:
   ```markdown
   <a href="https://akilli-isitma.gul-tekinmuhendislik.com/" target="_blank" rel="noopener noreferrer" class="link-card featured">
     <div class="link-card-content">
       <span class="badge">ÖNE ÇIKAN</span>
       <h3>Akıllı Isıtma Sistemleri</h3>
       <p>Nobo marka akıllı ısıtma sistemleri kurulumu, bakımı ve onarımı hizmetlerimiz için özel sitemizi ziyaret edin.</p>
       <span class="link-card-cta">Yeni Pencerede Aç →</span>
     </div>
   </a>
   ```

- [ ] Write all content for nobo.mdx per the structure above
- [ ] Ensure total file size is ≥ 2000 bytes
- [ ] Verify all Card href values point to existing files

**Artifacts:**
- `markalar/nobo.mdx` (modified)

### Step 3: Enrich radyal.mdx — CRITICAL: Fix Title

Transform `markalar/radyal.mdx` from current short state (~910 bytes) to ≥2000 bytes.

**CRITICAL FIX:** The frontmatter title and H1 heading currently say `"Radyal Vanalar ve Pompa Sistemleri"` but the product description correctly describes aluminum radiators and towel warmers. Fix both:

- **Frontmatter `title:`** → `"Radyal Alüminyum Radyatör ve Havlupan Sistemleri"`
- **`#` H1 heading** → `# Radyal Alüminyum Radyatör ve Havlupan Sistemleri`
- **The `description:` in frontmatter** correctly describes aluminum radiators — keep it, but remove any reference to "vana/pompa" if present. The current description says: `"Radyal, modern ve estetik tasarımlı alüminyum radyatör ve havlupan üretimi yapan bir markadır."` — this is correct, keep it.

**Required structure (in order):**

1. **Header image** — After H1:
   ```html
   <div class="service-header-image">
     <img src="/images/yerden-isitma/004_gul-tekin-muhendislik.jpg" alt="Radyal Alüminyum Radyatör ve Havlupan" />
   </div>
   ```

2. **Keep existing opening paragraph** — The paragraph starting "Radyal, modern ve estetik tasarımlı alüminyum radyatör..."

3. **`## Hakkında`** — 2-3 paragraphs covering:
   - Radyal's focus on aluminum radiator and towel warmer manufacturing
   - Market position (specialist in modern/designer aluminum radiators in Turkey)
   - Manufacturing approach (high-quality aluminum, advanced casting/extrusion)

   **`## Ürün Grupları`** — Detailed bulleted list:

   ```markdown
   ### Alüminyum Radyatörler
   - ... (2-3 sentences about high thermal conductivity, quick heat-up, energy efficiency)
   
   ### Havlupan (Towel Warmers)
   - ... (2-3 sentences about bathroom heating, towel drying, aesthetic designs)
   
   ### Dikey ve Yatay Tasarım Radyatörler
   - ... (2-3 sentences about space-saving vertical models, classic horizontal options)
   
   ### Özel Tasarım ve Proje Bazlı Çözümler
   - ... (2-3 sentences about custom sizes/colors, large project capabilities)
   ```

   **`## Gül-tekin Mühendislik ile İlişkimiz`** — Paragraph explaining:
   - Gül-Tekin Mühendislik's use of Radyal products in Bodrum heating projects
   - Radiator systems for villas and residential buildings
   - Integration with heat pump and underfloor heating systems

   **`## Bodrum'da Radyal Uygulamaları`** — Paragraph with:
   - Villa and residence heating projects
   - Locations: Yalıkavak, Gümüşlük, Göltürkbükü, Bitez, Konacık, Türkbükü
   - Aesthetic benefits — modern radiator designs for contemporary architecture

   **`## İlgili Hizmetlerimiz`** — CardGroup:
   ```markdown
   <CardGroup>
     <Card title="Radyatör Sistemleri" href="/hizmetlerimiz/radyator"></Card>
     <Card title="Yerden Isıtma Sistemleri" href="/hizmetlerimiz/yerden-isitma-sistemleri"></Card>
     <Card title="Mekanik Sıhhi Tesisat" href="/hizmetlerimiz/mekanik-sihhi-tesisat"></Card>
   </CardGroup>
   ```

   **`## 🌟 Radyatör Hizmetlerimiz`** — External link-card:
   ```markdown
   <a href="https://radyator.gul-tekinmuhendislik.com/" target="_blank" rel="noopener noreferrer" class="link-card featured">
     <div class="link-card-content">
       <span class="badge">ÖNE ÇIKAN</span>
       <h3>Radyatör Sistemleri</h3>
       <p>Radyal marka alüminyum radyatör ve havlupan sistemleri kurulumu, bakımı ve onarımı hizmetlerimiz için özel sitemizi ziyaret edin.</p>
       <span class="link-card-cta">Yeni Pencerede Aç →</span>
     </div>
   </a>
   ```

- [ ] Verify frontmatter title changed from `"Radyal Vanalar ve Pompa Sistemleri"` to `"Radyal Alüminyum Radyatör ve Havlupan Sistemleri"`
- [ ] Verify H1 heading changed from `# Radyal Vanalar ve Pompa Sistemleri` to `# Radyal Alüminyum Radyatör ve Havlupan Sistemleri`
- [ ] Verify no remaining references to "vana" or "pompa" in title or heading (the existing paragraph/description text should still be correct)
- [ ] Write all content for radyal.mdx per the structure above
- [ ] Ensure total file size is ≥ 2000 bytes
- [ ] Verify all Card href values point to existing files

**Artifacts:**
- `markalar/radyal.mdx` (modified — includes title fix)

### Step 4: Enrich rain-bird.mdx

Transform `markalar/rain-bird.mdx` from current short state (~950 bytes) to ≥2000 bytes.

**Current state:** Has frontmatter, H1, one short paragraph with brand introduction, and NO Hizmetler CardGroup section.

**Required structure (in order):**

1. **Header image** — After H1:
   ```html
   <div class="service-header-image">
     <img src="/images/yerden-isitma/011_gul-tekin-muhendislik.jpg" alt="Rain Bird Sulama Sistemleri" />
   </div>
   ```

2. **Keep existing opening paragraph** — The paragraph starting "Rain Bird, 1933 yılında kurulmuş..."

3. **`## Hakkında`** — 2-3 paragraphs covering:
   - Rain Bird's establishment (1933, founded by orchardist Clemmons and La Fetra in California)
   - Headquarters (Azusa, California, USA — global operations)
   - Sector position (world leader in irrigation products, "The Intelligent Use of Water™")
   - The impact sprinkler invention and history of innovation

   **`## Ürün Grupları`** — Detailed bulleted list:

   ```markdown
   ### Pop-up Sprinkler Sistemleri
   - ... (2-3 sentences about residential/commercial pop-up sprinklers, spray patterns)
   
   ### Rotor Sistemleri
   - ... (2-3 sentences about large-area rotors, golf courses, sports fields, parks)
   
   ### Damla Sulama Sistemleri
   - ... (2-3 sentences about drip irrigation, water conservation, precise root-zone watering)
   
   ### Vanalar ve Kontrol Üniteleri
   - ... (2-3 sentences about solenoid valves, smart controllers, WiFi-enabled timers)
   
   ### Tarımsal Sulama Çözümleri
   - ... (2-3 sentences about agricultural irrigation, pivot systems, big guns)
   ```

   **`## Gül-tekin Mühendislik ile İlişkimiz`** — Paragraph explaining:
   - Gül-Tekin Mühendislik's use of Rain Bird products in Bodrum landscape/irrigation projects
   - Types of systems installed (sprinkler, rotor, drip irrigation for villa gardens)
   - Water efficiency and conservation focus in Bodrum's Mediterranean climate

   **`## Bodrum'da Rain Bird Uygulamaları`** — Paragraph with:
   - Villa landscape irrigation, garden automation projects
   - Locations: Yalıkavak, Gümüşlük, Göltürkbükü, Bitez, Konacık, Türkbükü
   - Benefits: smart watering schedules, water savings, remote control via smart controllers

   **`## İlgili Hizmetlerimiz`** — CardGroup:
   ```markdown
   <CardGroup>
     <Card title="Sulama Sistemleri" href="/hizmetlerimiz/sulama-sistemleri"></Card>
     <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
     <Card title="Hidrofor Sistemleri" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
   </CardGroup>
   ```

   **`## 🌟 Sulama Hizmetlerimiz`** — External link-card:
   ```markdown
   <a href="https://sulama.gul-tekinmuhendislik.com/" target="_blank" rel="noopener noreferrer" class="link-card featured">
     <div class="link-card-content">
       <span class="badge">ÖNE ÇIKAN</span>
       <h3>Sulama Sistemleri</h3>
       <p>Rain Bird marka sulama sistemleri kurulumu, bakımı ve onarımı hizmetlerimiz için özel sitemizi ziyaret edin.</p>
       <span class="link-card-cta">Yeni Pencerede Aç →</span>
     </div>
   </a>
   ```

- [ ] Write all content for rain-bird.mdx per the structure above
- [ ] Ensure total file size is ≥ 2000 bytes
- [ ] Verify all Card href values point to existing files

**Artifacts:**
- `markalar/rain-bird.mdx` (modified)

### Step 5: Testing & Verification

> ZERO test failures allowed. Full quality gate.
> If keeping lint/tests/build green requires edits outside the initial File Scope, make those fixes as part of this task.

- [ ] **Byte count verification:** `wc -c markalar/aqualine.mdx markalar/nobo.mdx markalar/radyal.mdx markalar/rain-bird.mdx` — confirm ALL 4 files are ≥ 2000 bytes
- [ ] **Title fix verification (radyal):** Read `markalar/radyal.mdx` lines 1-10 — confirm frontmatter `title:` is `"Radyal Alüminyum Radyatör ve Havlupan Sistemleri"` and H1 heading matches. Confirm no "Vanalar" or "Pompa" remains in title/heading
- [ ] **MDX syntax verification for all 4 files:**
  - Frontmatter YAML is properly wrapped in `---` delimiters
  - No unclosed HTML tags: `<div>`, `<img>`, `<CardGroup>`, `<Card>`, `<a>`, `<span>`, `<h3>`
  - All `<CardGroup>` has a matching `</CardGroup>` closing tag
  - All `<Card>` tags are self-closing (`<Card ... />`)
  - Header image `<div class="service-header-image">` is properly closed
  - External link-card `<a>` tags have matching `</a>` closing tags
- [ ] **Link verification for all 4 files:** Extract all `href` values — every internal `/hizmetlerimiz/...` path must point to an existing `.mdx` file
- [ ] **External link-card structure verification:** Each `class="link-card featured"` must have: `.badge`, `h3`, `p`, `.link-card-cta` inside `.link-card-content`
- [ ] **No regressions:** Verify existing content was preserved (opening paragraphs, frontmatter description) — only expanded, not deleted or truncated
- [ ] Fix all failures — if fixes require editing outside the declared File Scope, make those fixes anyway

### Step 6: Documentation & Delivery

- [ ] Save documentation deliverables as task document:
  ```markdown
  # FN-025 — KISA MARKALAR Grup A: Enrichment Summary
  
  ## Enriched Pages
  | Page | Byte count | ≥2000? | Sections added |
  |---|---|---|---|
  | markalar/aqualine.mdx | {size} | {pass/fail} | Header image, Hakkında, Ürün Grupları, İlişkimiz, Bodrum Uyg., İlgili Hizmetler, 🌟 link-card |
  | markalar/nobo.mdx | {size} | {pass/fail} | Header image, Hakkında, Ürün Grupları, İlişkimiz, Bodrum Uyg., İlgili Hizmetler, 🌟 link-card |
  | markalar/radyal.mdx | {size} | {pass/fail} | Title fix applied, Header image, Hakkında, Ürün Grupları, İlişkimiz, Bodrum Uyg., İlgili Hizmetler, 🌟 link-card |
  | markalar/rain-bird.mdx | {size} | {pass/fail} | Header image, Hakkında, Ürün Grupları, İlişkimiz, Bodrum Uyg., İlgili Hizmetler, 🌟 link-card |
  
  ## Radyal Title Fix
  - [x] Title changed from "Radyal Vanalar ve Pompa Sistemleri" → "Radyal Alüminyum Radyatör ve Havlupan Sistemleri"
  
  ## CardGroup Links
  | Page | Cards |
  |---|---|
  | aqualine | Su Arıtma Sistemleri, Pompalar, Hidrofor Sistemleri |
  | nobo | Akıllı Oda Termostatları, Isı Pompaları |
  | radyal | Radyatör Sistemleri, Yerden Isıtma Sistemleri, Mekanik Sıhhi Tesisat |
  | rain-bird | Sulama Sistemleri, Pompalar, Hidrofor Sistemleri |
  
  ## MDX Syntax & Links
  - [ ] All 4 files have valid MDX syntax
  - [ ] All Card href values verified against existing files
  - [ ] All external link-cards have proper structure
  
  ## Issues
  {none or list any issues found}
  ```
- [ ] Create any out-of-scope findings as new tasks via `fn_task_create`

## Documentation Requirements

**Must Update:**
- None — this is content creation only; documentation summary saved as task document

**Check If Affected:**
- `markalar.mdx` — check if the index page lists all 4 brand slugs; they should already be listed
- `docs.json` — check if all 4 brand slugs appear in the navigation tree under "Ana Menü > Tüm Markalar" (aqualine, nobo, radyal, rain-bird should already be present)

## Completion Criteria

- [ ] All 4 brand `.mdx` files are ≥ 2000 bytes
- [ ] Radyal title fixed from "Radyal Vanalar ve Pompa Sistemleri" → "Radyal Alüminyum Radyatör ve Havlupan Sistemleri" (frontmatter + H1)
- [ ] Each page has: Header image, Hakkında, Ürün Grupları, Gül-tekin Mühendislik ile İlişkimiz, Bodrum'da {Brand} Uygulamaları, İlgili Hizmetlerimiz (CardGroup), and 🌟 external link-card
- [ ] All CardGroup/Card tags properly closed — valid MDX
- [ ] All Card href values point to existing `/hizmetlerimiz/...` service pages
- [ ] All external link-cards follow the established `class="link-card featured"` pattern with `.badge`, `.link-card-content`, `.link-card-cta`
- [ ] Documentation summary saved via `fn_task_document_write(key="docs")`

## Section Content Quality Guidelines

Write content that is factually accurate and specific. Each section should be informative, not generic.

**Hakkında:** Include specific founding dates, locations, and market position details. For Rain Bird, mention the 1933 founding and "The Intelligent Use of Water™" philosophy. For Nobo, mention Norwegian heritage and 1918 founding. For Aqualine, mention Pollet Water Group partnership. For Radyal, focus on aluminum radiator expertise.

**Ürün Grupları:** Each bulleted group must have 2-3 complete sentences of substantive description — not just labels. Explain what the product does, its key technology, and typical applications.

**Gül-tekin Mühendislik ile İlişkimiz:** Write a genuine paragraph about how the brand's products relate to Gül-Tekin's services in Bodrum. Include specific product types used and how they benefit Bodrum clients. This is not marketing fluff — describe actual application areas.

**Bodrum'da {Brand} Uygulamaları:** Include specific Bodrum neighborhoods (Yalıkavak, Gümüşlük, Göltürkbükü, Bitez, Konacık, Türkbükü), types of projects (villa, residence, commercial), and the specific benefits the brand's products provide in Bodrum's climate/conditions.

**İlgili Hizmetlerimiz (CardGroup):** Use `<Card title="..." href="..."></Card>` format. No `icon` attribute (per project convention from FN-019).

**External link-card sections:** Follow the exact HTML structure from existing pages (grundfos.mdx, baymak.mdx). The external URLs use the convention `https://{slug}.gul-tekinmuhendislik.com/`.

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-025): complete Step N — {brand} enrichment`
- **Bug fixes:** `fix(FN-025): description`
- **Final commit:** `feat(FN-025): enrich 4 brand pages — aqualine, nobo, radyal (title fix), rain-bird`

## Do NOT

- Leave the "Radyal Vanalar ve Pompa Sistemleri" title unfixed
- Delete or truncate any existing content from the pages — only expand
- Use `<Card icon="...">` — omit the icon attribute per project convention
- Create broken internal links — every `/hizmetlerimiz/...` href must point to an existing file
- Write generic or placeholder content — each section must be substantive (≥2-3 sentences)
- Remove, delete, or gut modules, settings, interfaces, exports, or test files outside the File Scope
- Commit without the task ID prefix
- Skip MDX syntax validation (unclosed tags break the Mintlify build)

## Changeset Requirements

No changeset needed — this task only ADDS content to existing brand pages (plus a title text fix for radyal). No functionality is removed.
