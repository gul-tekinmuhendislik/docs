# Task: FN-029 — ORTA SEVIYE MARKALAR - Grup C: lg, mega, pimtas, vesbo

**Created:** 2026-05-26
**Size:** M

## Review Level: 2 (Plan and Code)

**Assessment:** Enriches 4 mid-level brand `.mdx` pages (currently 1020–1498 bytes each) to 2000+ bytes with structured Turkish content: brand history, detailed product groups, Gül-tekin relationship with Bodrum application examples, expanded service page CardGroups, and image placement research comments. Two pages (lg, mega, vesbo) need new or expanded CardGroups depending on whether FN-019 has merged by the time this task runs. Pimtas (no external link-cards) gets a new CardGroup from scratch. Vesbo's existing `service-header-image` must be preserved. Purely additive content work across 4 files in a single directory. No security concerns, easily reversible via git revert.
**Score:** 3/8 — Blast radius: 1, Pattern novelty: 1, Security: 0, Reversibility: 1

## Mission

Four mid-level brand pages in `markalar/` — **lg.mdx** (LG klima/ısı pompası, 1308 bytes), **mega.mdx** (Mega endüstriyel pompa, 1382 bytes), **pimtas.mdx** (Pimtaş plastik boru/vana, 1020 bytes), and **vesbo.mdx** (Vesbo PPR boru/tesisat, 1498 bytes) — currently sit well below the target 2000+ bytes with only brief introductory paragraphs and (for lg, mega, vesbo) external link-card sections. This task expands each page to a minimum of 2000 bytes with structured Turkish-language content: founding story (year, origin, market position), detailed product group listings with descriptions per category, the brand's relationship with Gül-tekin Mühendislik in Bodrum, Bodrum-specific application examples with locality names (Yalıkavak, Göltürkbükü, Bitez, Turgutreis, etc.), a relevant `## İlgili Hizmetlerimiz` CardGroup with multiple service links, and an HTML comment documenting image placement opportunities. Vesbo has a `<div class="service-header-image">` which must be preserved intact. The enriched pages serve as credible standalone brand references for customers browsing Gül-tekin Mühendislik's partner portfolio.

**FN-019 dependency handling:** FN-019 (in-review) adds a basic `## İlgili Hizmetlerimiz` CardGroup with a single Card to lg.mdx, mega.mdx, and vesbo.mdx. If FN-019 has been merged when this task starts, those existing CardGroups will be EXPANDED with additional service Cards. If FN-019 has NOT yet been merged, this task will CREATE the CardGroups from scratch. Pimtas is NOT covered by FN-019 (it has no external link-cards), so a new CardGroup is always created. The preflight step will detect the state and determine the correct approach.

## Dependencies

- **Task:** FN-019 (adds basic `## İlgili Hizmetlerimiz` CardGroups to lg.mdx, mega.mdx, vesbo.mdx — this task will either expand those or create them from scratch depending on merge state)

## Context to Read First

- `markalar/grundfos.mdx` — reference for well-developed brand page with structured sections (Hakkında → model tables → CardGroup → external link-cards → İlgili Hizmetlerimiz)
- `markalar/wilo.mdx` — reference for header image + model tables + multi-card CardGroup + external link-cards pattern
- `markalar/baymak.mdx` — reference for highly detailed brand page with Ürün Grupları, Teknolojik Özellikler, Sertifikalar sections
- `hizmetlerimiz/isi-pompalari.mdx` — reference for `<CardGroup>` / `<Card>` syntax
- `custom.css` — existing CSS classes for link-card, badge, brand-grid

## File Scope

All files to be modified (4 files total):

- `markalar/lg.mdx` (modified — content enrichment, new or expanded CardGroup)
- `markalar/mega.mdx` (modified — content enrichment, new or expanded CardGroup)
- `markalar/pimtas.mdx` (modified — content enrichment, new CardGroup from scratch)
- `markalar/vesbo.mdx` (modified — content enrichment, new or expanded CardGroup; preserve service-header-image)

## Steps

### Step 0: Preflight

- [ ] All 4 target files exist in `markalar/` directory
- [ ] Record baseline byte counts: `wc -c markalar/lg.mdx markalar/mega.mdx markalar/pimtas.mdx markalar/vesbo.mdx`
- [ ] Verify FN-019 merge state: Check whether `## İlgili Hizmetlerimiz` exists in lg.mdx, mega.mdx, and vesbo.mdx
  - **If CardGroups exist:** FN-019 has landed → **EXPAND** existing CardGroups (add additional Cards)
  - **If CardGroups do NOT exist:** FN-019 has NOT landed → **CREATE** CardGroups from scratch (the full CardGroup with all Cards)
  - Document the detected state for the delivery summary
- [ ] Read reference files (grundfos.mdx, wilo.mdx) for structure patterns
- [ ] Verify all service page paths that will be referenced in CardGroups exist:
  - `hizmetlerimiz/isi-pompalari.mdx`
  - `hizmetlerimiz/klima-sistemleri.mdx`
  - `hizmetlerimiz/hidrofor-sistemleri.mdx`
  - `hizmetlerimiz/pompalar.mdx`
  - `hizmetlerimiz/tahliye-istasyonu.mdx`
  - `hizmetlerimiz/yerden-isitma-sistemleri.mdx`
  - `hizmetlerimiz/mekanik-sihhi-tesisat.mdx`
  - `hizmetlerimiz/su-depolari.mdx`
  - `hizmetlerimiz/sulama-sistemleri.mdx`
  - `hizmetlerimiz/radyator.mdx`
- [ ] Read `markalar/vesbo.mdx` and confirm the `<div class="service-header-image">` block is intact with the `<img>` tag inside it

### Step 1: Enrich lg.mdx — LG Klima ve Isı Pompaları

**Current state:**
- Byte count: 1308
- Has intro paragraph: "LG, Güney Kore merkezli, dünyanın önde gelen teknoloji ve elektronik şirketlerinden biridir..."
- Has `## 🌟 Isı Pompası Hizmetlerimiz` external link-card section
- If FN-019 has landed: has `## İlgili Hizmetlerimiz` CardGroup with single "Isı Pompaları" Card
- If FN-019 has NOT landed: NO CardGroup yet

**Brand context:** LG (Life's Good), 1947'de GoldStar olarak kuruldu, 1995'te LG markasına dönüştü. Güney Kore (Seul) merkezli. Dünyanın en büyük teknoloji şirketlerinden biri. HVAC alanında: klimalar, ısı pompaları, VRF sistemler. LG'nin klima/ısı pompası birimi LG Electronics'in bir parçası.

**Changes:**

**a) Rewrite the frontmatter `description:`** to be comprehensive (min 200 characters). Cover: Korean origin, global tech leadership, HVAC/climate solutions scope, and Gül-tekin relationship.

**b) Add structured content sections** — Insert these sections AFTER the existing intro paragraph and BEFORE the `## 🌟 Isı Pompası Hizmetlerimiz` external link-card section:

```
## Hakkında

LG (Life's Good), 1947 yılında GoldStar markasıyla Güney Kore'de kurulmuş, 1995 yılında LG Electronics çatısı altında yeniden yapılanmıştır. Seul merkezli olan LG, dünyanın en büyük elektronik, beyaz eşya ve iklimlendirme şirketlerinden biridir. HVAC alanında, konut tipi split klimalardan endüstriyel VRF sistemlere, hava kaynaklı ısı pompalarından su kaynaklı sistemlere kadar geniş bir ürün gamı sunmaktadır. LG, yenilikçi inverter teknolojisi, ThinQ akıllı ev ekosistemi ve yüksek enerji verimliliği ile sektörde referans kabul edilmektedir.

## Ürün Grupları

- **LG DUALCOOL Split Klimalar:** Çift döner inverter kompresör teknolojisi ile %40'a varan enerji tasarrufu, hızlı soğutma/ısıtma ve ultra sessiz çalışma sunan geniş kapasite aralığı (7.000-24.000 BTU/h).
- **LG Artcool Serisi:** Estetik tasarımlı, ayna yüzeyli ve modern görünümlü split klimalar. Inverter teknolojili, WiFi kontrollü, plazma hava temizleme filtreli modeller.
- **LG Multi-Split Sistemler:** Bir dış üniteye birden fazla iç ünite bağlama imkanı. Farklı oda tiplerine uygun duvar tipi, kaset tipi ve kanal tipi iç ünite seçenekleri.
- **LG Therma V Hava Kaynaklı Isı Pompaları:** R32 çevre dostu soğutucu gazlı, yüksek COP değerli (4.0'a kadar), -25°C'ye kadar dış ortamda çalışabilen ısı pompaları. Hem ısıtma hem soğutma hem de kullanım sıcak suyu üretimi sağlar.
- **LG MULTI V VRF Sistemler:** Ticari binalar ve büyük konut projeleri için değişken soğutucu akışkanlı (VRF) sistemler. Enerji geri kazanım özellikli, uzun boru mesafelerine izin veren modüler yapı.
- **LG Hava Temizleme Cihazları:** PuriCare serisi, havadaki partikülleri, alerjenleri ve zararlı maddeleri filtreleyen bağımsız hava temizleyiciler.
- **LG ThinQ Akıllı Ev Teknolojisi:** Tüm LG iklimlendirme ürünlerinin akıllı telefon uygulaması ile uzaktan kontrolü, enerji takibi ve sesli komut desteği.

## Gül-tekin Mühendislik ile İlişkimiz

Gül-Tekin Mühendislik, Bodrum yarımadasındaki villa, konut ve ticari projelerde LG klima ve ısı pompası sistemlerinin tedarik, kurulum, bakım ve onarım hizmetlerini sunmaktadır. LG'nin yüksek verimli inverter teknolojisi, Bodrum'un sıcak yaz koşullarında düşük enerji tüketimi ile etkili soğutma sağlarken, Therma V ısı pompaları kış aylarında konforlu ısıtma imkanı sunmaktadır. LG ThinQ teknolojisi sayesinde, müşterilerimiz klima ve ısı pompalarını akıllı telefonlarından uzaktan kontrol edebilmektedir.

## Bodrum'da LG Uygulamaları

Bodrum'daki lüks villa projelerinde LG Artcool ve DUALCOOL klima sistemleri yaygın olarak tercih edilmektedir. Yalıkavak ve Türkbükü bölgesindeki villalarda LG Therma V ısı pompaları ile yıl boyu ısıtma ve soğutma sağlanmaktadır. Bodrum'un yaz aylarında yoğun enerji tüketimine karşı, LG'nin yüksek COP değerli ısı pompaları sayesinde önemli ölçüde enerji tasarrufu elde edilmektedir. Ayrıca, Bodrum merkezdeki butik otel ve restoranlarda LG multi-split klima sistemleri ile odalar arası bağımsız iklimlendirme çözümleri sunulmaktadır.
```

**c) Handle the `## İlgili Hizmetlerimiz` CardGroup:**

**If FN-019 has landed** (CardGroup with single "Isı Pompaları" Card exists):
- Read the current file to locate the exact CardGroup block
- Replace the entire existing CardGroup block with the expanded version:

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Klima Sistemleri" href="/hizmetlerimiz/klima-sistemleri"></Card>
</CardGroup>
```

**If FN-019 has NOT landed** (no CardGroup exists):
- After the `## 🌟 Isı Pompası Hizmetlerimiz` external link-card closing `</a>`, add a blank line and insert:

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Klima Sistemleri" href="/hizmetlerimiz/klima-sistemleri"></Card>
</CardGroup>
```

**d) Add image placement HTML comment at the very end of the file:**

```
<!-- GÖRSEL ÖNERİSİ: LG için Hakkında bölümünden sonra LG klima/ısı pompası ürün fotoğrafı eklenebilir.
     Kaynak: https://www.lg.com/tr/ veya LG HVAC katalogları.
     Dosya adı önerisi: images/markalar/lg-klima-header.jpg -->
```

- [ ] Read current lg.mdx to confirm exact state
- [ ] Rewrite frontmatter `description` (min 200 chars)
- [ ] Add `## Hakkında`, `## Ürün Grupları`, `## Gül-tekin Mühendislik ile İlişkimiz`, `## Bodrum'da LG Uygulamaları` sections between intro paragraph and `## 🌟 Isı Pompası Hizmetlerimiz`
- [ ] Create or expand `## İlgili Hizmetlerimiz` CardGroup with Isı Pompaları + Klima Sistemleri
- [ ] Add image placement HTML comment at end of file
- [ ] Verify ≥ 2000 bytes: `wc -c markalar/lg.mdx`

**Artifacts:**
- `markalar/lg.mdx` (modified)

### Step 2: Enrich mega.mdx — Mega Su Arıtma Sistemleri

**Current state:**
- Byte count: 1382
- Has intro paragraph: "Mega Pompa, endüstriyel pompalar ve pompa sistemleri alanında uzmanlaşmış bir Türk markasıdır..."
- Has `## 🌟 Bodrum Hidrofor Hizmetlerimiz` external link-card section
- If FN-019 has landed: has `## İlgili Hizmetlerimiz` CardGroup with single "Hidrofor Sistemleri" Card
- If FN-019 has NOT landed: NO CardGroup yet

**Brand context:** Mega Pompa, endüstriyel pompalar, atık su pompaları, yangın pompaları ve hidrofor sistemleri alanında uzmanlaşmış Türk markası. Zorlu endüstriyel uygulamalar için yüksek kaliteli pompa çözümleri.

**Changes:**

**a) Rewrite the frontmatter `description:`** to be comprehensive (min 200 characters). Cover: Turkish industrial pump manufacturer, product scope (endüstriyel pompa, atık su, yangın pompası, hidrofor), and Gül-tekin relationship.

**b) Add structured content sections** — Insert these sections AFTER the existing intro paragraph and BEFORE the `## 🌟 Bodrum Hidrofor Hizmetlerimiz` external link-card section:

```
## Hakkında

Mega Pompa, endüstriyel pompalar ve pompa sistemleri alanında uzmanlaşmış, Türkiye merkezli köklü bir markadır. Geniş ürün yelpazesi; endüstriyel proseslerden atık su arıtma tesislerine, yangın söndürme sistemlerinden tarımsal sulamaya kadar birçok sektöre yönelik pompa çözümleri sunmaktadır. Mega Pompa, özellikle zorlu çalışma koşullarında yüksek performans, güvenilirlik ve uzun ömür vaat eden endüstriyel sınıf ürünleri ile tanınmaktadır. Mühendislik desteği ve teknik çözüm odaklı yaklaşımı ile sektörde güvenilir bir tedarikçi konumundadır.

## Ürün Grupları

- **Endüstriyel Santrifüj Pompalar:** Yatay ve dikey milli, tek ve çok kademeli santrifüj pompalar. Yüksek debi ve basınç gerektiren endüstriyel prosesler, su temini ve sirkülasyon uygulamaları için tasarlanmıştır.
- **Atık Su Pompaları:** Drenaj ve kanalizasyon sistemleri için özel olarak tasarlanmış paslanmaz çelik ve döküm gövdeli pompalar. Katı madde geçişine izin veren geniş kanallı çark seçenekleri.
- **Derin Kuyu Dalgıç Pompalar:** Paslanmaz çelik gövdeli, çok kademeli dalgıç pompalar. 150 metreye varan derinliklerden su çekimi için uygun, yüksek verimli motor ve hidrolik tasarım.
- **Yangın Pompaları:** Yangın yönetmeliklerine (NFPA 20, EN 12845) uygun, yatay ve dikey tip yangın pompaları. Acil durumlarda kesintisiz çalışma için dizel ve elektrikli motor seçenekleri.
- **Hidrofor Sistemleri:** Konut, otel ve ticari yapılar için su basınçlandırma çözümleri. Tek pompalı, çok pompalı ve frekans kontrollü (inverterli) modellerle sabit basınçlı su temini.
- **Proses Pompaları:** Gıda, kimya, petrokimya ve ilaç endüstrileri için hijyenik ve kimyasallara dayanıklı özel pompalar. Paslanmaz çelik (AISI 304/316) gövdeli modeller.
- **Pompa Kontrol Panoları:** Otomatik çalışma, seviye kontrolü, frekans sürücü entegrasyonu ve uzaktan izleme özellikli akıllı kontrol panoları.

## Gül-tekin Mühendislik ile İlişkimiz

Gül-Tekin Mühendislik, Bodrum'daki endüstriyel tesislerde, atık su arıtma tesislerinde ve büyük konut projelerinde Mega Pompa sistemlerini kullanarak müşterilerine güçlü ve güvenilir pompa çözümleri sunmaktadır. Mega Pompa'nın geniş ürün yelpazesi sayesinde, her projenin ihtiyacına uygun pompa seçeneği değerlendirilebilmektedir. Özellikle yüksek debi ve basınç gerektiren projelerde Mega endüstriyel pompaların dayanıklılığı ve uzun ömürlü yapısı öne çıkmaktadır.

## Bodrum'da Mega Uygulamaları

Bodrum yarımadasındaki endüstriyel tesislerde ve organize sanayi bölgelerinde Mega endüstriyel pompalar proses suyu temini ve atık su yönetiminde kullanılmaktadır. Bodrum'daki büyük otel ve tatil köylerinde Mega yangın pompaları yangın güvenliği sistemlerinin önemli bir parçasıdır. Ayrıca, Bodrum'un tarımsal sulama kooperatiflerinde Mega derin kuyu dalgıç pompaları ile verimli sulama çözümleri sağlanmaktadır.
```

**c) Handle the `## İlgili Hizmetlerimiz` CardGroup:**

**If FN-019 has landed** (CardGroup with single "Hidrofor Sistemleri" Card exists):
- Replace the existing CardGroup block with the expanded version:

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Hidrofor Sistemleri" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
  <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
  <Card title="Tahliye İstasyonu" href="/hizmetlerimiz/tahliye-istasyonu"></Card>
</CardGroup>
```

**If FN-019 has NOT landed** (no CardGroup exists):
- After the `## 🌟 Bodrum Hidrofor Hizmetlerimiz` external link-card closing `</a>`, add a blank line and insert the same CardGroup block above.

**d) Add image placement HTML comment at the very end of the file:**

```
<!-- GÖRSEL ÖNERİSİ: Mega için Hakkında bölümünden sonra endüstriyel pompa ürün fotoğrafı
     eklenebilir. Kaynak: Mega Pompa resmi web sitesi veya katalogları.
     Dosya adı önerisi: images/markalar/mega-pompa-header.jpg -->
```

- [ ] Read current mega.mdx to confirm exact state
- [ ] Rewrite frontmatter `description` (min 200 chars)
- [ ] Add `## Hakkında`, `## Ürün Grupları`, `## Gül-tekin Mühendislik ile İlişkimiz`, `## Bodrum'da Mega Uygulamaları` sections between intro paragraph and `## 🌟 Bodrum Hidrofor Hizmetlerimiz`
- [ ] Create or expand `## İlgili Hizmetlerimiz` CardGroup with Hidrofor Sistemleri + Pompalar + Tahliye İstasyonu
- [ ] Add image placement HTML comment at end of file
- [ ] Verify ≥ 2000 bytes: `wc -c markalar/mega.mdx`

**Artifacts:**
- `markalar/mega.mdx` (modified)

### Step 3: Enrich pimtas.mdx — Pimtaş Pimaş Boru Sistemleri

**Current state:**
- Byte count: 1020
- Has intro paragraph: "Pimtaş, 1977 yılında kurulmuş, Türkiye'nin önde gelen plastik boru, vana ve ek parça üreticilerinden biridir..."
- Has a second paragraph about Gül-tekin's use of Pimtaş products
- NO external link-card section (`## 🌟 ... Hizmetlerimiz`)
- NO CardGroup
- NOT covered by FN-019

**Brand context:** Pimtaş, 1977 yılında kurulmuş, Türkiye'nin önde gelen plastik boru, vana ve ek parça üreticilerinden. U-PVC basınçlı/basınçsız borular, HDPE borular, küresel vanalar, kelebek vanalar, çek valfler, boru ek parçaları. İnşaat, tarım ve havuz sektörleri.

**Changes:**

**a) Rewrite the frontmatter `description:`** to be comprehensive (min 200 characters). Cover: 1977 founding, Turkish plastic pipe/valve leader, product scope (U-PVC, HDPE, vana), and Gül-tekin relationship. Keep the existing first paragraph's intro content and expand.

**b) Rewrite the H1 heading?** The current title is "Pimtaş Pimaş Boru Sistemleri" — this is correct and accurate. No change needed.

**c) Add structured content sections** — Insert these sections AFTER the second paragraph (the "Gül-Tekin Mühendislik, Pimtaş'ın korozyona dayanıklı..." paragraph) and BEFORE any end-of-file content:

```
## Hakkında

Pimtaş, 1977 yılında Türkiye'de kurulmuş, plastik boru, vana ve ek parça üretiminde sektörün önde gelen markalarından biridir. Geniş ürün yelpazesi; inşaat, tarımsal sulama, havuz ve endüstriyel tesisat sektörlerine yönelik yüksek kaliteli, korozyona dayanıklı ve uzun ömürlü çözümler sunmaktadır. Pimtaş, üretim tesislerinde uyguladığı kalite kontrol standartları ve geniş stok kapasitesi ile Türkiye genelinde distribütör ve uygulamacılar için güvenilir bir tedarikçidir.

## Ürün Grupları

- **U-PVC Basınçlı Borular:** Soğuk su tesisatları, sulama sistemleri ve endüstriyel uygulamalar için PN6, PN10 ve PN16 basınç sınıflarında üretilen sert PVC borular. Geniş çap aralığı (20 mm - 400 mm) ve çeşitli renk seçenekleri (gri için tesisat, siyah için sulama).
- **U-PVC Basınçsız Borular:** Atık su, yağmur suyu drenajı ve kanalizasyon sistemleri için tasarlanmış basınçsız borular. İçi düzgün yüzeyli, kimyasallara dayanıklı ve uzun ömürlü.
- **HDPE Borular:** Yüksek yoğunluklu polietilen (HDPE) borular. Esnek yapısı ile zemin hareketlerine dayanıklı, kaynakla birleştirmeye uygun. İçme suyu şebekeleri, doğalgaz dağıtımı ve endüstriyel hatlarda kullanılır.
- **Küresel Vanalar:** PVC ve PP malzemeden üretilen, tam geçişli ve redüksiyonlu küresel vanalar. Kimyasal tesisatlar, sulama sistemleri ve genel endüstriyel uygulamalar için uygun.
- **Kelebek Vanalar:** Büyük çaplı boru hatlarında akış kontrolü için tasarlanmış kelebek vanalar. Yüksek basınç dayanımı ve kolay kullanım özellikleri ile öne çıkar.
- **Boru Ek Parçaları (Fittings):** Dirsek, te, manson, redüksiyon, nipel, flanş ve kör tapa gibi geniş fitting yelpazesi. Her çap ve basınç sınıfı için uygun seçenekler.
- **Yapıştırıcı ve Sızdırmazlık Malzemeleri:** PVC borular için özel solvent bazlı yapıştırıcılar, sızdırmazlık keçeleri ve contalar.

## Gül-tekin Mühendislik ile İlişkimiz

Gül-Tekin Mühendislik, Bodrum genelindeki mekanik ve sıhhi tesisat projelerinde Pimtaş'ın U-PVC ve HDPE boru sistemlerini kullanarak müşterilerine güvenilir, korozyona dayanıklı ve uzun ömürlü çözümler sunmaktadır. Pimtaş ürünlerinin montaj kolaylığı (yapıştırma ve geçme bağlantı), Bodrum'daki projelerde işçilik süresini kısaltmakta ve maliyet avantajı sağlamaktadır. Ayrıca, Pimtaş vana ve ek parçalarının geniş stok imkanı sayesinde, acil durumlarda hızlı malzeme tedariki mümkün olmaktadır.

## Bodrum'da Pimtaş Uygulamaları

Bodrum'daki villa ve konut projelerinde Pimtaş U-PVC boru ve fittingleri, sıhhi tesisat ve atık su hatlarında yaygın olarak kullanılmaktadır. Bodrum'un sert su koşullarına karşı korozyona dayanıklı yapısı ile öne çıkan Pimtaş ürünleri, özellikle havuz tesisatlarında tercih edilmektedir. Yalıkavak ve Göltürkbükü bölgesindeki peyzaj ve sulama projelerinde Pimtaş boru sistemleri ile verimli su dağıtımı sağlanmaktadır. Ayrıca, Bodrum'daki otel ve ticari tesislerin yenileme projelerinde Pimtaş vana ve bağlantı elemanları kullanılmaktadır.
```

**d) Add a new `## İlgili Hizmetlerimiz` CardGroup** at the end of the file (after all content sections). Pimtas has NO external link-cards, so place this as the final content section:

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Mekanik Sıhhi Tesisat" href="/hizmetlerimiz/mekanik-sihhi-tesisat"></Card>
  <Card title="Sulama Sistemleri" href="/hizmetlerimiz/sulama-sistemleri"></Card>
  <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
  <Card title="Su Depoları" href="/hizmetlerimiz/su-depolari"></Card>
</CardGroup>
```

**e) Add image placement HTML comment at the very end of the file:**

```
<!-- GÖRSEL ÖNERİSİ: Pimtaş için Hakkında bölümünden sonra ürün fotoğrafı (U-PVC boru ve vana)
     eklenebilir. Kaynak: Pimtaş resmi web sitesi veya katalogları.
     Dosya adı önerisi: images/markalar/pimtas-header.jpg -->
```

- [ ] Read current pimtas.mdx to confirm exact state
- [ ] Rewrite frontmatter `description` (min 200 chars)
- [ ] Add `## Hakkında`, `## Ürün Grupları`, `## Gül-tekin Mühendislik ile İlişkimiz`, `## Bodrum'da Pimtaş Uygulamaları` sections after the second paragraph
- [ ] Add new `## İlgili Hizmetlerimiz` CardGroup at end of file with Mekanik Sıhhi Tesisat + Sulama Sistemleri + Pompalar + Su Depoları
- [ ] Add image placement HTML comment at end of file
- [ ] Verify ≥ 2000 bytes: `wc -c markalar/pimtas.mdx`

**Artifacts:**
- `markalar/pimtas.mdx` (modified)

### Step 4: Enrich vesbo.mdx — Vesbo PPR Boru Sistemleri

**Current state:**
- Byte count: 1498
- Has `<div class="service-header-image">` with an `<img>` — **MUST PRESERVE INTACT**
- Has intro paragraph: "Vesbo, plastik boru sistemleri alanında dünya çapında tanınan bir markadır..."
- Has `## 🌟 Yerden Isıtma Hizmetlerimiz` external link-card section
- If FN-019 has landed: has `## İlgili Hizmetlerimiz` CardGroup with single "Yerden Isıtma Sistemleri" Card
- If FN-019 has NOT landed: NO CardGroup yet

**Critical preservation requirement:** The `<div class="service-header-image">` block at the top of the page (after the `#` H1 heading) must be preserved exactly as-is. No edits to it or around it. The new structured content sections will be added BETWEEN the existing intro paragraph AND the `## 🌟 Yerden Isıtma Hizmetlerimiz` external link-card section.

**Brand context:** Vesbo, PPR (Polipropilen Random Kopolimer) boru ve ek parçaları üretiminde dünya çapında tanınan marka. Sıhhi tesisat, ısıtma sistemleri ve endüstriyel uygulamalar için güvenilir çözümler. PPRC borular (PN10, PN16, PN20, PN25 sınıfları), tam geçişli vanalar, kaynak aletleri.

**Changes:**

**a) Rewrite the frontmatter `description:`** to be comprehensive (min 200 characters). Cover: global PPR pipe brand, product scope, and Gül-tekin relationship.

**b) Add structured content sections** — Insert new sections AFTER the existing intro paragraph and the Gül-tekin paragraph, and BEFORE the `## 🌟 Yerden Isıtma Hizmetlerimiz` external link-card. The header image and all existing content above this point must remain untouched.

```
## Hakkında

Vesbo, plastik boru sistemleri alanında dünya çapında tanınan bir markadır. Özellikle PPR (Polipropilen Random Kopolimer) boru ve ek parçaları üretiminde uzmanlaşmış olan Vesbo, yüksek sıcaklık ve basınca dayanıklı ürünleri ile sıhhi tesisat, ısıtma sistemleri ve endüstriyel uygulamalar için güvenilir çözümler sunmaktadır. Korozyona karşı tam dirençli, kireçlenme yapmayan ve 50 yılı aşan kullanım ömrü ile Vesbo ürünleri, modern tesisat projelerinin vazgeçilmez bir parçasıdır.

## Ürün Grupları

- **PPRC Borular (PN10, PN16, PN20, PN25):** Soğuk ve sıcak su tesisatları için dört farklı basınç sınıfında üretilen polipropilen borular. PN10 ve PN16 soğuk su, PN20 sıcak-soğuk su, PN25 (alüminyum folyo takviyeli) yüksek sıcaklık ve basınç uygulamaları için uygundur.
- **PPRC Ek Parçalar (Fittings):** Dirsek (45°, 87°), te, manson, redüksiyon, nipel, flanş, kör tapa, pislik tutucu ve geçiş parçaları dahil geniş fitting yelpazesi. Sıcak ve soğuk su sistemlerinde sızdırmaz birleşim sağlar.
- **PPRC Vanalar ve Küresel Vanalar:** Tam geçişli ve redüksiyonlu PPRC küresel vanalar. Sıcak su tesisatlarında akış kontrolü için uygun, uzun ömürlü ve bakım gerektirmeyen yapı.
- **PPRC Kaynak Aletleri ve Ekipmanları:** Boru kaynak makineleri (soket kaynak), trimmer, kalibrasyon aletleri ve kaynak aparatları. Profesyonel montaj için gerekli tüm ekipmanlar.
- **Alüminyum Folyolu PPRC Borular (PN25):** Alüminyum takviyeli, düşük ısıl genleşme katsayısına sahip özel borular. Yerden ısıtma kollektör bağlantıları ve yüksek sıcaklık uygulamaları için idealdir.
- **PPRC Manşon ve Kaplin Sistemleri:** Onarım ve bağlantı işlemleri için özel manşon ve kaplin çözümleri. Dişli ve flanşlı bağlantı seçenekleri ile farklı malzeme geçişlerine imkan tanır.
- **Endüstriyel PPRC Ürünler:** Kimya, gıda ve ilaç endüstrileri için özel PPRC boru ve fitting çözümleri. Kimyasallara dayanıklı yapısı ile agresif ortamlarda güvenli kullanım.

## Gül-tekin Mühendislik ile İlişkimiz

Gül-Tekin Mühendislik, Bodrum genelindeki mekanik ve sıhhi tesisat projelerinde Vesbo'nun kaliteli PPRC boru sistemlerini kullanarak müşterilerine modern, güvenilir ve uzun ömürlü çözümler sunmaktadır. Vesbo ürünlerinin yüksek sıcaklık dayanımı, korozyona karşı direnci ve kolay kaynak montajı, Bodrum'daki projelerde önemli avantaj sağlamaktadır. Özellikle yerden ısıtma sistemlerinde Vesbo alüminyum folyolu PPRC borular tercih edilmektedir.

## Bodrum'da Vesbo Uygulamaları

Bodrum'daki lüks villa ve konut projelerinde Vesbo PPRC boru sistemleri, sıcak-soğuk su tesisatlarında yaygın olarak kullanılmaktadır. Yerden ısıtma sistemlerinde Vesbo alüminyum folyolu borular ve manifold bağlantıları ile konforlu ve verimli ısıtma sağlanmaktadır. Bodrum'un kireçli su yapısına karşı kireçlenme yapmayan PPRC yapısı sayesinde, tesisat ömrü uzamakta ve bakım maliyetleri düşmektedir. Gümüşlük, Yalıkavak ve Turgutreis bölgelerindeki projelerde Vesbo ürünlerinin dayanıklılığı öne çıkmaktadır.
```

**c) Handle the `## İlgili Hizmetlerimiz` CardGroup:**

**If FN-019 has landed** (CardGroup with single "Yerden Isıtma Sistemleri" Card exists):
- Replace the existing CardGroup block with the expanded version:

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Yerden Isıtma Sistemleri" href="/hizmetlerimiz/yerden-isitma-sistemleri"></Card>
  <Card title="Mekanik Sıhhi Tesisat" href="/hizmetlerimiz/mekanik-sihhi-tesisat"></Card>
  <Card title="Su Depoları" href="/hizmetlerimiz/su-depolari"></Card>
  <Card title="Radyatör Sistemleri" href="/hizmetlerimiz/radyator"></Card>
</CardGroup>
```

**If FN-019 has NOT landed** (no CardGroup exists):
- After the `## 🌟 Yerden Isıtma Hizmetlerimiz` external link-card closing `</a>`, add a blank line and insert the same CardGroup block above.

**d) Add image placement HTML comment at the very end of the file:**

```
<!-- GÖRSEL ÖNERİSİ: Vesbo için Hakkında bölümünden sonra PPRC boru ve ek parça fotoğrafı
     eklenebilir. Kaynak: Vesbo resmi web sitesi veya katalogları.
     Dosya adı önerisi: images/markalar/vesbo-ppr-header.jpg -->
```

**e) Critical preservation check:** Verify that the `<div class="service-header-image">` block is still in the file exactly as it was before. If any accidental edit affected it, restore it immediately from git.

- [ ] Read current vesbo.mdx to confirm exact state — verify `service-header-image` is intact
- [ ] Rewrite frontmatter `description` (min 200 chars)
- [ ] Add `## Hakkında`, `## Ürün Grupları`, `## Gül-tekin Mühendislik ile İlişkimiz`, `## Bodrum'da Vesbo Uygulamaları` sections between intro paragraph and `## 🌟 Yerden Isıtma Hizmetlerimiz`
- [ ] Create or expand `## İlgili Hizmetlerimiz` CardGroup with Yerden Isıtma Sistemleri + Mekanik Sıhhi Tesisat + Su Depoları + Radyatör Sistemleri
- [ ] Add image placement HTML comment at end of file
- [ ] Verify `<div class="service-header-image">` is still intact and unchanged
- [ ] Verify ≥ 2000 bytes: `wc -c markalar/vesbo.mdx`

**Artifacts:**
- `markalar/vesbo.mdx` (modified — preserve service-header-image)

### Step 5: Testing & Verification

> ZERO test failures allowed. Content quality gate with MDX syntax validation.
> If keeping validation requirements green requires edits outside the initial File Scope, make those fixes as part of this task.

- [ ] **Byte count check:** Run `wc -c markalar/lg.mdx markalar/mega.mdx markalar/pimtas.mdx markalar/vesbo.mdx` and confirm ALL FOUR files are ≥ 2000 bytes
- [ ] **MDX syntax verification for ALL 4 files:**
  - Frontmatter YAML is properly wrapped in `---` delimiters
  - All `<CardGroup>` tags have matching `</CardGroup>` closing tags
  - All `<Card>` tags are properly closed (`<Card ...></Card>`)
  - No unclosed HTML tags in the body
- [ ] **Vesbo preservation check:** Read vesbo.mdx and verify:
  - `<div class="service-header-image">` is still at the top of the body after the `#` H1 heading
  - The `<img>` tag inside it is unchanged
  - No content was accidentally removed between the `service-header-image` and the intro paragraph
- [ ] **CardGroup link verification:** Confirm all `href` values in Card components point to existing files under `hizmetlerimiz/`:
  - `/hizmetlerimiz/isi-pompalari`
  - `/hizmetlerimiz/klima-sistemleri`
  - `/hizmetlerimiz/hidrofor-sistemleri`
  - `/hizmetlerimiz/pompalar`
  - `/hizmetlerimiz/tahliye-istasyonu`
  - `/hizmetlerimiz/yerden-isitma-sistemleri`
  - `/hizmetlerimiz/mekanik-sihhi-tesisat`
  - `/hizmetlerimiz/su-depolari`
  - `/hizmetlerimiz/sulama-sistemleri`
  - `/hizmetlerimiz/radyator`
- [ ] **Content structure check for ALL 4 files:** Each file must have:
  - `## Hakkında` section with founding story (yıl, merkez, sektör pozisyonu)
  - `## Ürün Grupları` section with detailed bullet list (min 5 product groups each, with descriptions)
  - `## Gül-tekin Mühendislik ile İlişkimiz` section describing the business relationship
  - `## Bodrum'da {Brand} Uygulamaları` section with locality names (Yalıkavak, Gümüşlük, Bitez, Türkbükü, Turgutreis, etc.)
  - `## İlgili Hizmetlerimiz` CardGroup with the correct service Cards
  - An HTML comment `<!-- GÖRSEL ÖNERİSİ: ... -->` documenting image placement opportunities
- [ ] **Existing content preservation:** Verify that original introductory paragraphs and external link-card sections (`## 🌟 ... Hizmetlerimiz` with `class="link-card featured"`) are preserved intact in all affected files
- [ ] **No icon on Cards:** Verify no `<Card>` component uses an `icon` attribute
- [ ] **No hardcoded prices:** Verify no price/fiyat data was added
- [ ] Fix all failures — if fixes require editing outside the declared File Scope, make those fixes anyway

### Step 6: Documentation & Delivery

- [ ] Save structured documentation summary via `fn_task_document_write(key="docs", ...)`:

**Document structure:**

```markdown
# FN-029 — ORTA SEVIYE MARKALAR - Grup C: Enrichment Summary

## FN-019 Merge State
- Detected state: {CardGroups present / CardGroups absent}
- Approach used: {expanded existing CardGroups / created CardGroups from scratch}

## Files Modified

### lg.mdx
- Byte count: 1308 → {final}
- Key additions: Hakkında, Ürün Grupları (7 groups), Gül-tekin İlişkimiz, Bodrum Uygulamaları, image comment
- CardGroup: {expanded/created} with 2 Cards (Isı Pompaları, Klima Sistemleri)
- Existing sections preserved: ✅ intro paragraph, ## 🌟 Isı Pompası Hizmetlerimiz

### mega.mdx
- Byte count: 1382 → {final}
- Key additions: Hakkında, Ürün Grupları (7 groups), Gül-tekin İlişkimiz, Bodrum Uygulamaları, image comment
- CardGroup: {expanded/created} with 3 Cards (Hidrofor Sistemleri, Pompalar, Tahliye İstasyonu)
- Existing sections preserved: ✅ intro paragraph, ## 🌟 Bodrum Hidrofor Hizmetlerimiz

### pimtas.mdx
- Byte count: 1020 → {final}
- Key additions: Hakkında, Ürün Grupları (7 groups), Gül-tekin İlişkimiz, Bodrum Uygulamaları, image comment
- CardGroup: created new with 4 Cards (Mekanik Sıhhi Tesisat, Sulama Sistemleri, Pompalar, Su Depoları)

### vesbo.mdx
- Byte count: 1498 → {final}
- Key additions: Hakkında, Ürün Grupları (7 groups), Gül-tekin İlişkimiz, Bodrum Uygulamaları, image comment
- CardGroup: {expanded/created} with 4 Cards (Yerden Isıtma Sistemleri, Mekanik Sıhhi Tesisat, Su Depoları, Radyatör Sistemleri)
- service-header-image preserved: ✅
- Existing sections preserved: ✅ intro paragraph, ## 🌟 Yerden Isıtma Hizmetlerimiz

## Verification Results
- [ ] All 4 files ≥ 2000 bytes
- [ ] All CardGroup/Card tags properly closed
- [ ] All href targets exist on disk
- [ ] All original external link-card sections preserved intact
- [ ] Vesbo service-header-image preserved
- [ ] All 4 files have image placement HTML comments
```
- [ ] Create any out-of-scope findings as new tasks via `fn_task_create`

## Documentation Requirements

**Must Update:**
- None — this task produces its output via `fn_task_document_write` only

**Check If Affected:**
- `markalar.mdx` — verify the index page still lists all 4 brand slugs (lg, mega, pimtas, vesbo)

## Completion Criteria

- [ ] All 4 brand pages enriched to ≥ 2000 bytes
- [ ] Each page has `## Hakkında` with founding story (yıl, merkez, sektör pozisyonu)
- [ ] Each page has `## Ürün Grupları` with detailed bullet-list descriptions (min 5 groups each)
- [ ] Each page has `## Gül-tekin Mühendislik ile İlişkimiz` describing the partnership
- [ ] Each page has `## Bodrum'da {Brand} Uygulamaları` with specific Bodrum locality names
- [ ] Each page has `## İlgili Hizmetlerimiz` with `<CardGroup>` containing the correct service Cards
  - lg.mdx: Isı Pompaları + Klima Sistemleri
  - mega.mdx: Hidrofor Sistemleri + Pompalar + Tahliye İstasyonu
  - pimtas.mdx: Mekanik Sıhhi Tesisat + Sulama Sistemleri + Pompalar + Su Depoları
  - vesbo.mdx: Yerden Isıtma Sistemleri + Mekanik Sıhhi Tesisat + Su Depoları + Radyatör Sistemleri
- [ ] vesbo.mdx: `<div class="service-header-image">` preserved intact and unchanged
- [ ] All existing `## 🌟 ... Hizmetlerimiz` external link-card sections are preserved intact
- [ ] Each page has an HTML comment `<!-- GÖRSEL ÖNERİSİ: ... -->` for image placement
- [ ] All MDX syntax is valid (frontmatter YAML, tags properly closed)
- [ ] All Card href targets point to existing service pages
- [ ] No Card uses the `icon` attribute
- [ ] No hardcoded price/fiyat data added
- [ ] Documentation summary saved via `fn_task_document_write`

## Service Pages Reference Table

Use these existing service pages for CardGroup links:

| Card title | href | Relevant for brands |
|---|---|---|
| Isı Pompaları | `/hizmetlerimiz/isi-pompalari` | lg |
| Klima Sistemleri | `/hizmetlerimiz/klima-sistemleri` | lg |
| Hidrofor Sistemleri | `/hizmetlerimiz/hidrofor-sistemleri` | mega |
| Pompalar | `/hizmetlerimiz/pompalar` | mega, pimtas |
| Tahliye İstasyonu | `/hizmetlerimiz/tahliye-istasyonu` | mega |
| Yerden Isıtma Sistemleri | `/hizmetlerimiz/yerden-isitma-sistemleri` | vesbo |
| Mekanik Sıhhi Tesisat | `/hizmetlerimiz/mekanik-sihhi-tesisat` | pimtas, vesbo |
| Sulama Sistemleri | `/hizmetlerimiz/sulama-sistemleri` | pimtas |
| Su Depoları | `/hizmetlerimiz/su-depolari` | pimtas, vesbo |
| Radyatör Sistemleri | `/hizmetlerimiz/radyator` | vesbo |

## Content Structure Template (apply to every page)

Every enriched page follows this structure:

```
---
title: "{Brand} {Product Category}"
description: "{Comprehensive 150-250 char description covering founding, specialization, and Gül-tekin relationship}"
---

# {Brand} {Product Category}

[Vesbo only: <div class="service-header-image">... PRESERVE INTACT]

{Existing intro paragraph — KEEP as-is, do not remove.}

## Hakkında

{2-3 paragraphs: founding year, headquarters, global/Turkish market position, sector leadership}

## Ürün Grupları

{Detailed bullet list of product groups with descriptions — min 5 groups}

## Gül-tekin Mühendislik ile İlişkimiz

{1-2 paragraphs: how Gül-tekin uses this brand's products in Bodrum projects}

## Bodrum'da {Brand} Uygulamaları

{1-2 paragraphs: specific Bodrum location/project types with locality names}

## 🌟 [External Link-Card Heading]  ← EXISTING — DO NOT MODIFY

<a href="..." target="_blank" rel="noopener noreferrer" class="link-card featured">  ← EXISTING — DO NOT MODIFY
  ...
</a>

## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="..." href="..."></Card>
  <Card title="..." href="..."></Card>
</CardGroup>

<!-- GÖRSEL ÖNERİSİ: ... -->
```

**For pimtas.mdx (no external link-cards):** The CardGroup and image comment are placed at the end of the file after the Bodrum'da Pimtaş Uygulamaları section.

## Image Placement Research Guidelines

For each brand, document via HTML comment at the end of the file:

```
<!-- GÖRSEL ÖNERİSİ: {Brand} için Hakkında bölümünden sonra ürün/brand fotoğrafı
     eklenebilir. Kaynak: {manufacturer website or catalog URL}.
     Dosya adı önerisi: images/markalar/{brand-slug}-header.jpg -->
```

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-029): complete Step N — enriched {brand}`
- **Bug fixes:** `fix(FN-029): description`
- **Final commit:** `feat(FN-029): enrich 4 mid-level brand pages (lg, mega, pimtas, vesbo)`

## Do NOT

- Remove, delete, or gut any existing content from the brand pages — only add and expand
- Modify or remove any existing `## 🌟 ... Hizmetlerimiz` external link-card sections — these must remain intact
- Add `icon` attribute to any `<Card>` component (per project convention)
- Change any files outside `markalar/*.mdx` unless a build/test failure requires it
- Remove, delete, or gut modules, settings, interfaces, exports, or test files outside the File Scope
- Add English content — all content must be in Turkish
- Create new service pages or modify service pages
- Leave any `<Card>` href pointing to a non-existent path
- Add hardcoded price/fiyat data (not appropriate for these brand pages)
- Remove or modify the `<div class="service-header-image">` on vesbo.mdx — this is a CRITICAL requirement
- Refuse necessary fixes just because they touch files outside the initial File Scope
- Commit without the task ID prefix

## Changeset Requirements

No changeset needed — this task only ADDS content to existing pages; it does not remove any existing functionality.
