# Task: FN-020 — Brand Pages — Add İlgili Hizmetlerimiz to pages without service references

**Created:** 2026-05-26
**Size:** M

## Review Level: 1 (Plan Only)

**Assessment:** Mechanical addition of CardGroup sections to 14 brand pages that lack both `## Hizmetler` sections and external link-card sections. Each page requires lightweight content analysis to determine relevant service page(s) by cross-referencing with service pages that list the brand. Low per-page risk but moderate blast radius across 14 files. No removals, only additions.
**Score:** 3/8 — Blast radius: 1, Pattern novelty: 1, Security: 0, Reversibility: 1

## Mission

For 14 brand pages under `markalar/` that have neither a `## Hizmetler` section (with bullet-point service links) nor external link-card sections (`## 🌟 [Service] Hizmetlerimiz` with `class="link-card featured"`), add a new `## İlgili Hizmetlerimiz` CardGroup section at the end of each page (before any existing footer like `[Tüm Markalar](/markalar) | [Hizmetlerimiz](/hizmetlerimiz)` if present, otherwise at the very end).

Determine which services are relevant by:
1. Reading the brand page's content to understand what products/services it describes
2. Cross-referencing with service pages under `hizmetlerimiz/` that list this brand in their "İlgili Markalar" or brand listing sections
3. Mapping the brand's described capabilities to the most logical service page(s)

Each Card must use the format: `<Card title="Service Name" href="/hizmetlerimiz/{slug}"></Card>` (omit `icon` attribute).

This task is the third and final batch in the brand page enrichment series (FN-018 converted `## Hizmetler` bullet lists; FN-019 added service cards to pages with external link-cards; FN-020 covers all remaining brand pages).

## Dependencies

- **None** — FN-020 operates on a disjoint set of pages from FN-018 and FN-019 (no overlap), so it can run independently.

## Context to Read First

1. `hizmetlerimiz/mekanik-sihhi-tesisat.mdx` — reference for how service pages list brands; several target pages are listed here
2. `hizmetlerimiz/radyator.mdx` — references Radyal, Tekneciler, Nobo; shows the CardGroup pattern on service pages
3. `hizmetlerimiz/tahliye-istasyonu.mdx` — references Sukar, Sanihydro
4. `hizmetlerimiz/pompalar.mdx` — references Sanihydro
5. `hizmetlerimiz/sulama-sistemleri.mdx` — references Rain Bird, Pimtaş
6. `hizmetlerimiz/gunes-enerjisi.mdx` — references Burak, TSE
7. `hizmetlerimiz/isi-pompalari.mdx` — references Varmeks
8. `hizmetlerimiz/akilli-oda-termostatlari.mdx` — references Nobo

Read these to understand the brand-to-service mapping and the CardGroup syntax used elsewhere in the project.

## File Scope

- `markalar/vitra.mdx` (modified)
- `markalar/burak.mdx` (modified)
- `markalar/nobo.mdx` (modified)
- `markalar/warmeks.mdx` (modified)
- `markalar/radyal.mdx` (modified)
- `markalar/rain-bird.mdx` (modified)
- `markalar/sukar.mdx` (modified)
- `markalar/pimtas.mdx` (modified)
- `markalar/element.mdx` (modified)
- `markalar/ph-mekanik.mdx` (modified)
- `markalar/baylan.mdx` (modified)
- `markalar/tse.mdx` (modified)
- `markalar/tekneciler.mdx` (modified)
- `markalar/sanihydro.mdx` (modified)

## Steps

### Step 0: Preflight

- [ ] Verify all 14 target `.mdx` files exist under `markalar/`
- [ ] Verify the existing service page `.mdx` files exist under `hizmetlerimiz/` (especially mekanik-sihhi-tesisat, radyator, tahliye-istasyonu, pompalar, sulama-sistemleri, gunes-enerjisi, isi-pompalari, su-depolari, akilli-oda-termostatlari, termosifonik-sistemler)
- [ ] Read each target file to confirm its current state — none should have `## Hizmetler` or `## 🌟 [emoji] ... Hizmetlerimiz` sections
- [ ] Read relevant service pages to confirm which brands they list (do not rely solely on this spec — file states may have changed)

### Step 1: vitra.mdx

**Content analysis:** VitrA produces bathroom/vitrifiye products (klozet, lavabo, banyo mobilyaları, armatürler, seramik karolar). The content mentions "sıhhi tesisat ve banyo çözümleri."

**Cross-reference:** Listed in `hizmetlerimiz/mekanik-sihhi-tesisat.mdx` under "Vana, Armatür ve Vitrifiye Ürünleri."

**Service mapping:** Mekanik Sıhhi Tesisat (`/hizmetlerimiz/mekanik-sihhi-tesisat`)

Insert at the very end of the file (after the last paragraph, no footer present):

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Mekanik Sıhhi Tesisat" href="/hizmetlerimiz/mekanik-sihhi-tesisat"></Card>
</CardGroup>
```

- [ ] Add `## İlgili Hizmetlerimiz` CardGroup section with 1 Card for Mekanik Sıhhi Tesisat
- [ ] Verify no existing content was modified

### Step 2: burak.mdx

**Content analysis:** Burak produces güneş enerjisi systems (boyler kollektör paketleri), termosifonik systems, and kalorifer systems. The content is organized under "Güneş Enerjisi Sistemleri" and "Termosifonik ve Kalorifer Sistemleri" headings.

**Cross-reference:** Listed in `hizmetlerimiz/gunes-enerjisi.mdx` (multiple times), `hizmetlerimiz/gunes-enerjisi-ile-su-isitma.mdx`, `hizmetlerimiz/termosifonik-sistemler.mdx`, and `hizmetlerimiz/mekanik-sihhi-tesisat.mdx` (Burak Boru).

**Service mapping:** Güneş Enerjisi Sistemleri (`/hizmetlerimiz/gunes-enerjisi`), Termosifonik Sistemler (`/hizmetlerimiz/termosifonik-sistemler`)

Insert at the very end of the file (after the last paragraph, no footer present):

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Güneş Enerjisi Sistemleri" href="/hizmetlerimiz/gunes-enerjisi"></Card>
  <Card title="Termosifonik Sistemler" href="/hizmetlerimiz/termosifonik-sistemler"></Card>
</CardGroup>
```

- [ ] Add `## İlgili Hizmetlerimiz` CardGroup section with 2 Cards for Güneş Enerjisi Sistemleri and Termosifonik Sistemler
- [ ] Verify no existing content was modified

### Step 3: nobo.mdx

**Content analysis:** Nobo produces Norveç menşeli elektrikli konvektör ısıtıcılar. The content describes "elektrikli konvektör ısıtıcılar" with "gelişmiş termostat teknolojisi" for "ortam sıcaklığını hassas bir şekilde kontrol."

**Cross-reference:** Listed in `hizmetlerimiz/radyator.mdx` under "Akıllı Isıtıcılar" section and has a dedicated Card in `hizmetlerimiz/akilli-oda-termostatlari.mdx` under "Sistem Entegre Çözümler."

**Service mapping:** Radyatör Sistemleri (`/hizmetlerimiz/radyator`), Akıllı Oda Termostatları (`/hizmetlerimiz/akilli-oda-termostatlari`)

Insert at the very end of the file (after the last paragraph, no footer present):

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Radyatör Sistemleri" href="/hizmetlerimiz/radyator"></Card>
  <Card title="Akıllı Oda Termostatları" href="/hizmetlerimiz/akilli-oda-termostatlari"></Card>
</CardGroup>
```

- [ ] Add `## İlgili Hizmetlerimiz` CardGroup section with 2 Cards for Radyatör Sistemleri and Akıllı Oda Termostatları
- [ ] Verify no existing content was modified

### Step 4: warmeks.mdx

**Content analysis:** Warmeks/Varmeks produces ısı pompası teknolojileri (Varm Up, Varm Silent Pool, Varm Boost, Varm Fuzzy serileri). The Technical Info JSON section details heat pump specifications.

**Cross-reference:** Listed as a Card in `hizmetlerimiz/isi-pompalari.mdx`, listed in `hizmetlerimiz/termosifonik-sistemler.mdx` as a Card, and mentioned in `hizmetlerimiz/gunes-enerjisi-ile-su-isitma.mdx`.

**Service mapping:** Isı Pompaları (`/hizmetlerimiz/isi-pompalari`), Termosifonik Sistemler (`/hizmetlerimiz/termosifonik-sistemler`)

The page has a footer `[Tüm Markalar](/markalar) | [Hizmetlerimiz](/hizmetlerimiz)` at the very end. Insert the new section BEFORE this footer.

The file currently ends with:

```
Gül-Tekin Mühendislik, Warmeks ürünlerinin Bodrum'daki yetkili satış ve uygulama partneridir. Kurulum, bakım ve teknik destek hizmetlerimizden yararlanmak için [iletişime geçin](/contact).

[Tüm Markalar](/markalar) | [Hizmetlerimiz](/hizmetlerimiz)
```

Replace so the end becomes:

```
Gül-Tekin Mühendislik, Warmeks ürünlerinin Bodrum'daki yetkili satış ve uygulama partneridir. Kurulum, bakım ve teknik destek hizmetlerimizden yararlanmak için [iletişime geçin](/contact).

## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Termosifonik Sistemler" href="/hizmetlerimiz/termosifonik-sistemler"></Card>
</CardGroup>

[Tüm Markalar](/markalar) | [Hizmetlerimiz](/hizmetlerimiz)
```

- [ ] Add `## İlgili Hizmetlerimiz` CardGroup section with 2 Cards for Isı Pompaları and Termosifonik Sistemler, placed BEFORE the `[Tüm Markalar](/markalar) | [Hizmetlerimiz](/hizmetlerimiz)` footer
- [ ] Verify the Technical Info JSON section and all other content remain untouched

### Step 5: radyal.mdx

**Content analysis:** Radyal produces alüminyum radyatör and havlupan. Content describes "modern ve estetik tasarımlı alüminyum radyatör ve havlupan" with "yüksek ısı iletkenliği."

**Cross-reference:** Listed as a Card in `hizmetlerimiz/radyator.mdx` under "Radyatör Üreticileri" and mentioned in the Technical Details section about alüminyum panel radyatörler.

**Service mapping:** Radyatör Sistemleri (`/hizmetlerimiz/radyator`)

Insert at the very end of the file (after the last paragraph, no footer present):

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Radyatör Sistemleri" href="/hizmetlerimiz/radyator"></Card>
</CardGroup>
```

- [ ] Add `## İlgili Hizmetlerimiz` CardGroup section with 1 Card for Radyatör Sistemleri
- [ ] Verify no existing content was modified

### Step 6: rain-bird.mdx

**Content analysis:** Rain Bird produces sulama ürünleri (sprinkler, rotorlar, vanalar, damla sulama, akıllı kontrol üniteleri). The content describes "sulama ürünleri" for "tarım, peyzaj, golf sahaları ve konutlar."

**Cross-reference:** Listed in `hizmetlerimiz/sulama-sistemleri.mdx` under "Sulama Otomasyon ve Ekipmanları."

**Service mapping:** Sulama Sistemleri (`/hizmetlerimiz/sulama-sistemleri`)

Insert at the very end of the file (after the last paragraph, no footer present):

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Sulama Sistemleri" href="/hizmetlerimiz/sulama-sistemleri"></Card>
</CardGroup>
```

- [ ] Add `## İlgili Hizmetlerimiz` CardGroup section with 1 Card for Sulama Sistemleri
- [ ] Verify no existing content was modified

### Step 7: sukar.mdx

**Content analysis:** Sukar produces drenaj süzgeçleri and yalıtım süzgeçleri for banyo, mutfak, teras, otopark, havuz gibi ıslak hacimler.

**Cross-reference:** Listed in `hizmetlerimiz/mekanik-sihhi-tesisat.mdx` under "Drenaj ve Atık Su Çözümleri" and in `hizmetlerimiz/tahliye-istasyonu.mdx` under "İlgili Markalar."

**Service mapping:** Mekanik Sıhhi Tesisat (`/hizmetlerimiz/mekanik-sihhi-tesisat`), Tahliye İstasyonu (`/hizmetlerimiz/tahliye-istasyonu`)

Insert at the very end of the file (after the last paragraph, no footer present):

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Mekanik Sıhhi Tesisat" href="/hizmetlerimiz/mekanik-sihhi-tesisat"></Card>
  <Card title="Tahliye İstasyonu" href="/hizmetlerimiz/tahliye-istasyonu"></Card>
</CardGroup>
```

- [ ] Add `## İlgili Hizmetlerimiz` CardGroup section with 2 Cards for Mekanik Sıhhi Tesisat and Tahliye İstasyonu
- [ ] Verify no existing content was modified

### Step 8: pimtas.mdx

**Content analysis:** Pimtaş produces plastik boru, vana, ek parçalar (U-PVC, HDPE) for inşaat, tarımsal sulama, and havuz.

**Cross-reference:** Listed in `hizmetlerimiz/mekanik-sihhi-tesisat.mdx` under "Boru ve Ek Parça Üreticileri" and in `hizmetlerimiz/sulama-sistemleri.mdx` under "Boru ve Altyapı Çözümleri."

**Service mapping:** Mekanik Sıhhi Tesisat (`/hizmetlerimiz/mekanik-sihhi-tesisat`), Sulama Sistemleri (`/hizmetlerimiz/sulama-sistemleri`)

Insert at the very end of the file (after the last paragraph, no footer present):

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Mekanik Sıhhi Tesisat" href="/hizmetlerimiz/mekanik-sihhi-tesisat"></Card>
  <Card title="Sulama Sistemleri" href="/hizmetlerimiz/sulama-sistemleri"></Card>
</CardGroup>
```

- [ ] Add `## İlgili Hizmetlerimiz` CardGroup section with 2 Cards for Mekanik Sıhhi Tesisat and Sulama Sistemleri
- [ ] Verify no existing content was modified

### Step 9: element.mdx

**Content analysis:** Element produces ısıtma elemanları (rezistanslar) — electrical heating elements used in "Elektrikli ısıtıcılardan, fırınlara, su ısıtıcılarından endüstriyel proseslere."

**Cross-reference:** Element is NOT explicitly listed in any service page's brand listing. Determine the mapping based on content analysis:
- The brand page title is "Element Elektrikli Isıtma Sistemleri" — "Elektrikli Isıtma Sistemleri" (Electric Heating Systems) is the primary domain.
- Heating elements are core components of electric heating systems (`radyator.mdx` covers "Akıllı Isıtıcılar") and water heating systems (`termosifonik-sistemler.mdx` covers electric water heaters).
- The most logical service page based on the broad "ısıtma" (heating) focus is **Radyatör Sistemleri** (`/hizmetlerimiz/radyator`) since it covers general electric heating solutions.

Insert at the very end of the file (after the last paragraph, no footer present):

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Radyatör Sistemleri" href="/hizmetlerimiz/radyator"></Card>
</CardGroup>
```

- [ ] Add `## İlgili Hizmetlerimiz` CardGroup section with 1 Card for Radyatör Sistemleri
- [ ] Verify no existing content was modified

### Step 10: ph-mekanik.mdx

**Content analysis:** PH Mekanik produces modüler su deposu sistemleri (GRP modüler depolar, prizmatik paslanmaz çelik/galvaniz depolar, termoplast modüler depolar). The content is focused entirely on water storage solutions.

**Cross-reference:** PH Mekanik is NOT explicitly listed in any service page's brand listing. Based on content, the most logical mapping is to Su Depoları since the content is entirely about modüler su depoları.

**Service mapping:** Su Depoları (`/hizmetlerimiz/su-depolari`)

The page has a footer `[Tüm Markalar](/markalar) | [Hizmetlerimiz](/hizmetlerimiz)` at the very end. Insert the new section BEFORE this footer.

The file currently ends with:

```
Gül-Tekin Mühendislik, Ph-Mekanik ürünlerinin Bodrum'daki yetkili satış ve uygulama partneridir. Kurulum, bakım ve teknik destek hizmetlerimizden yararlanmak için [iletişime geçin](/contact).

[Tüm Markalar](/markalar) | [Hizmetlerimiz](/hizmetlerimiz)
```

Replace so the end becomes:

```
Gül-Tekin Mühendislik, Ph-Mekanik ürünlerinin Bodrum'daki yetkili satış ve uygulama partneridir. Kurulum, bakım ve teknik destek hizmetlerimizden yararlanmak için [iletişime geçin](/contact).

## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Su Depoları" href="/hizmetlerimiz/su-depolari"></Card>
</CardGroup>

[Tüm Markalar](/markalar) | [Hizmetlerimiz](/hizmetlerimiz)
```

- [ ] Add `## İlgili Hizmetlerimiz` CardGroup section with 1 Card for Su Depoları, placed BEFORE the `[Tüm Markalar](/markalar) | [Hizmetlerimiz](/hizmetlerimiz)` footer
- [ ] Verify the Technical Info JSON section and all other content remain untouched

### Step 11: baylan.mdx

**Content analysis:** Baylan produces su sayaçları (mekanik, kartlı/ön ödemeli, Woltman tipi). The content is about water metering solutions for "evsel kullanımdan endüstriyel uygulamalara."

**Cross-reference:** Baylan is NOT explicitly listed in any service page's brand listing. Based on content, the most logical mapping is to Mekanik Sıhhi Tesisat (`/hizmetlerimiz/mekanik-sihhi-tesisat`) since water meters are plumbing fixtures that are part of sıhhi tesisat systems.

**Service mapping:** Mekanik Sıhhi Tesisat (`/hizmetlerimiz/mekanik-sihhi-tesisat`)

The page has a footer `[Tüm Markalar](/markalar) | [Hizmetlerimiz](/hizmetlerimiz)` at the very end. Insert the new section BEFORE this footer.

The file currently ends with:

```
Gül-Tekin Mühendislik, Baylan ürünlerinin Bodrum'daki yetkili satış ve uygulama partneridir. Kurulum, bakım ve teknik destek hizmetlerimizden yararlanmak için [iletişime geçin](/contact).

[Tüm Markalar](/markalar) | [Hizmetlerimiz](/hizmetlerimiz)
```

Replace so the end becomes:

```
Gül-Tekin Mühendislik, Baylan ürünlerinin Bodrum'daki yetkili satış ve uygulama partneridir. Kurulum, bakım ve teknik destek hizmetlerimizden yararlanmak için [iletişime geçin](/contact).

## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Mekanik Sıhhi Tesisat" href="/hizmetlerimiz/mekanik-sihhi-tesisat"></Card>
</CardGroup>

[Tüm Markalar](/markalar) | [Hizmetlerimiz](/hizmetlerimiz)
```

- [ ] Add `## İlgili Hizmetlerimiz` CardGroup section with 1 Card for Mekanik Sıhhi Tesisat, placed BEFORE the `[Tüm Markalar](/markalar) | [Hizmetlerimiz](/hizmetlerimiz)` footer
- [ ] Verify the Technical Info JSON section and all other content remain untouched

### Step 12: tse.mdx

**Content analysis:** TSE is a standards organization (not a product brand). The content discusses TSE's role in "güneş enerjisi sistemleri" and "su depoları" — listing specific brands like Solimpeks, Baymak, Eraslan. The content explicitly has sections titled "Güneş Enerjisi Sistemlerinde TSE'nin Rolü" and "Su Depoları ve Diğer Tesisat Ürünlerinde TSE."

**Cross-reference:** Mentioned in `hizmetlerimiz/gunes-enerjisi.mdx` in a note about TSE standartları.

**Service mapping:** Güneş Enerjisi Sistemleri (`/hizmetlerimiz/gunes-enerjisi`), Su Depoları (`/hizmetlerimiz/su-depolari`)

Insert at the very end of the file (after the last paragraph, no footer present):

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Güneş Enerjisi Sistemleri" href="/hizmetlerimiz/gunes-enerjisi"></Card>
  <Card title="Su Depoları" href="/hizmetlerimiz/su-depolari"></Card>
</CardGroup>
```

- [ ] Add `## İlgili Hizmetlerimiz` CardGroup section with 2 Cards for Güneş Enerjisi Sistemleri and Su Depoları
- [ ] Verify no existing content was modified

### Step 13: tekneciler.mdx

**Content analysis:** Tekneciler produces tesisat ve yerden ısıtma sistemleri ürünleri (kollektörler, radyatör vanaları). The content mentions "tesisat ve yerden ısıtma sistemleri" explicitly.

**Cross-reference:** Listed as a Card in `hizmetlerimiz/radyator.mdx` under "Tamamlayıcı Ürünler" (for radyatör vanaları) and mentioned in `hizmetlerimiz/mekanik-sihhi-tesisat.mdx` under "Vana, Armatür ve Vitrifiye Ürünleri" (for kollektör ve vanalar).

**Service mapping:** Radyatör Sistemleri (`/hizmetlerimiz/radyator`), Yerden Isıtma Sistemleri (`/hizmetlerimiz/yerden-isitma-sistemleri`), Mekanik Sıhhi Tesisat (`/hizmetlerimiz/mekanik-sihhi-tesisat`)

Insert at the very end of the file (after the last paragraph, no footer present):

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Radyatör Sistemleri" href="/hizmetlerimiz/radyator"></Card>
  <Card title="Yerden Isıtma Sistemleri" href="/hizmetlerimiz/yerden-isitma-sistemleri"></Card>
  <Card title="Mekanik Sıhhi Tesisat" href="/hizmetlerimiz/mekanik-sihhi-tesisat"></Card>
</CardGroup>
```

- [ ] Add `## İlgili Hizmetlerimiz` CardGroup section with 3 Cards for Radyatör Sistemleri, Yerden Isıtma Sistemleri, and Mekanik Sıhhi Tesisat
- [ ] Verify no existing content was modified

### Step 14: sanihydro.mdx

**Content analysis:** Sanihydro (SFA Group) produces atık su ve tahliye pompaları (tuvalet öğütücüleri/WC grinder, gri su pompaları, yoğuşma suyu pompaları).

**Cross-reference:** Listed in `hizmetlerimiz/pompalar.mdx` under "Özel Amaçlı Pompalar," in `hizmetlerimiz/tahliye-istasyonu.mdx` under "İlgili Markalar," and in `hizmetlerimiz/mekanik-sihhi-tesisat.mdx` under "Drenaj ve Atık Su Çözümleri."

**Service mapping:** Pompalar (`/hizmetlerimiz/pompalar`), Tahliye İstasyonu (`/hizmetlerimiz/tahliye-istasyonu`), Mekanik Sıhhi Tesisat (`/hizmetlerimiz/mekanik-sihhi-tesisat`)

Insert at the very end of the file (after the last paragraph, no footer present):

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
  <Card title="Tahliye İstasyonu" href="/hizmetlerimiz/tahliye-istasyonu"></Card>
  <Card title="Mekanik Sıhhi Tesisat" href="/hizmetlerimiz/mekanik-sihhi-tesisat"></Card>
</CardGroup>
```

- [ ] Add `## İlgili Hizmetlerimiz` CardGroup section with 3 Cards for Pompalar, Tahliye İstasyonu, and Mekanik Sıhhi Tesisat
- [ ] Verify no existing content was modified

### Step 15: Testing & Verification

> This is a Mintlify documentation site with no test runner, package.json, or CI pipeline. Validation is done via file review.

- [ ] For each of the 14 modified files, verify:
  - No broken MDX syntax (all `<CardGroup>` and `<Card>` tags properly opened and closed — `</CardGroup>` and `</Card>` tags present)
  - All `<Card>` components are self-closing (`<Card title="..." href="..."></Card>`) with no `icon` attribute
  - All `href` values use `/hizmetlerimiz/{slug}` format and point to existing service page files
  - The `## İlgili Hizmetlerimiz` heading is present
  - All existing content (descriptions, Technical Info JSON, footers, etc.) remains untouched
  - Footer links (where present) are preserved below the new section
  - Only additions were made — no content was removed or reordered
- [ ] Verify that none of the 14 pages already had a `## Hizmetler` section or `## 🌟 [emoji] ... Hizmetlerimiz` external link-card section (if one does, skip it and note it as already covered by FN-018/FN-019)
- [ ] Run `npx mintlify dev` (if mintlify CLI is available) to verify the site builds without errors and visually confirm CardGroups render correctly
- [ ] Fix any issues found — if fixing requires edits outside the declared File Scope, make those fixes anyway

### Step 16: Documentation & Delivery

- [ ] Save a summary of changes as a task document: `fn_task_document_write(key="changes", content="...")` listing each modified file, which service Cards were added, and how many Cards per file
- [ ] If any page was skipped because it already had a `## Hizmetler` or external link-card section (unexpected overlap with FN-018/019), note it as skipped

**Artifacts:**
- None beyond the modified `.mdx` files

## Documentation Requirements

**Must Update:**
- This task produces no standalone documentation; the `.mdx` file changes are self-documenting

**Check If Affected:**
- `markalar/markalar.mdx` — unlikely, but verify the brand index page isn't affected by structural changes to individual brand pages
- `hizmetlerimiz/hizmetlerimiz.mdx` — unlikely, verify the service index page is unaffected

## Completion Criteria

- [ ] All 14 brand pages now have a `## İlgili Hizmetlerimiz` `<CardGroup>` section
- [ ] Each Card correctly points to the relevant internal service page based on content analysis and cross-referencing
- [ ] All Card components are self-closing (`<Card title="..." href="..."></Card>`) with no `icon` attribute
- [ ] Pages with `[Tüm Markalar](/markalar) | [Hizmetlerimiz](/hizmetlerimiz)` footers have the new section placed BEFORE the footer
- [ ] Pages without footers have the new section at the very end
- [ ] All existing content (descriptions, Technical Info JSON sections, footers) remains untouched
- [ ] No broken MDX syntax in any modified file
- [ ] Changes summary saved as task document

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-020): complete Step N — added İlgili Hizmetlerimiz to {page-name}`
- **Bug fixes:** `fix(FN-020): description`
- **Final:** `feat(FN-020): add İlgili Hizmetlerimiz CardGroup to 14 brand pages`

## Do NOT

- Add `icon` attributes to Card components — these are service cards on brand pages
- Modify, remove, or reorder any existing content (descriptions, headings, Technical Info JSON, footer links)
- Add a `## Hizmetler` section — use only `## İlgili Hizmetlerimiz` as the heading
- Remove or replace any existing footer links (`[Tüm Markalar](/markalar) | [Hizmetlerimiz](/hizmetlerimiz)`)
- Modify files outside the declared File Scope
- Refuse to fix issues found during verification, even if the fix touches adjacent content
- Process `varmeks.md` (the `.md` file) — only process `warmeks.mdx` (the `.mdx` file)

## Changeset Requirements

This task does NOT remove existing functionality — it only adds new CardGroup sections. No changeset file is required.
