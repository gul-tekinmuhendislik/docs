# Task: FN-026 — KISA MARKALAR - Grup B: sanihydro, sukar, tekneciler, vitra

**Created:** 2026-05-26
**Size:** M

## Review Level: 1 (Plan Only)

**Assessment:** Content enrichment task for 4 brand pages in `markalar/`, each currently ~870–990 bytes, needing expansion to ≥2000 bytes. Adds header images, structured sections, and Mintlify CardGroup service links. Pattern is well-established (see grundfos.mdx, rehau.mdx), no new functionality, no data risk.
**Score:** 2/8 — Blast radius: 1, Pattern novelty: 0, Security: 0, Reversibility: 1

## Mission

Enrich 4 short brand pages (`sanihydro.mdx`, `sukar.mdx`, `tekneciler.mdx`, `vitra.mdx`) from their current ~870–990 bytes to ≥2000 bytes each. Each page needs: a `service-header-image` from the existing `images/yerden-isitma/` directory, a structured `## Hakkında` section with kuruluş yılı/merkez/sektör pozisyonu, a detailed `## Ürün Grupları` bullet list, a `## Gül-tekin Mühendislik ile İlişkimiz` paragraph referencing Bodrum project usage, a `## Hizmetler` section with `<CardGroup>` / `<Card>` components linking to relevant service pages, and (where applicable) a `## 🌟 ... Hizmetlerimiz` external link-card section. This completes the Group B slice of the KISA MARKALAR enrichment effort, unblocking FN-022 (cross-cutting verification) and ultimately FN-016 (quality control for all 47 brand pages).

## Dependencies

- **None** — all 4 target files already exist under `markalar/`, all referenced service pages exist under `hizmetlerimiz/`, all 12 image files exist under `images/yerden-isitma/`

## Context to Read First

- `markalar/grundfos.mdx` — reference for enriched brand page with header image, structured sections, external link-cards
- `markalar/rehau.mdx` — reference showing a complete enriched page with all section types (header image, CardGroup, external link-cards)
- `markalar/baymak.mdx` — reference showing Hakkında + Hizmetler (CardGroup) + Ürün Grupları + external link-card pattern
- `hizmetlerimiz/yerden-isitma-sistemleri.mdx` — reference for `<CardGroup>` / `<Card>` syntax (lines 8-14)
- `custom.css` — existing CSS classes (`.link-card`, `.link-card.featured`, `.badge`) — verify then close
- `docs.json` lines 72-75 — confirm all 4 brand slugs are registered under "Tüm Markalar" group
- Current state of each target file (read all 4 before starting)

## File Scope

- `markalar/sanihydro.mdx` (modified)
- `markalar/sukar.mdx` (modified)
- `markalar/tekneciler.mdx` (modified)
- `markalar/vitra.mdx` (modified)

## Steps

### Step 0: Preflight

- [ ] Verify all 4 target `.mdx` files exist under `markalar/`
- [ ] Verify all 12 images exist under `images/yerden-isitma/` (002.jpg through 011.jpg, header_001.jpg, yerden-isitma-insaat.jpg)
- [ ] Verify all service pages referenced in this spec exist under `hizmetlerimiz/`:
  - `tahliye-istasyonu.mdx`, `mekanik-sihhi-tesisat.mdx`, `pompalar.mdx`, `su-depolari.mdx`, `yerden-isitma-sistemleri.mdx`, `radyator.mdx`
- [ ] Read all 4 target files to confirm their current state before editing
- [ ] Run `wc -c markalar/sanihydro.mdx markalar/sukar.mdx markalar/tekneciler.mdx markalar/vitra.mdx` and record baseline byte counts
- [ ] Read `docs.json` and verify all 4 slugs are listed under "Tüm Markalar" group — confirm `sanihydro`, `sukar`, `tekneciler`, `vitra` are present

### Step 1: sanihydro.mdx — Enrich

> **Background:** Sanihydro is SFA Group's brand specializing in waste water pumps, WC grinders, grey water pumps, condensate pumps. Related services: tahliye-istasyonu, mekanik-sihhi-tesisat, pompalar. No external microsite exists for tahliye-istasyonu — skip the `## 🌟` external link-card section for this page.

**Action:** Rewrite `markalar/sanihydro.mdx` with the following structure (minimize deletions from existing useful content):

1. **Frontmatter:** Keep existing `title:` and `description:` intact. Update `description:` only if the existing one is under 120 chars (current one is fine).
2. **H1:** Keep `# Sanihydro Atık Su Pompaları` 
3. **Header image:** Immediately after the H1 line, add:
   ```
   <div class="service-header-image">
     <img src="/images/yerden-isitma/008_gul-tekin-muhendislik.jpg" alt="Sanihydro Atık Su Pompa Sistemleri" />
   </div>
   ```
4. **Introduction paragraph:** Expand the existing first paragraph. It should include:
   - Sanihydro = SFA Group markası (keep existing)
   - Atık su ve tahliye pompaları konusunda uzmanlaşmıştır (keep existing)
   - **Add:** Merkez ofisi, SFA Group'un merkezi (Fransa/Paris merkezli olarak eklenebilir veya üretim/Germany bağlantısı — SFA Group hakkında doğru bilgi)
   - Sektör pozisyonu: atık su pompalama çözümlerinde Avrupa liderlerinden
   - Keep the existing "Gül-Tekin Mühendislik ..." closing sentence (update to mention Bodrum projeleri)
5. **## Hakkında** — Add after the intro paragraph with 3-5 sentences covering kuruluş bağlamı, merkez, sektör pozisyonu
6. **## Ürün Grupları** — Bulleted list with each product group having 1-2 description sentences:
   - **WC Grinder (Tuvalet Öğütücü) Pompaları** — Standart drenajın olmadığı yerlerde tuvalet kurulumu için
   - **Gri Su Pompaları** — Lavabo, duş, mutfak gibi gri su kaynaklarının tahliyesi
   - **Yoğuşma Suyu Pompaları** — Kombi, klima gibi cihazların yoğuşma suyunu tahliye eder
   - **Yağmur Suyu Pompaları** — Bodrum ve bahçe drenajı için
   - **Endüstriyel Atık Su Pompaları** — Ticari mutfak ve işletmeler için
7. **## Gül-tekin Mühendislik ile İlişkimiz** — 4-6 sentences explaining:
   - Hangi Sanihydro ürünlerini Bodrum'daki projelerde kullandığımız
   - Bodrum'daki villa/bina projelerinde tahliye istasyonu çözümleri
   - Mekanik sıhhi tesisat hizmetlerimiz kapsamında Sanihydro entegrasyonu
8. **## Hizmetler** — CardGroup section:
   ```
   ## Hizmetler

   <CardGroup>
     <Card title="Tahliye İstasyonu" href="/hizmetlerimiz/tahliye-istasyonu"></Card>
     <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
     <Card title="Mekanik Sıhhi Tesisat" href="/hizmetlerimiz/mekanik-sihhi-tesisat"></Card>
   </CardGroup>
   ```
9. **No external link-card section** — skip `## 🌟` for sanihydro (no relevant external microsite)

- [ ] Read the current file and plan the full rewrite
- [ ] Write the enriched content (verify byte count ≥ 2000 with `wc -c`)
- [ ] Run `wc -c markalar/sanihydro.mdx` and record the size

**Artifacts:**
- `markalar/sanihydro.mdx` (modified)

### Step 2: sukar.mdx — Enrich (with title fix)

> **Background:** Sukar was founded in 1998, manufactures drainage strainers/filters (süzgeç), has the Kokumatik patented system. The current TITLE "Sukar Su Depoları ve Tanklar" is MISLEADING — the description correctly says "tesisat ve yalıtım süzgeçleri". Fix the title to reflect the actual product focus. Related services: mekanik-sihhi-tesisat, su-depolari, tahliye-istasyonu. External microsite available: su-deposu.gul-tekinmuhendislik.com.

**Action:** Rewrite `markalar/sukar.mdx` with the following structure:

1. **Frontmatter:**
   - **CRITICAL:** Change `title:` from `"Sukar Su Depoları ve Tanklar"` to `"Sukar Tesisat ve Yalıtım Süzgeçleri"`
   - Keep `description:` as-is (it correctly says "tesisat ve yalıtım süzgeçleri üreticisidir")
2. **H1:** Change from `# ...` (no H1 currently) to `# Sukar Tesisat ve Yalıtım Süzgeçleri`
3. **Header image:** After the H1:
   ```
   <div class="service-header-image">
     <img src="/images/yerden-isitma/005_gul-tekin-muhendislik.jpg" alt="Sukar Drenaj Sistemleri" />
   </div>
   ```
4. **Introduction paragraph:** Expand the existing first paragraph. It should include:
   - Keep: 1998 yılında kurulmuş, %100 Türk sermayeli, tesisat ve yalıtım süzgeçleri üreticisi
   - Keep: Banyo, mutfak, teras, otopark, havuz için drenaj çözümleri
   - Keep: 200'den fazla ürün çeşidi
   - **Add:** Merkez (İstanbul veya üretim tesisi bilgisi)
   - **Add:** Sektör pozisyonu (Türkiye'de drenaj süzgeçleri alanında lider)
   - Keep: Kokumatik patent, 304 paslanmaz çelik, 5 yıl garanti
   - Keep: "Gül-Tekin Mühendislik ..." closing sentence (update to mention Bodrum projeleri)
5. **## Hakkında** — 3-5 sentences with kuruluş yılı (1998), merkez, sektör pozisyonu
6. **## Ürün Grupları** — Bulleted list:
   - **Kokumatik Kokusuz Süzgeç Sistemleri** — Patentli teknoloji ile koku ve böcek girişini engeller
   - **Paslanmaz Çelik Yer Süzgeçleri** — 304 kalite malzeme ile uzun ömürlü kullanım
   - **Banyo ve Duş Süzgeçleri** — Estetik tasarımlı, hijyenik drenaj çözümleri
   - **Teras ve Balkon Süzgeçleri** — Dış mekan drenajı için dayanıklı modeller
   - **Otopark ve Yol Süzgeçleri** — Ağır yük dayanımlı endüstriyel drenaj sistemleri
7. **## Gül-tekin Mühendislik ile İlişkimiz** — 4-6 sentences explaining Sukar ürünlerinin Bodrum projelerinde kullanımı, mekanik sıhhi tesisat hizmetleri kapsamındaki yeri, su deposu sistemleriyle entegrasyonu
8. **## Hizmetler** — CardGroup section:
   ```
   ## Hizmetler

   <CardGroup>
     <Card title="Mekanik Sıhhi Tesisat" href="/hizmetlerimiz/mekanik-sihhi-tesisat"></Card>
     <Card title="Su Depoları" href="/hizmetlerimiz/su-depolari"></Card>
     <Card title="Tahliye İstasyonu" href="/hizmetlerimiz/tahliye-istasyonu"></Card>
   </CardGroup>
   ```
9. **External link-card** — Add AFTER the CardGroup section:
   ```
   ## 🌟 Su Deposu Hizmetlerimiz

   <a href="https://su-deposu.gul-tekinmuhendislik.com/" target="_blank" rel="noopener noreferrer" class="link-card featured">
     <div class="link-card-content">
       <span class="badge">ÖNE ÇIKAN</span>
       <h3>Su Deposu Sistemleri</h3>
       <p>Sukar ürünleri ile entegre su deposu sistemleri kurulumu, bakımı ve onarımı hizmetlerimiz için özel sitemizi ziyaret edin.</p>
       <span class="link-card-cta">Yeni Pencerede Aç →</span>
     </div>
   </a>
   ```

- [ ] Verify the title fix was applied correctly in both frontmatter and H1
- [ ] Write the enriched content (verify byte count ≥ 2000)
- [ ] Run `wc -c markalar/sukar.mdx` and record the size

**Artifacts:**
- `markalar/sukar.mdx` (modified)

### Step 3: tekneciler.mdx — Enrich

> **Background:** TDS Tekneciler Metal (1993), tesisat ve yerden ısıtma sistemleri, kollektörler, radyatör vanaları, 30+ ülkeye ihracat. Related services: yerden-isitma-sistemleri, mekanik-sihhi-tesisat, radyator. External microsite available: yerden-isitma.gul-tekinmuhendislik.com.

**Action:** Rewrite `markalar/tekneciler.mdx` with the following structure:

1. **Frontmatter:** Keep existing `title:` and `description:`. Update if under 120 chars.
2. **H1:** Keep `# Tekneciler Metal Su Depoları` — but consider updating the H1 to match the actual scope. Current title says "Tekneciler Metal Su Depoları" but the brand is about tesisat/yerden ısıtma, not just water tanks. Change H1 to `# Tekneciler Metal Tesisat ve Isıtma Sistemleri` (or similar that better reflects the full product range).
   - Frontmatter `title:` should also be updated to match: `"Tekneciler Metal Tesisat ve Isıtma Sistemleri"`
   - Update `description:` to match.
3. **Header image:** After the H1:
   ```
   <div class="service-header-image">
     <img src="/images/yerden-isitma/002_gul-tekin-muhendislik.jpg" alt="Tekneciler Yerden Isıtma Sistemleri" />
   </div>
   ```
4. **Introduction paragraph:** Expand. Include:
   - Keep: 1993 yılından bu yana, tesisat ve yerden ısıtma, lider firmalardan
   - Keep: Türk sermayesi ve gücü, kollektörler, radyatör vanaları
   - **Add:** Merkez (İstanbul/Türkiye)
   - **Add:** 30'dan fazla ülkeye ihracat vurgusu
   - Keep: "Gül-Tekin Mühendislik ..." closing sentence (update)
5. **## Hakkında** — 3-5 sentences with 1993 kuruluş, merkez, sektör pozisyonu (Türkiye'de tesisat ve yerden ısıtma liderlerinden), ihracat başarısı
6. **## Ürün Grupları** — Bulleted list:
   - **Yerden Isıtma Kolektörleri** — Yüksek kaliteli pirinç/paslanmaz kolektör grupları
   - **Radyatör Vanaları** — Termostatik ve standart vana çözümleri
   - **Isıtma Sistem Bileşenleri** — Genleşme tankları, emniyet grupları, bağlantı elemanları
   - **Sıhhi Tesisat Bileşenleri** — Boru ve ek parçaları, vana grupları
   - **Endüstriyel Ürünler** — Büyük ölçekli tesisat projeleri için bileşenler
7. **## Gül-tekin Mühendislik ile İlişkimiz** — 4-6 sentences explaining Tekneciler ürünlerinin Bodrum'daki yerden ısıtma projelerinde, mekanik tesisat ve radyatör uygulamalarında kullanımı
8. **## Hizmetler** — CardGroup section:
   ```
   ## Hizmetler

   <CardGroup>
     <Card title="Yerden Isıtma Sistemleri" href="/hizmetlerimiz/yerden-isitma-sistemleri"></Card>
     <Card title="Radyatör" href="/hizmetlerimiz/radyator"></Card>
     <Card title="Mekanik Sıhhi Tesisat" href="/hizmetlerimiz/mekanik-sihhi-tesisat"></Card>
   </CardGroup>
   ```
9. **External link-card** — Add AFTER the CardGroup section:
   ```
   ## 🌟 Yerden Isıtma Hizmetlerimiz

   <a href="https://yerden-isitma.gul-tekinmuhendislik.com/" target="_blank" rel="noopener noreferrer" class="link-card featured">
     <div class="link-card-content">
       <span class="badge">ÖNE ÇIKAN</span>
       <h3>Yerden Isıtma Sistemleri</h3>
       <p>Tekneciler marka yerden ısıtma sistemleri kurulumu, bakımı ve onarımı hizmetlerimiz için özel sitemizi ziyaret edin.</p>
       <span class="link-card-cta">Yeni Pencerede Aç →</span>
     </div>
   </a>
   ```

- [ ] Read the current file and plan the rewrite
- [ ] Write the enriched content (verify byte count ≥ 2000)
- [ ] Run `wc -c markalar/tekneciler.mdx` and record the size

**Artifacts:**
- `markalar/tekneciler.mdx` (modified)

### Step 4: vitra.mdx — Enrich

> **Background:** VitrA is an Eczacıbaşı brand, bathroom ceramics (vitrifiye), faucets, bathroom furniture, tiles. Related service: mekanik-sihhi-tesisat. No external microsite directly relevant — skip `## 🌟` for vitra.

**Action:** Rewrite `markalar/vitra.mdx` with the following structure:

1. **Frontmatter:** Keep existing `title:` and `description:` intact. Update if under 120 chars.
2. **H1:** Keep `# VitrA Banyo ve Vitrifiye Ürünleri`
3. **Header image:** After the H1:
   ```
   <div class="service-header-image">
     <img src="/images/yerden-isitma/007_gul-tekin-muhendislik.jpg" alt="VitrA Banyo ve Vitrifiye Ürünleri" />
   </div>
   ```
4. **Introduction paragraph:** Expand. Include:
   - Keep: banyo ve yaşam alanları için yenilikçi çözümler, global marka
   - Keep: vitrifiye, banyo mobilyası, armatür, seramik karo
   - **Add:** Eczacıbaşı Topluluğu çatısı altında faaliyet
   - **Add:** Merkez (İstanbul/Türkiye, Eczacıbaşı)
   - **Add:** Sektör pozisyonu (Türkiye banyo seramik liderlerinden, global ihracat)
   - Keep: "Gül-Tekin Mühendislik ..." closing sentence (update to mention Bodrum projeleri)
5. **## Hakkında** — 3-5 sentences with Eczacıbaşı bağlantısı, merkez, sektör pozisyonu
6. **## Ürün Grupları** — Bulleted list:
   - **Vitrifiye Ürünler** — Klozet, lavabo, bide, rezervuar gibi temel banyo seramikleri
   - **Banyo Mobilyaları** — Estetik ve fonksiyonel tasarımlı dolap ve dolaplar
   - **Armatürler** — Musluk, batarya, duş sistemleri (tek kollu, termostatik)
   - **Seramik Karolar** — Yer ve duvar karoları, çeşitli ebat ve desenlerde
   - **Aksesuarlar** — Havluluk, sabunluk, kağıt tutucu gibi banyo aksesuarları
   - **Akıllı Banyo Çözümleri** — Sensörlü bataryalar, smart klozetler
7. **## Gül-tekin Mühendislik ile İlişkimiz** — 4-6 sentences explaining VitrA ürünlerinin Bodrum'daki villa, otel ve konut projelerinde mekanik sıhhi tesisat hizmetleri kapsamında kullanımı
8. **## Hizmetler** — CardGroup section:
   ```
   ## Hizmetler

   <CardGroup>
     <Card title="Mekanik Sıhhi Tesisat" href="/hizmetlerimiz/mekanik-sihhi-tesisat"></Card>
   </CardGroup>
   ```
9. **No external link-card section** — skip `## 🌟` for vitra (no clearly relevant external microsite)

- [ ] Read the current file and plan the rewrite
- [ ] Write the enriched content (verify byte count ≥ 2000)
- [ ] Run `wc -c markalar/vitra.mdx` and record the size

**Artifacts:**
- `markalar/vitra.mdx` (modified)

### Step 5: Testing & Verification

> ZERO failures allowed. This is a Mintlify documentation site — the quality gate is valid MDX syntax, correct hrefs, and byte count compliance.

- [ ] **Byte count check:** Run `wc -c` on all 4 files. Verify each is ≥ 2000 bytes.
  ```
  wc -c markalar/sanihydro.mdx markalar/sukar.mdx markalar/tekneciler.mdx markalar/vitra.mdx
  ```
- [ ] **Sukar title fix:** Verify `markalar/sukar.mdx` frontmatter `title:` is `"Sukar Tesisat ve Yalıtım Süzgeçleri"` (NOT "Su Depoları ve Tanklar")
- [ ] **Tekneciler title update:** Verify `markalar/tekneciler.mdx` frontmatter `title:` reflects tesisat ve ısıtma systems, not just "Su Depoları"
- [ ] **MDX syntax validation for each file:**
  - Frontmatter YAML is properly wrapped in `---` delimiters
  - All `<CardGroup>` has a matching `</CardGroup>` closing tag
  - All `<Card>` tags are self-closing (`<Card ... />`)
  - The `service-header-image` `<div>` is properly opened and closed
  - External link-card `<a>` tags are properly closed with `</a>`
- [ ] **href validation:** Verify all Card href values point to existing service pages:
  - `sanihydro.mdx`: `/hizmetlerimiz/tahliye-istasyonu`, `/hizmetlerimiz/pompalar`, `/hizmetlerimiz/mekanik-sihhi-tesisat`
  - `sukar.mdx`: `/hizmetlerimiz/mekanik-sihhi-tesisat`, `/hizmetlerimiz/su-depolari`, `/hizmetlerimiz/tahliye-istasyonu`
  - `tekneciler.mdx`: `/hizmetlerimiz/yerden-isitma-sistemleri`, `/hizmetlerimiz/radyator`, `/hizmetlerimiz/mekanik-sihhi-tesisat`
  - `vitra.mdx`: `/hizmetlerimiz/mekanik-sihhi-tesisat`
- [ ] **External link validation:** Verify the external link-card URLs follow the known pattern:
  - `sukar.mdx`: `https://su-deposu.gul-tekinmuhendislik.com/` — ensure URL is accessible-style (no trailing path issues)
  - `tekneciler.mdx`: `https://yerden-isitma.gul-tekinmuhendislik.com/`
- [ ] **Content integrity:** Verify no existing useful content was accidentally removed from any page (kuruluş yılı, patent bilgileri, sektör detayları should all be preserved and expanded, not lost)
- [ ] **Image paths:** Verify all `src` attributes point to `/images/yerden-isitma/XXX_gul-tekin-muhendislik.jpg` and use the correct image numbers
- [ ] If Mintlify CLI is available, verify the site builds without errors (optional — skip if no CLI)
- [ ] Fix all failures — if fixes require editing outside the declared File Scope (e.g., fixing a broken service page href), make those fixes anyway

### Step 6: Documentation & Delivery

- [ ] Save the enrichment summary via `fn_task_document_write(key="docs")`:

```markdown
# FN-026 — KISA MARKALAR Grup B Enrichment Summary

## Enriched Pages

| Brand | File | Size (bytes) | ≥2000? | Title | External Link-Card |
|---|---|---|---|---|---|
| Sanihydro | markalar/sanihydro.mdx | {size} | {pass/fail} | Sanihydro Atık Su Pompaları | None |
| Sukar | markalar/sukar.mdx | {size} | {pass/fail} | Sukar Tesisat ve Yalıtım Süzgeçleri (FIXED) | Su Deposu |
| Tekneciler | markalar/tekneciler.mdx | {size} | {pass/fail} | {corrected title} | Yerden Isıtma |
| VitrA | markalar/vitra.mdx | {size} | {pass/fail} | VitrA Banyo ve Vitrifiye Ürünleri | None |

## Key Changes

### sanihydro
- Added header image (008.jpg)
- Added ## Hakkında section
- Added ## Ürün Grupları with 5 product groups
- Added ## Gül-tekin Mühendislik ile İlişkimiz section
- Added ## Hizmetler CardGroup (tahliye-istasyonu, pompalar, mekanik-sihhi-tesisat)
- No external link-card

### sukar
- CRITICAL: Fixed title from "Sukar Su Depoları ve Tanklar" → "Sukar Tesisat ve Yalıtım Süzgeçleri"
- Added header image (005.jpg)
- Added ## Hakkında section
- Added ## Ürün Grupları with 5 product groups
- Added ## Gül-tekin Mühendislik ile İlişkimiz section
- Added ## Hizmetler CardGroup (mekanik-sihhi-tesisat, su-depolari, tahliye-istasyonu)
- Added ## 🌟 Su Deposu Hizmetlerimiz external link-card

### tekneciler
- Updated title to reflect full scope (tesisat ve ısıtma sistemleri)
- Added header image (002.jpg)
- Added ## Hakkında section
- Added ## Ürün Grupları with 5 product groups
- Added ## Gül-tekin Mühendislik ile İlişkimiz section
- Added ## Hizmetler CardGroup (yerden-isitma-sistemleri, radyator, mekanik-sihhi-tesisat)
- Added ## 🌟 Yerden Isıtma Hizmetlerimiz external link-card

### vitra
- Added header image (007.jpg)
- Added ## Hakkında section
- Added ## Ürün Grupları with 6 product groups
- Added ## Gül-tekin Mühendislik ile İlişkimiz section
- Added ## Hizmetler CardGroup (mekanik-sihhi-tesisat)
- No external link-card

## Verification Results
- All files ≥ 2000 bytes: {pass/fail}
- Sukar title fix correct: {pass/fail}
- All CardGroup/Card tags properly closed: {pass/fail}
- All href targets exist: {pass/fail}
- External link URLs valid: {pass/fail}
```

- [ ] Create any out-of-scope findings as new tasks via `fn_task_create`

## Documentation Requirements

**Must Update:**
- `docs.json` — check if all 4 slugs are still listed under "Tüm Markalar" after editing (they should be — verify no accidental removal)

**Check If Affected:**
- None — content changes only

## Completion Criteria

- [ ] All 4 brand pages enriched to ≥ 2000 bytes
- [ ] Sukar title fixed from "Su Depoları ve Tanklar" to "Tesisat ve Yalıtım Süzgeçleri"
- [ ] Each page has a `service-header-image` div with correct image path
- [ ] Each page has `## Hakkında` with kuruluş yılı, merkez, sektör pozisyonu
- [ ] Each page has `## Ürün Grupları` with detailed bulleted list (min 5 entries)
- [ ] Each page has `## Gül-tekin Mühendislik ile İlişkimiz` with Bodrum project context
- [ ] Each page has `## Hizmetler` with `<CardGroup>` / `<Card>` components and valid hrefs
- [ ] Where applicable, external `## 🌟 ... Hizmetlerimiz` link-card sections added
- [ ] All `<CardGroup>` and `<Card>` tags properly closed — valid MDX syntax
- [ ] Summary saved via `fn_task_document_write`

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-026): complete Step N — {description}`
- **Bug fixes:** `fix(FN-026): {description}`
- **Final commit:** `feat(FN-026): enrich sanihydro, sukar, tekneciler, vitra brand pages`

## Do NOT

- Remove existing useful content (kuruluş bilgileri, patent detayları, sektör referansları)
- Leave the sukar title unfixed — this is CRITICAL per the task spec
- Add `icon` attribute to any `<Card>` component
- Create placeholder or "Lorem ipsum" content — every sentence must be substantive Turkish
- Skip the `## Hizmetler` CardGroup section on any page
- Add an external link-card section where no relevant external microsite exists
- Remove, delete, or gut modules, settings, interfaces, exports, or test files outside the File Scope
- Commit without the task ID prefix

## Changeset Requirements

No changeset needed — this task only ADDS content to existing brand pages and does not remove any existing functionality.
