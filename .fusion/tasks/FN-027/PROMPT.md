# Task: FN-027 — ORTA SEVIYE MARKALAR - Grup A: astral, beser, demirdokum, eca

**Created:** 2026-05-26
**Size:** M

## Review Level: 2 (Plan and Code)

**Assessment:** Expands 4 mid-level brand `.mdx` pages (currently 1397–1581 bytes each) to 2000+ bytes with structured Turkish content: brand history, detailed product categories, Gül-tekin relationship with Bodrum-specific application examples, and service page CardGroup links. Beser page has a critical title mismatch that must be corrected. Purely additive content work across 4 files in a single directory. No security concerns, fully reversible via git revert.
**Score:** 3/8 — Blast radius: 1, Pattern novelty: 1, Security: 0, Reversibility: 1

## Mission

Four mid-level brand pages in `markalar/` — **astral.mdx**, **beser.mdx**, **demirdokum.mdx**, and **eca.mdx** — currently sit at 1397–1581 bytes with only brief introductory paragraphs and (in some cases) external link-card sections and basic Hizmetler CardGroups. This task expands each page to a minimum of 2000 bytes with structured Turkish-language content: founding story (year, origin, market position), detailed product group listings with descriptions per category, the brand's relationship with Gül-tekin Mühendislik in Bodrum, Bodrum-specific application examples with locality names (Yalıkavak, Göltürkbükü, Bitez, Turgutreis, etc.), a relevant service page CardGroup (`## İlgili Hizmetlerimiz`), and an HTML comment documenting image placement opportunities. The enriched pages serve as credible standalone brand references for customers browsing Gül-tekin Mühendislik's partner portfolio. **Critical fix:** The beser.mdx frontmatter title and H1 heading say "Beşer Akıllı Oda Termostatları" but the brand specializes in **su depoları** (water tanks) — this must be corrected to "Beşer Su Depoları".

**Important relationship with FN-019:** FN-019 (in-review) adds a `## İlgili Hizmetlerimiz` CardGroup section to **demirdokum.mdx** and **eca.mdx** (with a single "Isı Pompaları" Card each). This task preserves those sections and expands them with additional relevant service Cards. For **astral.mdx** and **beser.mdx** (NOT covered by FN-019), this task creates new `## İlgili Hizmetlerimiz` sections from scratch.

## Dependencies

- **Task:** FN-019 (adds `## İlgili Hizmetlerimiz` CardGroups to demirdokum.mdx and eca.mdx — must be complete for this task to expand those sections without conflicts)

## Context to Read First

- `markalar/grundfos.mdx` — reference for well-developed brand page with structured sections (Hakkında → model tables → Hizmetler CardGroup → external link-cards → İlgili Hizmetlerimiz)
- `markalar/baymak.mdx` — reference for highly detailed brand page with Ürün Grupları, Teknolojik Özellikler, Sertifikalar sections
- `markalar/toshiba.mdx` — reference for a brand page that already has structured content sections (Hakkında, Teknik Özellikler, Ürün Grupları)
- `hizmetlerimiz/su-aritma-sistemleri.mdx` — reference for `<CardGroup>` / `<Card>` syntax
- `custom.css` — existing CSS classes for link-card, badge, brand-grid used elsewhere

**After FN-019 completes, these pages should have `## İlgili Hizmetlerimiz` CardGroups already present:**
- `markalar/demirdokum.mdx` — should have `<Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari">`
- `markalar/eca.mdx` — should have `<Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari">`

## File Scope

- `markalar/astral.mdx` (modified — major content expansion + new İlgili Hizmetlerimiz section)
- `markalar/beser.mdx` (modified — title fix + major content expansion + new İlgili Hizmetlerimiz section)
- `markalar/demirdokum.mdx` (modified — major content expansion + expand existing İlgili Hizmetlerimiz)
- `markalar/eca.mdx` (modified — major content expansion + expand existing İlgili Hizmetlerimiz)

## Steps

### Step 0: Preflight

- [ ] Verify FN-019 is in "done" or "in-review" column — read demirdokum.mdx and eca.mdx to confirm `## İlgili Hizmetlerimiz` CardGroups exist
- [ ] Verify all 4 target `.mdx` files exist under `markalar/`
- [ ] Read each file to confirm current state (byte count, content structure, frontmatter)
- [ ] Run `wc -c markalar/astral.mdx markalar/beser.mdx markalar/demirdokum.mdx markalar/eca.mdx` to record baseline sizes
- [ ] Verify all service pages referenced in CardGroups exist:
  - `hizmetlerimiz/isi-pompalari.mdx`
  - `hizmetlerimiz/pompalar.mdx`
  - `hizmetlerimiz/sulama-sistemleri.mdx`
  - `hizmetlerimiz/hidrofor-sistemleri.mdx`
  - `hizmetlerimiz/su-depolari.mdx`
  - `hizmetlerimiz/radyator.mdx`
  - `hizmetlerimiz/klima-sistemleri.mdx`
  - `hizmetlerimiz/termosifonik-sistemler.mdx`
  - `hizmetlerimiz/yerden-isitma-sistemleri.mdx`

### Step 1: Enrich astral.mdx

**Brand context:** AstralPool (Fluidra grubu), İspanya merkezli (Valencia), 50 yıla yakın geçmiş. Yüzme havuzu, spa ve sağlıklı yaşam ekipmanlarında dünya lideri. Geniş ürün yelpazesi: pompalar, filtreler, temizlik ekipmanları, aydınlatma, ısı pompaları, dezenfeksiyon sistemleri.

**Current state:**
- Byte count: 1581 bytes
- Has intro paragraph mentioning "50 yıla yakın tecrübe"
- Has `## 🌟 Isı Pompası Hizmetlerimiz` external link-card
- Has `## Hizmetler` section with CardGroup (Isı Pompaları, Pompalar, Sulama Sistemleri)
- Missing: detailed founding story, Ürün Grupları section, Gül-tekin relationship section with Bodrum examples, image placement comment

#### Changes:

**a) Rename `## Hizmetler` to `## İlgili Hizmetlerimiz` and expand the CardGroup**

The existing `## Hizmetler` section has:
```
<CardGroup>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
  <Card title="Sulama Sistemleri" href="/hizmetlerimiz/sulama-sistemleri"></Card>
</CardGroup>
```

Replace the heading `## Hizmetler` with `## İlgili Hizmetlerimiz` and expand the CardGroup to include additional relevant service:
```
<CardGroup>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
  <Card title="Sulama Sistemleri" href="/hizmetlerimiz/sulama-sistemleri"></Card>
  <Card title="Hidrofor Sistemleri" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
</CardGroup>
```

**b) Add structured content sections** — Insert new sections AFTER the existing intro paragraph (the paragraph starting with "AstralPool, yüzme havuzu...") and BEFORE the `## 🌟 Isı Pompası Hizmetlerimiz` external link-card section. Add these sections in this order:

```
## Hakkında

AstralPool, İspanya'nın Valencia kentinde kurulmuş, 50 yılı aşkın süredir yüzme havuzu, spa ve sağlıklı yaşam merkezi ekipmanları alanında faaliyet gösteren dünya lideri bir markadır. Fluidra çatısı altında faaliyet gösteren AstralPool, suyun kontrolü ve arıtılmasından, pompa ve filtrelere, temizlik aksesuarlarından iklimlendirme ekipmanlarına kadar her türlü havuz ihtiyacını karşılamaktadır. Global dağıtım ağı ve yenilikçi ürün gamı ile sektörde referans kabul edilmektedir.

## Ürün Grupları

- **Havuz Pompaları (Victoria, Saphir Serisi):** Yüksek verimli, sessiz çalışan ve enerji tasarruflu havuz sirkülasyon pompaları. Farklı havuz boyutlarına uygun debi ve basınç seçenekleri sunar.
- **Filtrasyon Sistemleri:** Kum filtreleri ve kartuş filtreler ile havuz suyunun sürekli temiz kalmasını sağlar. Otomatik geri yıkama özellikli modeller mevcuttur.
- **Havuz Temizlik Ekipmanları:** Otomatik havuz süpürgeleri, dip süpürgeleri, el aletleri ve fırçalar ile havuz bakımını kolaylaştıran geniş ürün yelpazesi.
- **Havuz Aydınlatma Sistemleri:** LED teknolojili dekoratif ve fonksiyonel havuz aydınlatmaları. Renk değiştiren ve enerji verimli RGB modeller.
- **Havuz Isı Pompaları:** Havuz suyunu ekonomik bir şekilde ısıtan, inverter teknolojili ve yüksek COP değerli ısı pompaları. Sezon boyunca konforlu yüzme sıcaklığı sağlar.
- **Dezenfeksiyon Sistemleri:** Klor, tuz (elektroliz) ve ozon bazlı dezenfeksiyon çözümleri ile hijyenik havuz suyu yönetimi.
- **Havuz Kaplama ve Aksesuarlar:** Havuz örtüleri, merdivenler, tırabzanlar, temizlik setleri ve yedek parçalar.

## Gül-tekin Mühendislik ile İlişkimiz

Gül-Tekin Mühendislik, Bodrum yarımadasındaki lüks villa ve otel havuz projelerinde AstralPool marka ekipmanları kullanarak müşterilerine uzun ömürlü, verimli ve teknolojik havuz sistemleri kurmaktadır. AstralPool'un geniş ürün yelpazesi sayesinde, Bodrum'un çeşitli projelerinde pompa seçiminden filtrasyona, aydınlatmadan ısıtmaya kadar entegre çözümler sunulmaktadır. Özellikle yaz sezonunda yoğun kullanılan otel havuzlarında AstralPool ekipmanlarının güvenilirliği ve düşük bakım gereksinimi öne çıkmaktadır.

## Bodrum'da AstralPool Uygulamaları

Bodrum'daki lüks villa projelerinde AstralPool Victoria serisi pompalar ve kum filtreleri yaygın olarak kullanılmaktadır. Yalıkavak ve Göltürkbükü bölgesindeki butik otel havuzlarında AstralPool ısı pompaları ile havuz suyu sıcaklık yönetimi sağlanmaktadır. Ayrıca Bodrum'un sert su yapısına uygun dezenfeksiyon sistemleri ile havuz suyu kalitesi korunmaktadır.
```

**c) Add HTML comment for image placement at the very end of the file:**

```
<!-- GÖRSEL ÖNERİSİ: AstralPool için Hakkında bölümünden sonra ürün/brand fotoğrafı eklenebilir.
     Kaynak: https://www.fluidra.com/ veya https://www.astralpool.com/.
     Dosya adı önerisi: images/markalar/astral-header.jpg -->
```

- [ ] Read current astral.mdx to confirm exact state
- [ ] Add `## Hakkında`, `## Ürün Grupları`, `## Gül-tekin Mühendislik ile İlişkimiz`, `## Bodrum'da AstralPool Uygulamaları` sections between the intro paragraph and the `## 🌟 Isı Pompası Hizmetlerimiz` section
- [ ] Rename `## Hizmetler` to `## İlgili Hizmetlerimiz` and expand the CardGroup to include Hidrofor Sistemleri
- [ ] Add image placement HTML comment at end of file
- [ ] Verify ≥ 2000 bytes: `wc -c markalar/astral.mdx`

**Artifacts:**
- `markalar/astral.mdx` (modified)

### Step 2: Fix beser.mdx title & enrich content

**CRITICAL — Title mismatch:** Current frontmatter `title:` is "Beşer Akıllı Oda Termostatları" and `#` H1 heading is "Beşer Akıllı Oda Termostatları". The brand specializes in **polyester ve polietilen su depoları** (water tanks), not thermostats. The frontmatter `description:` correctly describes water tanks. The existing Hizmetler section links to "Su Depoları" service page, confirming the brand's actual focus.

**Brand context:** Beşer, polyester ve polietilen su deposu üretiminde uzman Türk markası. Toprak altı ve toprak üstü kullanıma uygun depolar. 100 litreden tonluk tanklara kadar geniş kapasite yelpazesi.

**Current state:**
- Byte count: 1421 bytes
- Title/heading says "Beşer Akıllı Oda Termostatları" (WRONG)
- Body content correctly describes su depoları (water tanks)
- Has `## 🌟 Su Deposu Hizmetlerimiz` external link-card
- Has `## Hizmetler` section with CardGroup (Su Depoları)
- Missing: correct title, detailed founding story, Ürün Grupları, Gül-tekin relationship with Bodrum examples, image comment

#### Changes:

**a) Fix frontmatter title** — Change:
```
title: "Beşer Akıllı Oda Termostatları"
```
to:
```
title: "Beşer Su Depoları"
```

**b) Fix frontmatter description** — The current description says "Beşer, özellikle polyester ve polietilen su depoları ile tanınan bir markadır..." — this is correct content-wise but needs expanding. Rewrite as a comprehensive 200+ char description covering founding, specialization, and Gül-tekin relationship:

```
description: "Beşer, polyester ve polietilen su depoları üretiminde uzmanlaşmış Türk markasıdır. Toprak altı ve toprak üstü kullanıma uygun, çeşitli boyutlarda ve yüksek kaliteli su depoları üreterek su kesintilerine karşı güvenilir çözümler sunmaktadır. Gül-Tekin Mühendislik, Bodrum genelinde Beşer su deposu sistemlerinin kurulumu ve bakım hizmetlerini sağlamaktadır."
```

**c) Fix H1 heading** — Change:
```
# Beşer Akıllı Oda Termostatları
```
to:
```
# Beşer Su Depoları
```

**d) Rename `## Hizmetler` to `## İlgili Hizmetlerimiz` and expand the CardGroup**

The existing section:
```
## Hizmetler

<CardGroup>
  <Card title="Su Depoları" href="/hizmetlerimiz/su-depolari"></Card>
</CardGroup>
```

Change to:
```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Su Depoları" href="/hizmetlerimiz/su-depolari"></Card>
  <Card title="Hidrofor Sistemleri" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
  <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
</CardGroup>
```

**e) Add structured content sections** — Insert new sections AFTER the existing intro paragraph and BEFORE the `## 🌟 Su Deposu Hizmetlerimiz` external link-card section. Add in this order:

```
## Hakkında

Beşer, polyester ve polietilen su depoları üretiminde uzmanlaşmış, Türkiye merkezli bir markadır. Toprak altı ve toprak üstü kullanıma uygun depo çözümleri sunan Beşer, geniş kapasite yelpazesi (100 litreden tonluk endüstriyel tanklara) ve yüksek kalite standartları ile sektörde güvenilir bir konuma sahiptir. Sağlam ve dayanıklı yapısıyla, su kesintilerine karşı güvenilir bir çözüm sunarken, uzun ömürlü kullanım avantajı sağlamaktadır.

## Ürün Grupları

- **Polietilen Su Depoları (Dikey/Yatay):** Gıdaya uygun polietilen malzemeden üretilen, dikey ve yatay montaj seçenekli depolar. UV dayanıklı, paslanmaz ve hafif yapılarıyla kolay taşınabilir. 100 lt'den 10.000 lt'ye kadar çeşitli boyut seçenekleri.
- **Polyester Su Depoları:** Cam elyaf takviyeli polyesterden üretilen, yüksek dayanıklılıklı endüstriyel ve konut tipi depolar. Kimyasallara dayanıklı, yalıtımlı ve uzun ömürlü yapısıyla öne çıkar.
- **Toprak Altı Su Depoları:** Bahçe, arazi ve otopark altlarına gömme montaj için tasarlanmış, yüksek basınç dayanımlı özel depolar. Estetik kaygı olmadan su depolama imkanı sağlar.
- **Yangın Suyu Depoları:** Yangın yönetmeliklerine uygun, acil durum için yeterli su kapasitesini sağlayan özel depolama çözümleri.
- **Depo Aksesuarları:** Şamandıralı vanalar, seviye göstergeleri, taşma ağızları, çıkış vanaları ve bağlantı ekipmanları.

## Gül-tekin Mühendislik ile İlişkimiz

Gül-Tekin Mühendislik, Bodrum yarımadasındaki villa, site ve ticari tesislerde Beşer su deposu sistemlerinin kurulum ve bakım hizmetlerini sunmaktadır. Bodrum'un yaz aylarında artan su talebine karşı, Beşer depoları ile su kesintilerine karşı güvenilir çözümler sağlanmaktadır. Toprak altı depolama seçenekleri sayesinde, estetik kaygı olmadan villa bahçelerinde ve site peyzaj alanlarında depolama yapılabilmektedir.

## Bodrum'da Beşer Uygulamaları

Bodrum'da yamaç villalarında ve sitelerde Beşer su depoları, su kesintilerine karşı güvenilir bir çözüm sunmaktadır. Toprak altı depolama çözümleri ile villaların görünümünü bozmadan yüzlerce litre su depolanabilmektedir. Ayrıca ticari tesislerde ve otellerde Beşer'in büyük kapasiteli depo çözümleri tercih edilmektedir. Akşam saatlerinde su basıncının düştüğü bölgelerde, Beşer depoları ve hidrofor sistemleri entegrasyonu ile sabit su basıncı sağlanmaktadır.
```

**f) Add image placement HTML comment at the very end of the file:**

```
<!-- GÖRSEL ÖNERİSİ: Beşer için Hakkında bölümünden sonra su deposu fotoğrafı eklenebilir.
     Kaynak: Beşer resmi web sitesi veya yetkili distribütör.
     Dosya adı önerisi: images/markalar/beser-header.jpg -->
```

- [ ] Read current beser.mdx to confirm exact state — document the incorrect title and description
- [ ] Fix frontmatter `title:` — change from "Beşer Akıllı Oda Termostatları" to "Beşer Su Depoları"
- [ ] Fix frontmatter `description:` — rewrite as a comprehensive 200+ char description
- [ ] Fix `#` H1 heading — change from "Beşer Akıllı Oda Termostatları" to "Beşer Su Depoları"
- [ ] Add `## Hakkında`, `## Ürün Grupları`, `## Gül-tekin Mühendislik ile İlişkimiz`, `## Bodrum'da Beşer Uygulamaları` sections
- [ ] Rename `## Hizmetler` to `## İlgili Hizmetlerimiz` and expand the CardGroup
- [ ] Add image placement HTML comment at end of file
- [ ] Verify NO remaining reference to "Akıllı Oda Termostatları" or "termostat" in frontmatter title, H1 heading, or body content (the body should already be correct — just confirm)
- [ ] Verify ≥ 2000 bytes: `wc -c markalar/beser.mdx`

**Artifacts:**
- `markalar/beser.mdx` (modified — title fix + enrichment)

### Step 3: Enrich demirdokum.mdx

**Brand context:** Demirdöküm, 1954 yılında Türkiye'de kurulmuş, ısıtma, su ısıtma ve iklimlendirme sektörlerinde faaliyet gösteren köklü bir marka. Vaillant Group çatısı altındadır. Ürünleri: yoğuşmalı kombiler, panel radyatörler, termosifonlar, klimalar, kazanlar.

**Current state:**
- Byte count: 1397 bytes
- Has intro paragraph mentioning "1954 yılından bu yana"
- Has `## 🌟 Isı Pompası Hizmetlerimiz` external link-card
- **No** existing `## Hizmetler` or `## İlgili Hizmetlerimiz` section
- FN-019 will have added a `## İlgili Hizmetlerimiz` section with a single "Isı Pompaları" Card after the external link-card
- Missing: detailed product groups, Gül-tekin relationship section, Bodrum application examples, expanded CardGroup, image comment

#### Changes:

**a) Expand the existing `## İlgili Hizmetlerimiz` CardGroup** (added by FN-019 after the `## 🌟 Isı Pompası Hizmetlerimiz` external link-card)

Replace the existing CardGroup (with one Card for Isı Pompaları) with this expanded version:

```
<CardGroup>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Radyatör Sistemleri" href="/hizmetlerimiz/radyator"></Card>
  <Card title="Yerden Isıtma Sistemleri" href="/hizmetlerimiz/yerden-isitma-sistemleri"></Card>
  <Card title="Termosifonik Sistemler" href="/hizmetlerimiz/termosifonik-sistemler"></Card>
</CardGroup>
```

**b) Add structured content sections** — Insert new sections AFTER the existing intro paragraph (starting with "Demirdöküm, 1954 yılından bu yana...") and BEFORE the `## 🌟 Isı Pompası Hizmetlerimiz` section. Add in this order:

```
## Hakkında

Demirdöküm, 1954 yılında Türkiye'de kurulmuş, ısıtma, su ısıtma ve iklimlendirme sektörlerinde faaliyet gösteren en köklü markalardan biridir. İstanbul merkezli olan şirket, Vaillant Group çatısı altında faaliyetlerini sürdürmektedir. Kombi, radyatör, termosifon ve klima pazarlarında Türkiye'nin lider üreticilerinden biri olan Demirdöküm, geniş ürün yelpazesi ve yaygın servis ağı ile tanınmaktadır.

## Ürün Grupları

- **Yoğuşmalı Kombiler (Premix, Nitromix Serileri):** Yüksek verimli, düşük emisyonlu yoğuşma teknolojisi ile çalışan kombiler. Enerji tasarrufu sağlayan modülasyonlu brülör ve geniş modülasyon aralığı sayesinde hem konforlu hem de ekonomik ısıtma sunar.
- **Panel Radyatörler:** Farklı ebat ve güç seçenekleri ile her türlü mekana uygun panel radyatör çeşitleri. Yüksek ısı çıkışı ve estetik tasarımı ile öne çıkar.
- **Termosifonler:** Elektrikli ve gazlı termosifon modelleri ile kullanım sıcak suyu ihtiyacını karşılayan, emniyetli ve enerji verimli cihazlar.
- **Klimalar:** Split ve multi-split klima sistemleri ile yaz aylarında soğutma, kış aylarında ısıtma çözümü sunar. Inverter teknolojili modeller enerji verimliliği sağlar.
- **Merkezi Isıtma Kazanları:** Apartman ve ticari binalar için tasarlanmış, yüksek kapasiteli merkezi ısıtma kazanları.
- **Isı Pompaları:** Hava kaynaklı ısı pompaları ile yenilenebilir enerji kaynaklarını kullanarak hem ısıtma hem de soğutma sağlayan çevre dostu çözümler.

## Gül-tekin Mühendislik ile İlişkimiz

Gül-Tekin Mühendislik, Bodrum'daki villa ve konut projelerinde Demirdöküm kombi, radyatör ve ısıtma sistemlerini kullanarak müşterilerine konforlu ve güvenilir ısıtma çözümleri sunmaktadır. Demirdöküm'ün geniş ürün yelpazesi sayesinde, her projenin ihtiyacına uygun kombi ve radyatör seçenekleri değerlendirilmektedir. Türkiye genelinde yaygın satış sonrası servis ağı, Bodrum'daki müşterilerimiz için de hızlı ve etkili destek sağlamaktadır.

## Bodrum'da Demirdöküm Uygulamaları

Bodrum yarımadasında, özellikle Yalıkavak, Gümüşlük, Türkbükü ve Bitez bölgelerindeki kışlık konut projelerinde Demirdöküm kombi ve radyatör sistemleri yaygın olarak kullanılmaktadır. Bodrum'un ılıman kış koşullarında Demirdöküm kombiler yüksek verimle çalışırken, yaz aylarında klima sistemleri ile soğutma ihtiyacını karşılamaktadır. Ayrıca, yenileme projelerinde eski kombi ve radyatörlerin Demirdöküm ürünlerle değişimi sıkça tercih edilmektedir.
```

**c) Add image placement HTML comment at the very end of the file:**

```
<!-- GÖRSEL ÖNERİSİ: Demirdöküm için Hakkında bölümünden sonra ürün fotoğrafı (kombi/radyatör)
     eklenebilir. Kaynak: https://www.demirdokum.com.tr/.
     Dosya adı önerisi: images/markalar/demirdokum-header.jpg -->
```

- [ ] Read current demirdokum.mdx to confirm exact state and find the `## İlgili Hizmetlerimiz` section added by FN-019
- [ ] Add `## Hakkında`, `## Ürün Grupları`, `## Gül-tekin Mühendislik ile İlişkimiz`, `## Bodrum'da Demirdöküm Uygulamaları` sections between intro paragraph and `## 🌟 Isı Pompası Hizmetlerimiz`
- [ ] Expand the existing `## İlgili Hizmetlerimiz` CardGroup to include Radyatör Sistemleri, Yerden Isıtma Sistemleri, Termosifonik Sistemler
- [ ] Add image placement HTML comment at end of file
- [ ] Verify ≥ 2000 bytes: `wc -c markalar/demirdokum.mdx`

**Artifacts:**
- `markalar/demirdokum.mdx` (modified — content enriched + CardGroup expanded)

### Step 4: Enrich eca.mdx

**Brand context:** E.C.A. (Ege Cihaz A.Ş.), 35 yılı aşkın süredir Türkiye'de ısıtma, soğutma ve iklimlendirme sektörlerinde faaliyet gösteren köklü bir marka. Ürünleri: yoğuşmalı kombiler, split klimalar, radyatörler, termosifonlar, merkezi ısıtma sistemleri, vana ve armatürler, ısı pompaları, hidroforlar.

**Current state:**
- Byte count: 1434 bytes
- Has intro paragraph mentioning "35 yılı aşkın süredir"
- Has `## 🌟 Isı Pompası Hizmetlerimiz` external link-card
- **No** existing `## Hizmetler` or `## İlgili Hizmetlerimiz` section
- FN-019 will have added a `## İlgili Hizmetlerimiz` section with a single "Isı Pompaları" Card after the external link-card
- Missing: detailed product groups, Gül-tekin relationship section, Bodrum application examples, expanded CardGroup, image comment

#### Changes:

**a) Expand the existing `## İlgili Hizmetlerimiz` CardGroup** (added by FN-019)

Replace the existing CardGroup (with one Card for Isı Pompaları) with this expanded version:

```
<CardGroup>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Klima Sistemleri" href="/hizmetlerimiz/klima-sistemleri"></Card>
  <Card title="Radyatör Sistemleri" href="/hizmetlerimiz/radyator"></Card>
  <Card title="Termosifonik Sistemler" href="/hizmetlerimiz/termosifonik-sistemler"></Card>
  <Card title="Hidrofor Sistemleri" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
</CardGroup>
```

**b) Add structured content sections** — Insert new sections AFTER the existing intro paragraph (starting with "E.C.A., 35 yılı aşkın süredir...") and BEFORE the `## 🌟 Isı Pompası Hizmetlerimiz` section. Add in this order:

```
## Hakkında

E.C.A. (Ege Cihaz A.Ş.), 35 yılı aşkın süredir Türkiye'de ısıtma, soğutma ve iklimlendirme sektörlerinde faaliyet gösteren köklü bir mühendislik markasıdır. İstanbul merkezli olan şirket, Ar-Ge yatırımları ve teknolojik altyapısı ile sektörde öncü konumdadır. Geniş ürün yelpazesi, modern tasarımları, enerji verimliliği ve çevre dostu yaklaşımlarıyla öne çıkan E.C.A. ürünleri, hem bireysel hem de kurumsal müşterilere yönelik çözümler sunmaktadır.

## Ürün Grupları

- **Yoğuşmalı Kombiler:** Yüksek verimli, düşük emisyonlu yoğuşma teknolojisi ile donatılmış kombi serileri. Enerji tasarrufunu maksimize eden geniş modülasyon aralığı ve kullanıcı dostu kontrol panelleri ile konforlu ısıtma sağlar.
- **Split ve Multi-Split Klimalar:** Inverter teknolojili, yüksek COP/EER değerlerine sahip klima sistemleri. Sessiz çalışma, iyonizer hava temizleme ve WiFi kontrol gibi özellikler sunar.
- **Radyatörler:** Farklı ebat ve güç seçenekleri ile her tip mekana uygun panel radyatör çözümleri. Yüksek ısı çıkışı ve şık tasarım.
- **Termosifonler:** Elektrikli ve gazlı termosifon çeşitleri ile güvenli, verimli ve kesintisiz kullanım sıcak suyu.
- **Merkezi Isıtma ve Kazan Sistemleri:** Apartman, site ve ticari binalar için projelendirilen yüksek kapasiteli ısıtma çözümleri.
- **Vana ve Armatürler:** Isıtma tesisatlarında kullanılan küresel vanalar, termostatik vanalar, kolektörler ve bağlantı elemanları.
- **Hidrofor Sistemleri:** Konut ve ticari yapılar için su basınçlandırma çözümleri. Frekans kontrollü ve sabit hızlı modeller.
- **Isı Pompaları:** Hava kaynaklı ısı pompaları ile yenilenebilir enerji kullanarak hem ısıtma hem soğutma sağlayan çevre dostu çözümler.

## Gül-tekin Mühendislik ile İlişkimiz

Gül-Tekin Mühendislik, Bodrum'daki villa ve konut projelerinde E.C.A. kombi, klima, radyatör ve hidrofor sistemlerini kullanarak müşterilerine konforlu, güvenilir ve enerji tasarruflu iklimlendirme çözümleri sunmaktadır. E.C.A.'nın geniş ürün gamı, her projenin özel ihtiyaçlarına uygun seçenekler sunarken, yaygın servis ağı hızlı destek imkanı sağlamaktadır. Modern konut projelerinde E.C.A. klima ve iklimlendirme çözümleri sıklıkla tercih edilmektedir.

## Bodrum'da ECA Uygulamaları

Bodrum yarımadasında, özellikle Bitez, Gümbet ve Bodrum merkezdeki konut projelerinde E.C.A. kombi ve klima sistemleri yaygın olarak kullanılmaktadır. Yaz aylarında klima sistemleri ile etkili soğutma, kış aylarında kombi ve radyatörler ile konforlu ısıtma sağlanmaktadır. Ayrıca, Bodrum'un yamaç bölgelerindeki villalarda E.C.A. hidrofor sistemleri su basıncı sorunlarına çözüm sunmaktadır. Yenileme projelerinde eski kombi ve klima sistemlerinin E.C.A. ürünlerle değişimi sıkça yapılmaktadır.
```

**c) Add image placement HTML comment at the very end of the file:**

```
<!-- GÖRSEL ÖNERİSİ: ECA için Hakkında bölümünden sonra ürün fotoğrafı (kombi/klima)
     eklenebilir. Kaynak: https://www.eca.com.tr/.
     Dosya adı önerisi: images/markalar/eca-header.jpg -->
```

- [ ] Read current eca.mdx to confirm exact state and find the `## İlgili Hizmetlerimiz` section added by FN-019
- [ ] Add `## Hakkında`, `## Ürün Grupları`, `## Gül-tekin Mühendislik ile İlişkimiz`, `## Bodrum'da ECA Uygulamaları` sections between intro paragraph and `## 🌟 Isı Pompası Hizmetlerimiz`
- [ ] Expand the existing `## İlgili Hizmetlerimiz` CardGroup to include Klima Sistemleri, Radyatör Sistemleri, Termosifonik Sistemler, Hidrofor Sistemleri
- [ ] Add image placement HTML comment at end of file
- [ ] Verify ≥ 2000 bytes: `wc -c markalar/eca.mdx`

**Artifacts:**
- `markalar/eca.mdx` (modified — content enriched + CardGroup expanded)

### Step 5: Testing & Verification

> ZERO test failures allowed. Content quality gate with MDX syntax validation.
> If keeping validation requirements green requires edits outside the initial File Scope, make those fixes as part of this task.

- [ ] **Byte count check:** Run `wc -c markalar/astral.mdx markalar/beser.mdx markalar/demirdokum.mdx markalar/eca.mdx` and confirm ALL FOUR files are ≥ 2000 bytes
- [ ] **Beser title fix verification:** Read `markalar/beser.mdx` frontmatter and confirm:
  - `title:` is "Beşer Su Depoları" (NOT "Beşer Akıllı Oda Termostatları")
  - `#` H1 heading is "Beşer Su Depoları" (NOT "Beşer Akıllı Oda Termostatları")
  - No remaining reference to "termostat" in title or H1
- [ ] **MDX syntax verification for ALL 4 files:**
  - Frontmatter YAML is properly wrapped in `---` delimiters
  - All `<CardGroup>` tags have matching `</CardGroup>` closing tags
  - All `<Card>` tags are properly closed (`<Card ...></Card>`)
  - No unclosed HTML tags in the body
  - The external link-card `## 🌟 ... Hizmetlerimiz` sections with `class="link-card featured"` are STILL INTACT and unchanged
- [ ] **CardGroup link verification:** Confirm all `href` values in Card components point to existing files under `hizmetlerimiz/`:
  - `/hizmetlerimiz/isi-pompalari` → verify exists
  - `/hizmetlerimiz/pompalar` → verify exists
  - `/hizmetlerimiz/sulama-sistemleri` → verify exists
  - `/hizmetlerimiz/hidrofor-sistemleri` → verify exists
  - `/hizmetlerimiz/su-depolari` → verify exists
  - `/hizmetlerimiz/radyator` → verify exists
  - `/hizmetlerimiz/klima-sistemleri` → verify exists
  - `/hizmetlerimiz/termosifonik-sistemler` → verify exists
  - `/hizmetlerimiz/yerden-isitma-sistemleri` → verify exists
- [ ] **Content structure check for ALL 4 files:** Each file must have:
  - `## Hakkında` section with founding story (yıl, merkez, sektör pozisyonu)
  - `## Ürün Grupları` section with detailed bullet list (min 4 product groups each, each with description)
  - `## Gül-tekin Mühendislik ile İlişkimiz` section describing the business relationship
  - `## Bodrum'da {Brand} Uygulamaları` section with locality names (Yalıkavak, Gümüşlük, Bitez, Türkbükü, etc.)
  - `## İlgili Hizmetlerimiz` CardGroup with corrected service Cards
  - An HTML comment `<!-- GÖRSEL ÖNERİSİ: ... -->` documenting image placement opportunities
- [ ] **Existing content preservation:** Verify that original introductory paragraphs and external link-card sections (`## 🌟 ... Hizmetlerimiz` with `class="link-card featured"`) are preserved intact in all 4 files
- [ ] Fix all failures — if fixes require editing outside the declared File Scope, make those fixes anyway

### Step 6: Documentation & Delivery

- [ ] Save structured documentation summary via `fn_task_document_write(key="docs", ...)`:

**Document structure:**

```markdown
# FN-027 — ORTA SEVIYE MARKALAR - Grup A: Enrichment Summary

## Files Modified

### astral.mdx
- Byte count: {initial} → {final}
- Key additions: Hakkında, Ürün Grupları (7 groups), Gül-tekin İlişkimiz, Bodrum Uygulamaları, image comment
- Renamed: Hizmetler → İlgili Hizmetlerimiz (expanded to 4 Cards)
- Service links: Isı Pompaları, Pompalar, Sulama Sistemleri, Hidrofor Sistemleri

### beser.mdx
- Byte count: {initial} → {final}
- Title FIXED: "Beşer Akıllı Oda Termostatları" → "Beşer Su Depoları"
- Key additions: Hakkında, Ürün Grupları (5 groups), Gül-tekin İlişkimiz, Bodrum Uygulamaları, image comment
- Renamed: Hizmetler → İlgili Hizmetlerimiz (expanded to 3 Cards)
- Service links: Su Depoları, Hidrofor Sistemleri, Pompalar

### demirdokum.mdx
- Byte count: {initial} → {final}
- Key additions: Hakkında, Ürün Grupları (6 groups), Gül-tekin İlişkimiz, Bodrum Uygulamaları, image comment
- Expanded İlgili Hizmetlerimiz (from FN-019's 1 Card → 4 Cards)
- Service links: Isı Pompaları, Radyatör Sistemleri, Yerden Isıtma Sistemleri, Termosifonik Sistemler

### eca.mdx
- Byte count: {initial} → {final}
- Key additions: Hakkında, Ürün Grupları (8 groups), Gül-tekin İlişkimiz, Bodrum Uygulamaları, image comment
- Expanded İlgili Hizmetlerimiz (from FN-019's 1 Card → 5 Cards)
- Service links: Isı Pompaları, Klima Sistemleri, Radyatör Sistemleri, Termosifonik Sistemler, Hidrofor Sistemleri

## Verification Results
- [ ] All 4 files ≥ 2000 bytes
- [ ] Beser title fix confirmed (no "Termostat" in title or H1)
- [ ] All CardGroup/Card tags properly closed
- [ ] All href targets exist on disk
- [ ] All original external link-card sections preserved intact
- [ ] All 4 files have image placement HTML comments
```

- [ ] Create any out-of-scope findings as new tasks via `fn_task_create`

## Documentation Requirements

**Must Update:**
- None — this task produces its output via `fn_task_document_write` only

**Check If Affected:**
- `markalar.mdx` — verify the index page still lists all 4 brand slugs (astral, beser, demirdokum, eca)

## Completion Criteria

- [ ] All 4 brand pages enriched to ≥ 2000 bytes
- [ ] `markalar/beser.mdx` title fixed: "Beşer Akıllı Oda Termostatları" → "Beşer Su Depoları" (both frontmatter `title:` and `#` H1 heading)
- [ ] Each page has `## Hakkında` with founding year, headquarters/merkez, and market/sector position
- [ ] Each page has `## Ürün Grupları` with detailed bullet-list descriptions (min 4 groups each)
- [ ] Each page has `## Gül-tekin Mühendislik ile İlişkimiz` describing the partnership
- [ ] Each page has `## Bodrum'da {Brand} Uygulamaları` with specific Bodrum locality names
- [ ] Each page has `## İlgili Hizmetlerimiz` with `<CardGroup>` containing the correct service Cards
- [ ] astral.mdx: `## Hizmetler` renamed to `## İlgili Hizmetlerimiz` and expanded
- [ ] beser.mdx: `## Hizmetler` renamed to `## İlgili Hizmetlerimiz` and expanded
- [ ] demirdokum.mdx: existing `## İlgili Hizmetlerimiz` CardGroup expanded from 1→4 Cards
- [ ] eca.mdx: existing `## İlgili Hizmetlerimiz` CardGroup expanded from 1→5 Cards
- [ ] All existing `## 🌟 ... Hizmetlerimiz` external link-card sections are preserved intact
- [ ] Each page has an HTML comment `<!-- GÖRSEL ÖNERİSİ: ... -->` for image placement
- [ ] All MDX syntax is valid (frontmatter YAML, tags properly closed)
- [ ] All Card href targets point to existing service pages
- [ ] Documentation summary saved via `fn_task_document_write`

## Service Pages Reference Table

Use these existing service pages for CardGroup links:

| Card title | href | Relevant for |
|---|---|---|
| Isı Pompaları | `/hizmetlerimiz/isi-pompalari` | astral, demirdokum, eca |
| Pompalar | `/hizmetlerimiz/pompalar` | astral, beser |
| Sulama Sistemleri | `/hizmetlerimiz/sulama-sistemleri` | astral |
| Hidrofor Sistemleri | `/hizmetlerimiz/hidrofor-sistemleri` | astral, beser, eca |
| Su Depoları | `/hizmetlerimiz/su-depolari` | beser |
| Radyatör Sistemleri | `/hizmetlerimiz/radyator` | demirdokum, eca |
| Klima Sistemleri | `/hizmetlerimiz/klima-sistemleri` | eca |
| Termosifonik Sistemler | `/hizmetlerimiz/termosifonik-sistemler` | demirdokum, eca |
| Yerden Isıtma Sistemleri | `/hizmetlerimiz/yerden-isitma-sistemleri` | demirdokum |

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-027): complete Step N — enriched {brand}`
- **Bug fixes:** `fix(FN-027): description`
- **Title fix:** `fix(FN-027): correct beser.mdx title from "Akıllı Oda Termostatları" to "Su Depoları"`
- **Final commit:** `feat(FN-027): enrich 4 mid-level brand pages (astral, beser, demirdokum, eca)`

## Do NOT

- Remove, delete, or gut any existing content from the brand pages — only add and expand
- Modify or remove any existing `## 🌟 ... Hizmetlerimiz` external link-card sections — these must remain intact
- Add `icon` attribute to any `<Card>` component (per project convention)
- Change any files outside `markalar/*.mdx` unless a build/test failure requires it
- Add English content — all content must be in Turkish
- Create new service pages or modify service pages
- Leave any `<Card>` href pointing to a non-existent path
- Leave "Beşer Akıllı Oda Termostatları" in the beser.mdx title or H1 — this is a CRITICAL requirement
- Add hardcoded price/fiyat data (not appropriate for these brand pages)
- Commit without the task ID prefix
- Refuse necessary fixes just because they touch files outside the initial File Scope
- Remove the existing Hizmetler section on astral.mdx and beser.mdx — RENAME it to İlgili Hizmetlerimiz

## Changeset Requirements

No changeset needed — this task only ADDS content and FIXES a title; it does not remove any existing functionality.
