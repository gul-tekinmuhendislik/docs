# Task: FN-023 — ORTA SEVIYE MARKALAR — Brand Page Content Enrichment (12 Brands)

**Created:** 2026-05-26
**Size:** L

## Review Level: 2 (Plan and Code)

**Assessment:** Expands 12 mid-level brand `.mdx` pages (currently 1000–1600 bytes each) to 2000+ bytes with structured Turkish content including brand history, product groups, Gül-tekin relationship, Bodrum application examples, and service page CardGroups. Purely additive content expansion across a single directory. No new features, no deletions. Blast radius confined to `markalar/`.
**Score:** 3/8 — Blast radius: 0, Pattern novelty: 1, Security: 0, Reversibility: 2

## Mission

Twelve brand pages in `markalar/` (astral, beser, demirdokum, eca, eds, element, fronius, general, lg, mega, pimtas, vesbo) currently sit at 1000–1600 bytes with only brief introductory paragraphs, thin descriptions, and (in some cases) external link-card sections. This task expands each to a minimum of 2000 bytes with structured Turkish-language content: founding story/history, detailed product group lists, the brand's relationship with Gül-tekin Mühendislik, Bodrum-specific application examples with locality names, relevant service page CardGroup(s), and image placement research. The enriched pages serve as credible standalone brand references for customers browsing Gül-tekin Mühendislik's partner portfolio. Additionally, the Beser page title mismatch must be investigated and corrected — it currently reads "Beşer Akıllı Oda Termostatları" but the brand specializes in **su depoları** (water tanks), not thermostats.

## Dependencies

- **Task:** FN-019 (adds `## İlgili Hizmetlerimiz` CardGroups to 23 brand pages including demirdokum, eca, eds, fronius, general, lg, mega, vesbo — must run first to establish the CardGroup sections that this task will preserve and potentially expand)

## Context to Read First

- `markalar/grundfos.mdx` — reference for well-developed brand page with structured sections (Hakkında → model tables → Hizmetler CardGroup → external link-cards → İlgili Hizmetlerimiz CardGroup)
- `markalar/baymak.mdx` — reference for highly detailed brand page with Ürün Grupları, Teknolojik Özellikler, Sertifikalar sections
- `markalar/toshiba.mdx` — reference for a brand page that already has structured content sections (Hakkında, Teknik Özellikler, Ürün Grupları)
- `hizmetlerimiz/su-aritma-sistemleri.mdx` — reference for `<CardGroup>` / `<Card>` syntax
- `custom.css` — existing CSS classes for link-card, badge, brand-grid used elsewhere
- `docs.json` — navigation structure showing service page slugs used for Card hrefs

**After FN-019 completes, check these pages (they should already have `## İlgili Hizmetlerimiz` CardGroups):**
- `markalar/demirdokum.mdx` — should have "Isı Pompaları" Card
- `markalar/eca.mdx` — should have "Isı Pompaları" Card
- `markalar/eds.mdx` — should have "Hidrofor Sistemleri" Card
- `markalar/fronius.mdx` — should have "Güneş Enerjisi Sistemleri" Card
- `markalar/general.mdx` — should have "Isı Pompaları" Card
- `markalar/lg.mdx` — should have "Isı Pompaları" Card
- `markalar/mega.mdx` — should have "Hidrofor Sistemleri" Card
- `markalar/vesbo.mdx` — should have "Yerden Isıtma Sistemleri" Card

## File Scope

All files to be created or modified (12 files total):

- `markalar/astral.mdx` (modified — major content expansion, add CardGroup)
- `markalar/beser.mdx` (modified — investigate/fix title mismatch + content expansion + add CardGroup)
- `markalar/demirdokum.mdx` (modified — major content expansion, expand existing CardGroup)
- `markalar/eca.mdx` (modified — major content expansion, expand existing CardGroup)
- `markalar/eds.mdx` (modified — major content expansion, expand existing CardGroup)
- `markalar/element.mdx` (modified — major content expansion, add CardGroup)
- `markalar/fronius.mdx` (modified — major content expansion, expand existing CardGroup)
- `markalar/general.mdx` (modified — major content expansion, expand existing CardGroup)
- `markalar/lg.mdx` (modified — major content expansion, expand existing CardGroup)
- `markalar/mega.mdx` (modified — major content expansion, expand existing CardGroup)
- `markalar/pimtas.mdx` (modified — major content expansion, add CardGroup)
- `markalar/vesbo.mdx` (modified — major content expansion, expand existing CardGroup)

## Steps

### Step 0: Preflight

- [ ] All 12 target files exist in `markalar/` directory
- [ ] Read current content of each file to confirm starting state
- [ ] Read reference files (grundfos.mdx, baymak.mdx, toshiba.mdx) for structure patterns
- [ ] Verify FN-019 has completed — check that `## İlgili Hizmetlerimiz` CardGroups exist on the 8 FN-019-covered brands (demirdokum, eca, eds, fronius, general, lg, mega, vesbo). If not, pause and flag via `fn_task_create` as a dependency issue.
- [ ] Verify all service page paths exist:
  - `hizmetlerimiz/isi-pompalari.mdx`, `hizmetlerimiz/yerden-isitma-sistemleri.mdx`, `hizmetlerimiz/hidrofor-sistemleri.mdx`
  - `hizmetlerimiz/su-depolari.mdx`, `hizmetlerimiz/gunes-enerjisi.mdx`, `hizmetlerimiz/pompalar.mdx`
  - `hizmetlerimiz/sulama-sistemleri.mdx`, `hizmetlerimiz/radyator.mdx`, `hizmetlerimiz/mekanik-sihhi-tesisat.mdx`
  - `hizmetlerimiz/tahliye-istasyonu.mdx`, `hizmetlerimiz/termosifonik-sistemler.mdx`
  - `hizmetlerimiz/klima-sistemleri.mdx`, `hizmetlerimiz/su-aritma-sistemleri.mdx`
  - `hizmetlerimiz/akilli-oda-termostatlari.mdx`
- [ ] Run `wc -c` on all 12 files to record baseline sizes

### Step 1: Enrich Group A — Isıtma ve Klima Markaları (demirdokum, eca, general)

#### demirdokum.mdx

- [ ] Rewrite frontmatter `description` to be comprehensive (min 200 chars)
- [ ] Add structured content sections AFTER the existing frontmatter/intro paragraph and BEFORE the `## 🌟 Isı Pompası Hizmetlerimiz` external link-card:

**Required content (≥2000 bytes total):**

| Section | Content to include |
|---|---|
| `## Hakkında` | 1954 kuruluş, Türkiye'nin en köklü ısıtma markalarından biri. Merkez (İstanbul), üretim tesisleri. Sektör liderliği: kombi, radyatör, termosifon pazarındaki konumu. Vaillant Group çatısı altındaki yeri. |
| `## Ürün Grupları` | Yoğuşmalı kombiler (Premix, Nitromix serileri), Radyatörler (panel, dekoratif), Termosifonler, Klimalar, Merkezi ısıtma sistemleri, Isı pompaları. Her ürün grubu için kısa açıklama. |
| `## Teknolojik Özellikler` | Enerji verimliliği sınıfları, NOx emisyon değerleri, kullanıcı dostu kontrol panelleri, servis ağı ve yedek parça desteği. |
| `## Gül-tekin Mühendislik ile İlişkimiz` | Bodrum'daki villa ve konut projelerinde Demirdöküm kombi ve radyatör kullanımı. Güvenilir tedarik, teknik destek ve kurulum hizmetleri. |
| `## Bodrum'da Demirdöküm Uygulamaları` | Bodrum yarımadasında (Yalıkavak, Gümüşlük, Türkbükü, Bitez, Turgutreis) Demirdöküm kombi ve radyatör uygulamaları. Kışlık konutlarda Demirdöküm ısıtma çözümleri. |

- [ ] Expand the existing `## İlgili Hizmetlerimiz` CardGroup (added by FN-019). Currently it has only "Isı Pompaları". Add these additional relevant Cards:

```
<CardGroup>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Radyatör Sistemleri" href="/hizmetlerimiz/radyator"></Card>
  <Card title="Yerden Isıtma Sistemleri" href="/hizmetlerimiz/yerden-isitma-sistemleri"></Card>
  <Card title="Termosifonik Sistemler" href="/hizmetlerimiz/termosifonik-sistemler"></Card>
</CardGroup>
```

If no CardGroup exists yet (FN-019 not complete), add a new `## İlgili Hizmetlerimiz` section with the above Cards.

- [ ] Add image placement research comment at end of file
- [ ] Verify ≥ 2000 bytes

#### eca.mdx

- [ ] Rewrite frontmatter `description` (min 200 chars)
- [ ] Add structured content sections:

| Section | Content to include |
|---|---|
| `## Hakkında` | 35+ yıl, Türk mühendislik markası, merkez (İstanbul). Isıtma, soğutma ve iklimlendirme sektörlerindeki köklü konumu. Geniş ürün yelpazesi ve Ar-Ge yatırımları. |
| `## Ürün Grupları` | Yoğuşmalı kombiler, Klimalar (split, multi-split), Radyatörler, Termosifonler, Merkezi ısıtma sistemleri, Vana ve armatürler, Isı pompaları, Hidrofor sistemleri. |
| `## Teknolojik Özellikler` | Enerji verimliliği, düşük emisyon değerleri, modüler ürün tasarımı, Türkiye genelinde yaygın servis ağı. |
| `## Gül-tekin Mühendislik ile İlişkimiz` | Bodrum'da ECA kombi, radyatör ve iklimlendirme ürünlerinin tedarik, kurulum ve bakım hizmetleri. Modern konut projelerinde ECA tercih edilme nedenleri. |
| `## Bodrum'da ECA Uygulamaları` | Bodrum villalarında ECA kombi ve klima sistemleri, ticari mekanlarda ECA iklimlendirme çözümleri. |

- [ ] Expand the existing `## İlgili Hizmetlerimiz` CardGroup. Add these Cards (in addition to any existing "Isı Pompaları"):

```
<CardGroup>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Radyatör Sistemleri" href="/hizmetlerimiz/radyator"></Card>
  <Card title="Klima Sistemleri" href="/hizmetlerimiz/klima-sistemleri"></Card>
  <Card title="Termosifonik Sistemler" href="/hizmetlerimiz/termosifonik-sistemler"></Card>
  <Card title="Hidrofor Sistemleri" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
</CardGroup>
```

- [ ] Add image placement research comment
- [ ] Verify ≥ 2000 bytes

#### general.mdx

- [ ] Rewrite frontmatter `description` (min 200 chars)
- [ ] Add structured content sections:

| Section | Content to include |
|---|---|
| `## Hakkında` | Fujitsu General'in bir parçası. 1960'tan bu yana klima sektörü. Japon teknoloji devi Fujitsu'nun kalite standartları. Merkez (Kawasaki, Japonya), global varlık. |
| `## Ürün Grupları` | Split klimalar (ASYG serisi), Multi-split sistemler, VRF sistemler, Isı pompaları (hava kaynaklı), Kaset tipi klimalar, Duvara montaj ve tavan tipi üniteler. |
| `## Teknolojik Özellikler` | Inverter teknolojisi, yüksek EER/COP değerleri, Japon kompresör teknolojisi, sessiz çalışma, hava temizleme filtreleri, uzaktan kontrol (WiFi opsiyonel). |
| `## Gül-tekin Mühendislik ile İlişkimiz` | Bodrum'da General klima ve ısı pompası sistemlerinin kurulum ve bakım hizmetleri. Fujitsu General kalitesinin Bodrum iklim koşullarına uyumu. |
| `## Bodrum'da General Uygulamaları` | Bodrum'daki villalarda General split ve multi-split klima sistemleri. Sıcak yaz aylarında etkili soğutma çözümleri, kış aylarında ısı pompası desteği. |

- [ ] Expand the existing `## İlgili Hizmetlerimiz` CardGroup. Add these Cards:

```
<CardGroup>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Klima Sistemleri" href="/hizmetlerimiz/klima-sistemleri"></Card>
</CardGroup>
```

- [ ] Add image placement research comment
- [ ] Verify ≥ 2000 bytes

**Artifacts:**
- `markalar/demirdokum.mdx` (modified)
- `markalar/eca.mdx` (modified)
- `markalar/general.mdx` (modified)

### Step 2: Enrich Group B — Pompa, Havuz ve Hidrofor (astral, eds, mega)

#### astral.mdx

- [ ] Rewrite frontmatter `description` (min 200 chars)
- [ ] Add structured content sections AFTER the existing intro paragraph and BEFORE the existing `## Hizmetler` CardGroup or external link-card sections:

Note: astral already has a `## Hizmetler` section with a CardGroup. Rename `## Hizmetler` to `## İlgili Hizmetlerimiz` and expand it.

| Section | Content to include |
|---|---|
| `## Hakkında` | AstralPool, 50 yıla yakın geçmiş, İspanya merkezli (Valencia). Yüzme havuzu, spa ve sağlıklı yaşam ekipmanları dünya lideri. Fluidra çatısı altındaki konumu. Global dağıtım ağı. |
| `## Ürün Grupları` | Havuz pompaları (Victoria, Saphir serisi), Filtrasyon sistemleri (kum filtresi, kartuş filtre), Havuz temizlik ekipmanları (otomatik süpürgeler, el aletleri), Aydınlatma sistemleri (LED havuz ışıkları), Isı pompaları (havuz suyu ısıtma), Dezenfeksiyon sistemleri (klor, tuz, ozon), Havuz kaplama ve aksesuarlar. |
| `## Gül-tekin Mühendislik ile İlişkimiz` | Bodrum'daki özel havuz projelerinde AstralPool ekipmanları kullanımı. Havuz yapımı, bakım ve onarım projelerinde güvenilir çözüm ortağı. |
| `## Bodrum'da AstralPool Uygulamaları` | Bodrum'daki lüks villa ve otel havuzlarında AstralPool pompa, filtre ve ısı pompası uygulamaları. Bodrum'un yaz sıcağında havuz suyu sıcaklık yönetimi. |

- [ ] Rename existing `## Hizmetler` to `## İlgili Hizmetlerimiz` and expand the CardGroup:

```
<CardGroup>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
  <Card title="Sulama Sistemleri" href="/hizmetlerimiz/sulama-sistemleri"></Card>
  <Card title="Hidrofor Sistemleri" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
</CardGroup>
```

- [ ] Add image placement research comment
- [ ] Verify ≥ 2000 bytes

#### eds.mdx

- [ ] Rewrite frontmatter `description` (min 200 chars)
- [ ] Add structured content sections:

| Section | Content to include |
|---|---|
| `## Hakkında` | EDS Global, Türkiye merkezli pompa ve hidrofor üreticisi. Kuruluş yılı (araştır — EDS Global'in kuruluşu). Sektör pozisyonu: domestik ve endüstriyel pompa pazarı. |
| `## Ürün Grupları` | Su pompaları (jet pompa, santrifüj pompa, dalgıç pompa), Hidrofor sistemleri (tek pompalı, çok pompalı, frekans kontrollü), Yangın hidroforları, Genleşme tankları, RO tankları (su arıtma için), Pompa aksesuarları (esnek hortum, manifold, vana). |
| `## Teknik Özellikler` | Paslanmaz çelik ve döküm gövde seçenekleri, motor koruma sınıfları, debi ve basınç değerleri, sessiz çalışma teknolojisi. |
| `## Gül-tekin Mühendislik ile İlişkimiz` | Bodrum'da EDS hidrofor ve pompa sistemlerinin kurulumu. Konut, villa ve ticari yapılarda su basıncı çözümleri. |
| `## Bodrum'da EDS Uygulamaları` | Bodrum yamaç villalarında EDS hidrofor sistemleri, su basıncı sorunlarına EDS çözümleri, yaz aylarında artan su talebine karşı EDS hidrofor konfigürasyonları. |

- [ ] Expand the existing `## İlgili Hizmetlerimiz` CardGroup. Add these Cards:

```
<CardGroup>
  <Card title="Hidrofor Sistemleri" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
  <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
  <Card title="Su Depoları" href="/hizmetlerimiz/su-depolari"></Card>
  <Card title="Su Arıtma Sistemleri" href="/hizmetlerimiz/su-aritma-sistemleri"></Card>
</CardGroup>
```

- [ ] Add image placement research comment
- [ ] Verify ≥ 2000 bytes

#### mega.mdx

- [ ] Rewrite frontmatter `description` (min 200 chars)
- [ ] Add structured content sections:

| Section | Content to include |
|---|---|
| `## Hakkında` | Mega Pompa, Türk sermayeli endüstriyel pompa üreticisi. Kuruluş yılı (araştır). Endüstriyel pompa ve pompa sistemleri pazarındaki konumu. Geniş ürün yelpazesi ve mühendislik çözümleri. |
| `## Ürün Grupları` | Endüstriyel santrifüj pompalar, Atık su pompaları, Derin kuyu dalgıç pompalar, Yangın pompaları, Hidrofor sistemleri, Proses pompaları (gıda, kimya), Pompa kontrol panoları. |
| `## Teknik Özellikler` | Yüksek debi ve basınç kapasiteleri, endüstriyel standartlara uygunluk, ağır hizmet tipi malzeme seçenekleri, enerji verimliliği. |
| `## Gül-tekin Mühendislik ile İlişkimiz` | Bodrum'daki endüstriyel tesislerde Mega pompa sistemleri kurulumu. Zorlu endüstriyel uygulamalar için güvenilir çözüm ortağı. |
| `## Bodrum'da Mega Uygulamaları` | Bodrum'daki endüstriyel tesislerde, atık su arıtma tesislerinde Mega pompa uygulamaları. |

- [ ] Expand the existing `## İlgili Hizmetlerimiz` CardGroup. Add these Cards:

```
<CardGroup>
  <Card title="Hidrofor Sistemleri" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
  <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
  <Card title="Tahliye İstasyonu" href="/hizmetlerimiz/tahliye-istasyonu"></Card>
</CardGroup>
```

- [ ] Add image placement research comment
- [ ] Verify ≥ 2000 bytes

**Artifacts:**
- `markalar/astral.mdx` (modified)
- `markalar/eds.mdx` (modified)
- `markalar/mega.mdx` (modified)

### Step 3: Enrich Group C — Elektrik, Elektronik ve İklimlendirme (element, fronius, lg)

#### element.mdx

**IMPORTANT — Brand vs Generic content:** The current page talks about "Isıtma elemanları (rezistanslar)" as a generic concept. Restructure it to present Element as a specific brand of heating elements used by Gül-tekin. If Element is not a distinct brand but rather a generic product category, adjust the content accordingly — mention specific rezistans/heating element brands Gül-tekin works with.

- [ ] Rewrite frontmatter `description` (min 200 chars) — clarify whether Element is a brand or a product category
- [ ] Add structured content sections:

| Section | Content to include |
|---|---|
| `## Hakkında` | If brand: kuruluş hikayesi, merkez, sektör pozisyonu. If generic: açıklama, sektördeki önemi. Açıkça belirt "Isıtma elemanları (rezistanslar)" ile ilişkisi. |
| `## Ürün Grupları` | Rezistans çeşitleri (flanşlı, borulu, kartuş tipi), Elektrikli ısıtıcılar (endüstriyel, evsel), Su ısıtma rezistansları, Hava ısıtma rezistansları, Endüstriyel proses ısıtıcıları, Termostat ve kontrol ekipmanları. |
| `## Teknik Özellikler` | Malzeme seçenekleri (paslanmaz çelik, Incoloy, bakır), güç aralıkları, voltaj seçenekleri, IP koruma sınıfları. |
| `## Gül-tekin Mühendislik ile İlişkimiz` | Bodrum'daki projelerde Element ısıtma elemanlarının kullanımı. Kombi, termosifon, endüstriyel ısıtma sistemlerinde rezistans değişimi ve bakım hizmetleri. |
| `## Bodrum'da Element Uygulamaları` | Bodrum'daki konut ve ticari tesislerde rezistans değişimi, arıza tespiti ve onarım hizmetleri. |

- [ ] Add a new `## İlgili Hizmetlerimiz` CardGroup (Element does NOT have one and is NOT covered by FN-019):

```
<CardGroup>
  <Card title="Termosifonik Sistemler" href="/hizmetlerimiz/termosifonik-sistemler"></Card>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Radyatör Sistemleri" href="/hizmetlerimiz/radyator"></Card>
</CardGroup>
```

- [ ] Add image placement research comment
- [ ] Verify ≥ 2000 bytes

#### fronius.mdx

- [ ] Rewrite frontmatter `description` (min 200 chars)
- [ ] Add structured content sections:

| Section | Content to include |
|---|---|
| `## Hakkında` | 1945 Avusturya (Pettenbach) kuruluşu. Günter Fronius tarafından kuruldu. Kaynak teknolojisi, fotovoltaik ve akü şarj sistemleri alanlarında global lider. 1995 yılında güneş enerjisi sektörüne giriş. Merkezi Avusturya, dünya çapında yan kuruluşlar. |
| `## Ürün Grupları` | Solar inverterler (Galvo, Primo, Symo, Eco serileri), Hibrit inverterler (Gen24 serisi), Enerji depolama çözümleri (BYD ile iş birliği — Fronius kendi bataryasını üretmez, BYD bataryalarla uyumludur), Akıllı enerji yönetimi yazılımları (Fronius Solar.web, Solar.start), Şarj istasyonları (Fronius Wattpilot), Kaynak makineleri (TransSteel, TPS serisi). |
| `## Teknolojik Özellikler` | SnapINverter teknolojisi (kolay montaj ve servis), MPPT izleme verimliliği (%98'e varan), Dinamik güç kontrolü, Hibrit çalışma (şebeke bağlantılı, akülü), Akıllı şebeke yönetimi, Uzaktan izleme ve cihaz yönetimi. |
| `## Gül-tekin Mühendislik ile İlişkimiz` | Bodrum'da Fronius solar inverter kurulumu. Güneş enerjisi sistemlerinde yüksek verimli inverter çözümleri. Fronius'un güvenilirliği ve uzun ömürlü ürün garantisi. |
| `## Bodrum'da Fronius Uygulamaları` | Bodrum'daki konut ve ticari çatı üstü GES projelerinde Fronius inverter uygulamaları. Bodrum'un yüksek güneşlenme süresinden maksimum verimle yararlanma. |

- [ ] Expand the existing `## İlgili Hizmetlerimiz` CardGroup. Add these Cards:

```
<CardGroup>
  <Card title="Güneş Enerjisi Sistemleri" href="/hizmetlerimiz/gunes-enerjisi"></Card>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
</CardGroup>
```

- [ ] Add image placement research comment
- [ ] Verify ≥ 2000 bytes

#### lg.mdx

- [ ] Rewrite frontmatter `description` (min 200 chars)
- [ ] Add structured content sections:

| Section | Content to include |
|---|---|
| `## Hakkında` | 1947 (GoldStar olarak kuruluş), 1995'ten itibaren LG markası. Güney Kore (Seul) merkezli. Dünyanın önde gelen teknoloji ve elektronik şirketlerinden biri. HVAC sektöründe global lider. |
| `## Ürün Grupları` | Klimalar (Artcool, DUALCOOL, Standard serileri), Multi-split klima sistemleri, Isı pompaları (Therma V hava kaynaklı, su kaynaklı), VRF sistemler (MULTI V serisi), Hava temizleme cihazları, LG ThinQ akıllı ev teknolojisi ile uyumlu iklimlendirme. |
| `## Teknolojik Özellikler` | Inverter teknolojisi (Dual Inverter, BLDC), Yüksek COP/EER değerleri, WiFi kontrollü ThinQ uygulaması, Plazma hava temizleme, Sessiz çalışma (Ultra Silent modu), R32 çevre dostu soğutucu gaz. |
| `## Gül-tekin Mühendislik ile İlişkimiz` | Bodrum'da LG klima ve ısı pompası sistemlerinin kurulum, bakım ve onarım hizmetleri. LG'nin enerji verimli ve teknolojik ürünleri ile modern ısıtma/soğutma çözümleri. |
| `## Bodrum'da LG Uygulamaları` | Bodrum'daki villalarda LG Artcool ve DUALCOOL klima sistemleri. Therma V ısı pompaları ile yıl boyu konforlu ısıtma ve soğutma. Modern konut projelerinde LG ThinQ akıllı kontrol. |

- [ ] Expand the existing `## İlgili Hizmetlerimiz` CardGroup. Add these Cards:

```
<CardGroup>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Klima Sistemleri" href="/hizmetlerimiz/klima-sistemleri"></Card>
</CardGroup>
```

- [ ] Add image placement research comment
- [ ] Verify ≥ 2000 bytes

**Artifacts:**
- `markalar/element.mdx` (modified)
- `markalar/fronius.mdx` (modified)
- `markalar/lg.mdx` (modified)

### Step 4: Enrich Group D — Tesisat ve Boru Sistemleri (beser, pimtas, vesbo)

#### beser.mdx

**CRITICAL — Title Mismatch Investigation:** The frontmatter `title:` and `#` heading currently say "Beşer Akıllı Oda Termostatları" but the brand specializes in **polyester ve polietilen su depoları** (water tanks). The frontmatter `description:` correctly describes water tanks. This is a similar issue to the Radyal title mismatch fixed in FN-022.

- [ ] Investigate: does Beşer produce BOTH water tanks AND thermostats? If Beşer only produces water tanks, fix the title. If Beşer produces both, retain both in the title but reorder/fix.
- [ ] Fix frontmatter `title:` and `#` heading to accurately reflect the brand's primary product (likely "Beşer Su Depoları")
- [ ] Rewrite frontmatter `description` (min 200 chars)
- [ ] Add structured content sections:

| Section | Content to include |
|---|---|
| `## Hakkında` | Beşer, polyester ve polietilen su deposu üretiminde uzman Türk markası. Kuruluş yılı (araştır). Toprak altı ve toprak üstü kullanıma uygun depo çözümleri. Geniş kapasite yelpazesi (100 litreden tonluk tanklara). |
| `## Ürün Grupları` | Polietilen su depoları (dikey, yatay modeller), Polyester su depoları, Toprak altı su depoları, Yangın suyu depoları, Endüstriyel su tankları, Modüler su depolama sistemleri, Depo aksesuarları (şamandıra, vana ağızları, seviye göstergeleri). |
| `## Teknik Özellikler` | Gıdaya uygun malzeme (PE, polyester), UV dayanıklılığı, paslanmaz yapı, izolasyon seçenekleri, kolay temizlenebilir iç yüzey. |
| `## Gül-tekin Mühendislik ile İlişkimiz` | Bodrum'da Beşer su depolarının kurulumu. Su kesintilerine karşı güvenilir çözüm, yaz aylarında artan su ihtiyacına depolama desteği. |
| `## Bodrum'da Beşer Uygulamaları` | Bodrum'daki villa, site ve ticari tesislerde Beşer su deposu uygulamaları. Toprak altı depolama çözümleri ile estetik ve yerden tasarruf. |

- [ ] Add a new `## İlgili Hizmetlerimiz` CardGroup (Beşer does NOT have one and is NOT covered by FN-019):

```
<CardGroup>
  <Card title="Su Depoları" href="/hizmetlerimiz/su-depolari"></Card>
  <Card title="Hidrofor Sistemleri" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
  <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
</CardGroup>
```

- [ ] Add image placement research comment
- [ ] Verify ≥ 2000 bytes

#### pimtas.mdx

- [ ] Rewrite frontmatter `description` (min 200 chars)
- [ ] Add structured content sections:

| Section | Content to include |
|---|---|
| `## Hakkında` | 1977 kuruluş, Türkiye'nin önde gelen plastik boru, vana ve ek parça üreticisi. Merkez (İstanbul), üretim tesisleri. İnşaat, tarımsal sulama ve havuz sektörlerindeki geniş ürün yelpazesi. |
| `## Ürün Grupları` | U-PVC borular (basınçlı, basınçsız), HDPE borular, Küresel vanalar (PVC, PP), Kelebek vanalar, Çek valfler, Boru ek parçaları (dirsek, manson, te, redüksiyon), Yapıştırıcı ve sızdırmazlık malzemeleri. Her ürün grubu için kullanım alanları ve boyut aralıkları. |
| `## Teknik Özellikler` | Korozyona dayanıklılık, kimyasal direnç, geniş sıcaklık aralığı, kolay montaj (yapıştırma, geçme, flanşlı bağlantı), uzun ömür (50+ yıl). |
| `## Gül-tekin Mühendislik ile İlişkimiz` | Bodrum'daki mekanik tesisat projelerinde Pimtaş U-PVC boru ve ek parçalarının kullanımı. Havuz tesisatı ve sulama sistemlerinde güvenilir malzeme çözümü. |
| `## Bodrum'da Pimtaş Uygulamaları` | Bodrum'daki villa havuz tesisatlarında Pimtaş boru sistemleri. Tarımsal sulama projelerinde Pimtaş ürünleri. Sıhhi tesisat yenileme projelerinde kolay montaj avantajı. |

- [ ] Add a new `## İlgili Hizmetlerimiz` CardGroup (Pimtaş does NOT have one and is NOT covered by FN-019):

```
<CardGroup>
  <Card title="Mekanik Sıhhi Tesisat" href="/hizmetlerimiz/mekanik-sihhi-tesisat"></Card>
  <Card title="Sulama Sistemleri" href="/hizmetlerimiz/sulama-sistemleri"></Card>
  <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
  <Card title="Su Depoları" href="/hizmetlerimiz/su-depolari"></Card>
</CardGroup>
```

- [ ] Add image placement research comment
- [ ] Verify ≥ 2000 bytes

#### vesbo.mdx

- [ ] Rewrite frontmatter `description` (min 200 chars)
- [ ] Add structured content sections AFTER the existing intro text/external link-card but BEFORE any content that may follow:

| Section | Content to include |
|---|---|
| `## Hakkında` | Vesbo, plastik boru sistemleri alanında dünya çapında tanınan marka. PPR (Polipropilen Random Kopolimer) boru ve ek parçaları üretiminde uzman. Kuruluş, merkez (Türkiye — araştır). Sektör pozisyonu ve pazar payı. |
| `## Ürün Grupları` | PPRC borular (PN10, PN16, PN20, PN25 sınıfları — sıcak, soğuk su), PPRC ek parçalar (dirsek, te, manson, redüksiyon, vana ağızları), PPRC kaynak aletleri, PPRC vana ve küresel vanalar, Alüminyum folyolu PPRC borular, Gıda endüstrisi için özel PPRC ürünler. |
| `## Teknik Özellikler` | Yüksek sıcaklık dayanımı (95°C'ye kadar), yüksek basınç dayanımı, korozyona tam direnç, kireçlenme yapmaz, kimyasal direnç, 50+ yıl kullanım ömrü, düşük ısı iletkenliği (enerji tasarrufu). |
| `## Gül-tekin Mühendislik ile İlişkimiz` | Bodrum'daki mekanik tesisat projelerinde Vesbo PPRC boru sistemleri kullanımı. Sıcak-soğuk su tesisatı, yerden ısıtma kollektör bağlantıları, endüstriyel tesisat uygulamaları. |
| `## Bodrum'da Vesbo Uygulamaları` | Bodrum'daki villa ve konut projelerinde Vesbo PPRC tesisat çözümleri. Yerden ısıtma sistemlerinde Vesbo boru ve manifold uygulamaları. Paslanmaz ve kireçlenmeye karşı dirençli yapısı sayesinde Bodrum'un sert suyuna uyum. |

- [ ] Expand the existing `## İlgili Hizmetlerimiz` CardGroup. Add these Cards:

```
<CardGroup>
  <Card title="Yerden Isıtma Sistemleri" href="/hizmetlerimiz/yerden-isitma-sistemleri"></Card>
  <Card title="Mekanik Sıhhi Tesisat" href="/hizmetlerimiz/mekanik-sihhi-tesisat"></Card>
  <Card title="Su Depoları" href="/hizmetlerimiz/su-depolari"></Card>
  <Card title="Radyatör Sistemleri" href="/hizmetlerimiz/radyator"></Card>
</CardGroup>
```

- [ ] Add image placement research comment
- [ ] Verify ≥ 2000 bytes

**Artifacts:**
- `markalar/beser.mdx` (modified — title fix if needed + content expansion)
- `markalar/pimtas.mdx` (modified)
- `markalar/vesbo.mdx` (modified)

### Step 5: Final Content Quality Review

- [ ] Verify ALL 12 files are ≥ 2000 bytes each. Check with:
  ```
  wc -c markalar/astral.mdx markalar/beser.mdx markalar/demirdokum.mdx markalar/eca.mdx markalar/eds.mdx markalar/element.mdx markalar/fronius.mdx markalar/general.mdx markalar/lg.mdx markalar/mega.mdx markalar/pimtas.mdx markalar/vesbo.mdx
  ```
- [ ] For astral.mdx: verify `## Hizmetler` has been renamed to `## İlgili Hizmetlerimiz` and the CardGroup is expanded
- [ ] For beser.mdx: verify title mismatch was investigated and fixed (document the finding)
- [ ] Verify all `<CardGroup>` and `<Card>` tags are properly closed (valid MDX)
- [ ] Verify all Card `href` values point to real `.mdx` files under `hizmetlerimiz/`
- [ ] Verify no broken markdown syntax (unclosed headings, mismatched bold/italic, unclosed HTML tags)
- [ ] Verify frontmatter `description:` values are wrapped in quotes and don't contain syntax-breaking characters
- [ ] Verify that no external link-card sections (`## 🌟 ... Hizmetlerimiz` with `class="link-card featured"`) were modified — these must remain intact
- [ ] Verify each page has at least:
  - `## Hakkında` section with founding story (yıl, merkez, sektör pozisyonu)
  - `## Ürün Grupları` section with detailed product lists
  - `## Gül-tekin Mühendislik ile İlişkimiz` section describing the business relationship
  - `## Bodrum'da {Brand} Uygulamaları` section with local Bodrum application examples
  - `## İlgili Hizmetlerimiz` CardGroup with correct service links
  - An HTML comment `<!-- GÖRSEL ÖNERİSİ: ... -->` documenting image placement opportunities

**Artifacts:**
- All 12 files reviewed and validated

### Step 6: Testing & Verification

> ZERO test failures allowed. Mintlify docs site validation as quality gate.
> If keeping the site build green requires edits outside the initial File Scope, make those fixes as part of this task.

- [ ] Run final `wc -c` check on all 12 files — confirm ALL ≥ 2000 bytes
- [ ] For each file, validate frontmatter YAML with `head -4` — proper `---` separators, no broken key-value pairs
- [ ] Validate MDX syntax: `grep -n '<CardGroup>'` and `grep -n '</CardGroup>'` on each file — ensure matching pairs
- [ ] Validate Card hrefs: extract all `href="/hizmetlerimiz/` paths and confirm each referenced service page exists
- [ ] Verify all original external link-card sections (`## 🌟 ...` with `class="link-card featured"`) are preserved exactly as they were
- [ ] If `npx mintlify` CLI is available, run `npx mintlify dev --check` or equivalent to verify the site builds
- [ ] Fix all failures — if fixes require editing outside the 12 target files, make those fixes anyway

### Step 7: Documentation & Delivery

- [ ] Save documentation deliverables via `fn_task_document_write`:
  - key="docs": structured summary listing all 12 pages enriched, byte count before/after, beser title investigation findings, and any issues found
  - key="beser-title-fix": detailed investigation notes on whether the Beşer title was fixed, including evidence/reasoning
- [ ] Create out-of-scope findings as new tasks via `fn_task_create` (e.g., if a brand has no clear official web presence, or if a service page is missing that should exist)

## Content Structure Template (apply to every page)

Every enriched page should follow this structure:

```markdown
---
title: "{Brand} {Product Category}"
description: "{Comprehensive 150-250 char description covering founding, specialization, and Gül-tekin relationship}"
---

# {Brand} {Product Category}

{Existing intro paragraph — KEEP as-is if it already exists, do not remove}

## Hakkında

{2-3 paragraphs: founding year, headquarters, global/Turkish market position, sector leadership}

## Ürün Grupları

{Detailed bullet or sub-heading list of product groups with descriptions}

## Teknolojik Özellikler (optional — include when applicable)

{Technical features, certifications, performance specs}

## Gül-tekin Mühendislik ile İlişkimiz

{1-2 paragraphs: how Gül-tekin uses this brand's products in Bodrum projects, why they chose this brand}

## Bodrum'da {Brand} Uygulamaları

{1-2 paragraphs: specific Bodrum location/project types where this brand's products are installed}

## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Service 1" href="/hizmetlerimiz/service-1"></Card>
  <Card title="Service 2" href="/hizmetlerimiz/service-2"></Card>
</CardGroup>

<!-- GÖRSEL ÖNERİSİ: ... -->
```

## Image Placement Research Guidelines

For each brand, research and document via HTML comment at the end of the file:

```
<!-- GÖRSEL ÖNERİSİ: {Brand} için Hakkında bölümünden sonra ürün/brand fotoğrafı
     eklenebilir. Kaynak: {manufacturer website or catalog URL}.
     Dosya adı önerisi: images/markalar/{brand-slug}-header.jpg -->
```

## Service Pages Reference Table

Use these existing service pages for CardGroup links. Select cards relevant to each brand's products:

| Service Card Title | href path | Relevant for brands |
|---|---|---|
| Isı Pompaları | `/hizmetlerimiz/isi-pompalari` | demirdokum, eca, general, lg, astral, fronius, element |
| Yerden Isıtma Sistemleri | `/hizmetlerimiz/yerden-isitma-sistemleri` | demirdokum, vesbo, pimtas |
| Hidrofor Sistemleri | `/hizmetlerimiz/hidrofor-sistemleri` | eds, mega, astral, eca, beser |
| Su Depoları | `/hizmetlerimiz/su-depolari` | beser, pimtas, eds, vesbo |
| Güneş Enerjisi Sistemleri | `/hizmetlerimiz/gunes-enerjisi` | fronius |
| Pompalar | `/hizmetlerimiz/pompalar` | astral, eds, mega, beser, pimtas |
| Sulama Sistemleri | `/hizmetlerimiz/sulama-sistemleri` | astral, pimtas |
| Radyatör Sistemleri | `/hizmetlerimiz/radyator` | demirdokum, eca, element, vesbo |
| Klima Sistemleri | `/hizmetlerimiz/klima-sistemleri` | eca, general, lg |
| Termosifonik Sistemler | `/hizmetlerimiz/termosifonik-sistemler` | demirdokum, eca, element |
| Mekanik Sıhhi Tesisat | `/hizmetlerimiz/mekanik-sihhi-tesisat` | pimtas, vesbo |
| Tahliye İstasyonu | `/hizmetlerimiz/tahliye-istasyonu` | mega |
| Su Arıtma Sistemleri | `/hizmetlerimiz/su-aritma-sistemleri` | eds |

## Documentation Requirements

**Must Update:**
- None — content enrichment task

**Check If Affected:**
- `markalar.mdx` — verify the 12 brand slugs are still listed in the index (no accidental removal)

## Completion Criteria

- [ ] All 12 brand pages enriched with structured Turkish content (≥ 2000 bytes each)
- [ ] Each page contains: Hakkında (founding story), Ürün Grupları (detailed), Gül-tekin Mühendislik ile İlişkimiz, Bodrum Uygulamaları (with locality names)
- [ ] Each page has an `## İlgili Hizmetlerimiz` CardGroup with appropriate service cards
- [ ] All existing external link-card sections (`## 🌟 ... Hizmetlerimiz`) are preserved intact
- [ ] Beser title mismatch investigated and fixed if necessary; findings documented
- [ ] astral's `## Hizmetler` section renamed to `## İlgili Hizmetlerimiz`
- [ ] All `<CardGroup>` / `<Card>` tags properly closed with valid MDX syntax
- [ ] All Card href values point to existing service pages under `hizmetlerimiz/`
- [ ] Image placement research documented as HTML comment on each page
- [ ] Site builds without errors (if build tool available)
- [ ] Documentation summary saved via `fn_task_document_write`

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-023): complete Step N — enriched {brand-group}`
- **Bug fixes:** `fix(FN-023): description`
- **Final commit:** `feat(FN-023): enrich 12 mid-level brand pages with detailed content (astral, beser, demirdokum, eca, eds, element, fronius, general, lg, mega, pimtas, vesbo)`

## Do NOT

- Remove, delete, or gut any existing content
- Modify or remove any existing `## 🌟 ... Hizmetlerimiz` external link-card sections — these must remain intact
- Add `icon` attribute to any `<Card>` component
- Change any files outside `markalar/*.mdx` unless a build/test failure requires it
- Remove, delete, or gut modules, settings, interfaces, exports, or test files outside the File Scope
- Add English content — all content must be in Turkish
- Create new service pages or modify service pages
- Leave any `<Card>` href pointing to a non-existent path
- Refuse necessary fixes just because they touch files outside the initial File Scope
- Commit without the task ID prefix
- Skip the Beser title investigation — this is a critical fix
- Add hardcoded price/fiyat data unless the brand reference pages (like baymak.mdx) already do so
- Remove the existing service-header-image div on vesbo.mdx — keep the image rendering intact

## Changeset Requirements

No changeset needed — this task only ADDS content to existing pages and fixes a potential title mismatch. It does not remove any existing functionality, modules, or exports.
