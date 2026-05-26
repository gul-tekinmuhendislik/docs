# Task: FN-028 — B — eds, element, fronius, general — Brand Page Content Enrichment

**Created:** 2026-05-26
**Size:** M

## Review Level: 1 (Plan Only)

**Assessment:** Expands 4 mid-level brand `.mdx` pages (currently 1210–1448 bytes each) to 2000+ bytes with structured Turkish content including brand history, product groups, Gül-tekin relationship, Bodrum application examples, and expanded service page CardGroups. Purely additive content expansion confined to `markalar/`. No new features, no deletions. Low risk, easy to verify, easy to reverse.
**Score:** 2/8 — Blast radius: 0, Pattern novelty: 1, Security: 0, Reversibility: 1

## Mission

Four brand pages in `markalar/` — eds.mdx (EDS Global pompa/hidrofor), element.mdx (rezistans/elektrikli ısıtma), fronius.mdx (Fronius solar inverter), and general.mdx (Fujitsu General klima) — currently sit at 1200–1450 bytes with only brief introductory paragraphs and (for eds, fronius, general) a single external link-card section. This task expands each to a minimum of 2000 bytes with structured Turkish-language content: founding story/history, detailed product group descriptions, the brand's relationship with Gül-tekin Mühendislik, Bodrum-specific application examples with locality names, expanded service page CardGroup(s), and image placement research. Three of the four pages (eds, fronius, general) already have a basic `## İlgili Hizmetlerimiz` CardGroup added by FN-019 — this task will EXPAND those CardGroups with additional relevant service links. Element has no external link-card or CardGroup — this task will add a new one. The enriched pages serve as credible standalone brand references for customers browsing Gül-tekin Mühendislik's partner portfolio.

## Dependencies

- **Task:** FN-019 (adds `## İlgili Hizmetlerimiz` CardGroups to 23 brand pages including eds, fronius, and general — must complete first to establish the CardGroup sections that this task will expand)

## Context to Read First

- `markalar/grundfos.mdx` — reference for well-developed brand page with structured sections (Hakkında → model tables → Hizmetler CardGroup → external link-cards → İlgili Hizmetlerimiz CardGroup)
- `markalar/panasonic.mdx` — reference for a brand page with Tier 1 panel info and structured content (Hakkında, Güneş Enerjisi Sistemleri section, CardGroup)
- `markalar/baymak.mdx` — reference for highly detailed brand page with Ürün Grupları, Teknolojik Özellikler, and multiple CardGroups
- `hizmetlerimiz/hidrofor-sistemleri.mdx` — reference for `<CardGroup>` / `<Card>` syntax
- `custom.css` — existing CSS classes for link-card, badge, brand-grid used elsewhere

**After FN-019 completes, these pages should already have `## İlgili Hizmetlerimiz` CardGroups:**
- `markalar/eds.mdx` — should have "Hidrofor Sistemleri" Card
- `markalar/fronius.mdx` — should have "Güneş Enerjisi Sistemleri" Card
- `markalar/general.mdx` — should have "Isı Pompaları" Card

**Element has NO external link-card and is NOT covered by FN-019** — this task will add a CardGroup from scratch.

## File Scope

All files to be modified (4 files total):

- `markalar/eds.mdx` (modified — major content expansion, expand existing CardGroup)
- `markalar/element.mdx` (modified — major content expansion, add new CardGroup)
- `markalar/fronius.mdx` (modified — major content expansion, expand existing CardGroup)
- `markalar/general.mdx` (modified — major content expansion, expand existing CardGroup)

## Steps

### Step 0: Preflight

- [ ] All 4 target files exist in `markalar/` directory
- [ ] Read current content of each file to confirm starting state (byte counts, existing sections, heading structure)
- [ ] Read reference files (grundfos.mdx, panasonic.mdx, baymak.mdx) for structure patterns
- [ ] Verify FN-019 has completed — check that `## İlgili Hizmetlerimiz` CardGroups exist on eds.mdx, fronius.mdx, and general.mdx. If not, pause and flag via `fn_task_create` as a dependency issue.
- [ ] Verify all service page paths that will be referenced in CardGroups exist:
  - `hizmetlerimiz/hidrofor-sistemleri.mdx`
  - `hizmetlerimiz/pompalar.mdx`
  - `hizmetlerimiz/su-depolari.mdx`
  - `hizmetlerimiz/su-aritma-sistemleri.mdx`
  - `hizmetlerimiz/gunes-enerjisi.mdx`
  - `hizmetlerimiz/isi-pompalari.mdx`
  - `hizmetlerimiz/klima-sistemleri.mdx`
  - `hizmetlerimiz/radyator.mdx`
  - `hizmetlerimiz/termosifonik-sistemler.mdx`
- [ ] Run `wc -c` on all 4 files to record baseline sizes

### Step 1: Enrich eds.mdx — EDS Global (Pompa ve Hidrofor)

**Current state:** 1448 bytes. Single intro paragraph describing EDS Global as a Turkish pump/hydrophore manufacturer. One external link-card section `## 🌟 Bodrum Hidrofor Hizmetlerimiz`. Should have a basic `## İlgili Hizmetlerimiz` CardGroup from FN-019 with "Hidrofor Sistemleri" Card.

- [ ] Rewrite frontmatter `description` to be comprehensive (min 200 chars) — include founding context, product scope, and Gül-tekin relationship
- [ ] Add structured content sections AFTER the existing intro paragraph and BEFORE the existing `## 🌟 Bodrum Hidrofor Hizmetlerimiz` external link-card section:

**Required sections to add:**

**`## Hakkında`** (2-3 paragraphs):
- EDS Global, Türkiye merkezli bir pompa ve hidrofor sistemi üreticisi
- Kuruluş yılı (araştır — sektör kaynaklarında EDS Global'in ne zaman kurulduğunu doğrula. Kesin yıl bulunamazsa "2000'li yılların başında" gibi makul bir ifade kullan ve [kaynak gerekiyor] notu ekle)
- Merkez konumu ve üretim tesisleri
- Sektör pozisyonu: domestik ve endüstriyel pompa, hidrofor, basınçlı tank pazarındaki yeri
- İhracat ağı ve kalite belgeleri

**`## Ürün Grupları`** (detailed bullet list with descriptions):
- Su pompaları (jet pompa, santrifüj pompa, dalgıç pompa çeşitleri ve kullanım alanları)
- Hidrofor sistemleri (tek pompalı, çok pompalı, frekans kontrollü — inverterli modeller)
- Yangın hidroforları (yangın yönetmeliklerine uygun sistemler)
- Genleşme tankları (kapalı devre ısıtma/soğutma sistemleri için)
- RO tankları (ters osmoz su arıtma sistemleri için basınçlı depolama)
- Pompa aksesuarları (esnek hortum, manifold, vana, basınç şalteri, akış anahtarı)
- Su arıtma sistemleri (filtre, membran, arıtma cihazları)

**`## Teknik Özellikler`** (bullet list):
- Paslanmaz çelik (SS304, SS316) ve döküm gövde seçenekleri
- Motor koruma sınıfları (IP54, IP55)
- Geniş debi (Q) ve basınç (H) aralıkları
- Sessiz çalışma teknolojisi (özellikle domestik modellerde)
- Otomatik basınç kontrolü ve frekans konvertörü desteği

**`## Gül-tekin Mühendislik ile İlişkimiz`** (1-2 paragraphs):
- Bodrum'da EDS hidrofor ve pompa sistemlerinin tedarik, kurulum, bakım ve onarım hizmetleri
- Villa, konut ve ticari yapılarda su basıncı sorunlarına EDS çözümleri
- EDS ürünlerinin Bodrum iklim ve su koşullarına uygunluğu (deniz kenarı korozyon dayanımı, yaz aylarında yüksek debi ihtiyacı)

**`## Bodrum'da EDS Uygulamaları`** (1-2 paragraphs with specific locations):
- Bodrum yamaç villalarında EDS hidrofor sistemleri (Yalıkavak, Türkbükü, Gümüşlük bölgeleri)
- Su basıncı sorunlarına karşı EDS frekans kontrollü hidrofor çözümleri
- Yaz aylarında artan su talebine yönelik EDS çok pompalı hidrofor konfigürasyonları
- Bodrum'daki otel ve tatil köylerinde EDS yangın hidroforu uygulamaları

- [ ] Expand the existing `## İlgili Hizmetlerimiz` CardGroup. Currently it should have only "Hidrofor Sistemleri" from FN-019. Expand to include these additional Cards:

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Hidrofor Sistemleri" href="/hizmetlerimiz/hidrofor-sistemleri"></Card>
  <Card title="Pompalar" href="/hizmetlerimiz/pompalar"></Card>
  <Card title="Su Depoları" href="/hizmetlerimiz/su-depolari"></Card>
  <Card title="Su Arıtma Sistemleri" href="/hizmetlerimiz/su-aritma-sistemleri"></Card>
</CardGroup>
```

> **Note:** Replace the entire existing CardGroup block (from `<CardGroup>` to `</CardGroup>`) with the expanded version above. Keep all other surrounding content intact.

- [ ] Add image placement research comment at end of file:

```
<!-- GÖRSEL ÖNERİSİ: EDS için Hakkında bölümünden sonra marka logosu veya ürün grubu fotoğrafı eklenebilir. Kaynak: EDS Global resmi sitesi veya katalog. Dosya adı önerisi: images/markalar/eds-header.jpg -->
```

- [ ] Verify final file ≥ 2000 bytes

**Artifacts:**
- `markalar/eds.mdx` (modified)

### Step 2: Enrich element.mdx — Element (Rezistans, Elektrikli Isıtma)

**Current state:** 1210 bytes. Single intro paragraph describing "Isıtma elemanları (rezistanslar)" as a generic concept. No external link-card section. No CardGroup. No `## İlgili Hizmetlerimiz` section.

> **⚠ Brand vs Generic content:** The current page talks about "Isıtma elemanları (rezistanslar)" as a generic product category rather than a specific brand called "Element". Restructure the content so that it presents Element as the heating element/product category used by Gül-tekin Mühendislik. Frame it as "Gül-tekin Mühendislik, projelerinde kullandığı yüksek kaliteli ısıtma elemanları (rezistans) ile tanınan Element ürün grubuyla çalışmaktadır." Present Element as the product line/brand sourcing that Gül-tekin relies on for heating solutions.

- [ ] Rewrite frontmatter `description` to be comprehensive (min 200 chars) — clarify Element as the brand/product line for electric heating elements
- [ ] Update the `# Element Elektrikli Isıtma Sistemleri` heading to clarify the scope: keep the heading as-is but ensure the content below clearly presents Element as the specific heating element product line
- [ ] Add structured content sections AFTER the existing intro paragraph:

**Required sections to add:**

**`## Hakkında`** (2-3 paragraphs):
- Isıtma elemanlarının (rezistans) endüstrideki önemi
- Element ürün grubu: elektrik enerjisini ısıya dönüştüren yüksek kaliteli rezistans çözümleri
- Kullanım alanları: konut (kombi, termosifon, elektrikli ısıtıcı), ticari (fırın, pastane, mutfak ekipmanları), endüstriyel (proses ısıtma, kalıp ısıtma, akışkan ısıtma)
- Kalite standartları ve sertifikalar

**`## Ürün Grupları`** (detailed bullet list with descriptions):
- Flanşlı rezistanslar (endüstriyel tank ve kazan ısıtma için, yüksek güç kapasiteleri)
- Borulu rezistanslar (hava ısıtma, fırın, kurutma kabinleri için, çeşitli form ve çaplarda)
- Kartuş tipi rezistanslar (kalıp ısıtma, enjeksiyon makineleri, hassas sıcaklık kontrolü)
- Su ısıtma rezistansları (kombi, termosifon, boyler uygulamaları için, kireçlenmeye karşı korumalı)
- Hava ısıtma rezistansları (fanlı ısıtıcılar, klima kanal ısıtıcıları, endüstriyel hava perdeleri)
- Endüstriyel proses ısıtıcıları (yağ ısıtma, kimyasal ısıtma, akışkan ısıtma uygulamaları)
- Termostat ve kontrol ekipmanları (ısıtma elemanlarıyla uyumlu sıcaklık kontrol çözümleri)

**`## Teknik Özellikler`** (bullet list):
- Malzeme seçenekleri: paslanmaz çelik (SS304, SS316, SS321), Incoloy® (yüksek sıcaklık ve korozyon dayanımı), bakır (yüksek ısı iletimi), titanyum (deniz suyu ve havuz uygulamaları)
- Güç aralıkları: 100W'tan 100kW'a kadar geniş yelpaze
- Voltaj seçenekleri: 12V-600V AC/DC
- IP koruma sınıfları: IP40 (kuru alan) — IP68 (daldırma tipi)
- Maksimum çalışma sıcaklığı: malzeme ve tipe göre 200°C — 800°C

**`## Gül-tekin Mühendislik ile İlişkimiz`** (1-2 paragraphs):
- Bodrum'daki projelerde kullanılan Element ısıtma elemanları (rezistanslar)
- Kombi, termosifon, boyler ve endüstriyel ısıtma sistemlerinde rezistans temini, değişimi ve bakım hizmetleri
- Bodrum'un sert su koşullarına uygun, kireçlenmeye karşı dayanıklı rezistans çözümleri
- Acil durumlarda hızlı rezistans tedarik ve değişim hizmeti

**`## Bodrum'da Element Uygulamaları`** (1-2 paragraphs):
- Bodrum'daki villa ve konutlarda termosifon/kombi rezistans değişimi ve bakım hizmetleri
- Otel ve tatil köylerinde endüstriyel boyler rezistans yenileme
- Bodrum Marina ve tekne bakım tesislerinde deniz suyuna dayanıklı titanyum rezistans uygulamaları
- Arıza tespiti, rezistans ölçümü ve performans testi hizmetleri

- [ ] Add a NEW `## İlgili Hizmetlerimiz` CardGroup (Element has none — this is NOT covered by FN-019). Place it at the end of the file after all content sections:

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Termosifonik Sistemler" href="/hizmetlerimiz/termosifonik-sistemler"></Card>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Radyatör Sistemleri" href="/hizmetlerimiz/radyator"></Card>
</CardGroup>
```

- [ ] Add image placement research comment at end of file:

```
<!-- GÖRSEL ÖNERİSİ: Element için ürün grubu fotoğrafı (rezistans çeşitleri) veya şematik çizim eklenebilir. Kaynak: üretici katalogları veya teknik dökümanlar. Dosya adı önerisi: images/markalar/element-rezistans-header.jpg -->
```

- [ ] Verify final file ≥ 2000 bytes

**Artifacts:**
- `markalar/element.mdx` (modified)

### Step 3: Enrich fronius.mdx — Fronius (Solar Inverter)

**Current state:** 1434 bytes. Intro paragraph covering Fronius history (1945, Austria), solar inverter leadership, and product scope. One external link-card section `## 🌟 Güneş Enerjisi Hizmetlerimiz`. Should have a basic `## İlgili Hizmetlerimiz` CardGroup from FN-019 with "Güneş Enerjisi Sistemleri" Card.

- [ ] Rewrite frontmatter `description` to be comprehensive (min 200 chars) — include founding year, product scope (solar inverter, kaynak teknolojisi, akü şarj), and Gül-tekin relationship
- [ ] Add structured content sections AFTER the existing intro paragraph and BEFORE the existing `## 🌟 Güneş Enerjisi Hizmetlerimiz` external link-card section:

**Required sections to add:**

**`## Hakkında`** (2-3 paragraphs):
- 1945 yılında Avusturya'nın Pettenbach kentinde Günter Fronius tarafından kuruluş
- Üç ana iş kolu: Kaynak Teknolojisi (Welding), Fotovoltaik (Solar Energy), Akü Şarj Sistemleri (Perfect Charging)
- 1995 yılında güneş enerjisi sektörüne giriş — bugün dünyanın önde gelen solar inverter üreticilerinden biri
- Merkez: Pettenbach, Avusturya. Dünya çapında 30'dan fazla ülkede yan kuruluş ve distribütör ağı
- Ar-Ge yatırımları ve inovasyon kültürü — "Fronius Innovation" felsefesi

**`## Ürün Grupları`** (detailed bullet list with descriptions):
- Solar inverterler (şebeke bağlantılı):
  - **Fronius Galvo** — konut tipi, 1.5-3.0 kW, hafif ve kompakt
  - **Fronius Primo** — konut ve küçük ticari, 3.0-8.2 kW, çift MPPT izleyici
  - **Fronius Symo** — ticari ve endüstriyel, 3.0-20.0 kW, 3 fazlı, esnek yapılandırma
  - **Fronius Eco** — büyük ölçekli ticari ve santral, 25.0-27.0 kW, yüksek verimlilik
- **Fronius Gen24 Serisi** — hibrit inverterler (şebeke bağlantılı + batarya depolama):
  - **Fronius Symo GEN24** — 3.0-10.0 kW, yedek güç (Backup Power) özelliği
  - **Fronius Primo GEN24** — 3.0-6.0 kW, konut tipi hibrit çözüm
- Enerji depolama çözümleri: Fronius BYD BATERYA uyumluluğu (Fronius kendi bataryasını üretmez, BYD ve diğer üreticilerin bataryalarıyla entegre çalışır)
- Akıllı enerji yönetimi yazılımları:
  - **Fronius Solar.web** — uzaktan izleme ve veri analizi platformu
  - **Fronius Solar.start** — hızlı kurulum ve yapılandırma aracı
  - **Fronius Solar.configurator** — sistem tasarım ve simülasyon yazılımı
- **Fronius Wattpilot** — akıllı elektrikli araç şarj istasyonu (Solar Ekleme özelliği ile fazla güneş enerjisini şarja yönlendirir)
- Kaynak makineleri (TransSteel, TPS/i serisi — endüstriyel kaynak çözümleri)

**`## Teknolojik Özellikler`** (bullet list):
- SnapINverter teknolojisi: Patentli montaj sistemi — inverteri tek hareketle monte etme ve servis için kolayca ayırma
- MPPT izleme verimliliği: %99,9'a varan izleme, %98'e varan maksimum verimlilik (Avrupa verimliliği)
- Dinamik güç kontrolü: Şebeke kararlılığına katkı, reaktif güç desteği
- Hibrit çalışma modları: Şebeke bağlantılı, akülü (off-grid hazırlık), yedek güç (Backup Power)
- Akıllı şebeke yönetimi: Smart Grid Ready, aşırı frekans koruması, uzaktan firmware güncelleme
- Uzaktan izleme ve yönetim: Solar.web mobil uygulama ile gerçek zamanlı veri takibi
- Tam galvanik izolasyon (seçili modellerde) ve DC izolatör entegrasyonu
- 5-10 yıl ürün garantisi (modele ve bölgeye göre değişir), opsiyonel garanti uzatma

**`## Gül-tekin Mühendislik ile İlişkimiz`** (1-2 paragraphs):
- Bodrum'da Fronius solar inverter kurulumu ve güneş enerjisi sistemleri projelendirme
- Konut ve ticari çatı üstü GES (Güneş Enerjisi Sistemi) projelerinde Fronius tercih edilme nedenleri: yüksek verimlilik, uzun ömür, güvenilirlik
- Fronius SnapINverter teknolojisinin Bodrum'daki servis ve bakım avantajları (kolay sökülüp takılabilme)
- Fronius Solar.web ile müşterilere uzaktan sistem izleme ve enerji yönetimi hizmeti

**`## Bodrum'da Fronius Uygulamaları`** (1-2 paragraphs with specific locations):
- Bodrum'daki villa ve konut çatı üstü GES projelerinde Fronius Primo ve Symo inverter uygulamaları
- Bodrum'un yüksek güneşlenme süresinden (yıllık 2.500+ saat) maksimum verimle yararlanma
- Otel ve ticari tesislerde Fronius Symo GEN24 hibrit inverter + BYD batarya ile enerji bağımsızlığı
- Fronius Wattpilot ile Bodrum'daki villalarda güneş enerjisiyle elektrikli araç şarjı

- [ ] Expand the existing `## İlgili Hizmetlerimiz` CardGroup. Currently it should have only "Güneş Enerjisi Sistemleri" from FN-019. Expand to include these additional Cards:

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Güneş Enerjisi Sistemleri" href="/hizmetlerimiz/gunes-enerjisi"></Card>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
</CardGroup>
```

> **Note:** Replace the entire existing CardGroup block (from `<CardGroup>` to `</CardGroup>`) with the expanded version above. Keep all other surrounding content intact.

- [ ] Add image placement research comment at end of file:

```
<!-- GÖRSEL ÖNERİSİ: Fronius için Hakkında bölümünden sonra Fronius Gen24 inverter fotoğrafı veya kurulum görseli eklenebilir. Kaynak: Fronius resmi sitesi (fronius.com). Dosya adı önerisi: images/markalar/fronius-gen24-header.jpg -->
```

- [ ] Verify final file ≥ 2000 bytes

**Artifacts:**
- `markalar/fronius.mdx` (modified)

### Step 4: Enrich general.mdx — Fujitsu General Klima

**Current state:** 1348 bytes. Intro paragraph describing General as part of Fujitsu General, 1960 onwards, split/multi-split systems. One external link-card section `## 🌟 Isı Pompası Hizmetlerimiz`. Should have a basic `## İlgili Hizmetlerimiz` CardGroup from FN-019 with "Isı Pompaları" Card.

- [ ] Rewrite frontmatter `description` to be comprehensive (min 200 chars) — include Fujitsu relationship, 1960 founding, product scope, and Gül-tekin relationship
- [ ] Add structured content sections AFTER the existing intro paragraph and BEFORE the existing `## 🌟 Isı Pompası Hizmetlerimiz` external link-card section:

**Required sections to add:**

**`## Hakkında`** (2-3 paragraphs):
- Fujitsu General: Japon teknoloji devi Fujitsu'nun bir parçası (Fujitsu Group)
- 1960 yılından bu yana klima ve iklimlendirme sektöründe faaliyet
- Merkez: Kawasaki, Japonya. Dünya çapında üretim tesisleri ve Ar-Ge merkezleri
- Fujitsu'nun bilgi teknolojileri ve telekomünikasyon alanındaki köklü geçmişinin (1935 Fujitsu kuruluşu) iklimlendirme ürünlerine yansıyan teknoloji aktarımı
- General markasının özellikle Avrupa, Orta Doğu ve Afrika pazarlarındaki konumu
- Japon kalite standartları, sıkı üretim kontrolleri ve uzun ömürlü ürün felsefesi

**`## Ürün Grupları`** (detailed bullet list with descriptions):
- Split klimalar (ASYG serisi, duvar tipi):
  - Inverter teknolojili, R32 çevre dostu soğutucu gaz
  - 7.000 BTU/h — 24.000 BTU/h kapasite aralığı
  - Enerji sınıfları: A++ — A+++ (soğutma/ısıtma)
- Multi-split sistemler:
  - Tek dış üniteye birden fazla iç ünite bağlantısı
  - 2:1, 3:1, 4:1, 5:1 konfigürasyon seçenekleri
  - Farklı iç ünite tipleri (duvar, kaset, kanal, tavan tipi)
- VRF (Variable Refrigerant Flow) sistemler — büyük ticari projeler için
- Isı pompaları (hava kaynaklı) — yüksek COP değerli, düşük sıcaklıkta yüksek performans
- Kaset tipi klimalar (tavan tipi, 4 yönlü hava akışı)
- Tavan tipi ve kanal tipi gizli üniteler (konsolosluk, otel, ofis uygulamaları)
- Taşınabilir klimalar (kompakt, tekerlekli modeller)

**`## Teknolojik Özellikler`** (bullet list):
- Inverter teknolojisi: Kompresör hızının hassas ayarı ile enerji tasarrufu (%30-50'ye varan)
- Yüksek EER/COP değerleri: Soğutmada A+++, ısıtmada A++ sınıfı verimlilik
- Japon kompresör teknolojisi: Fujitsu General'in kendi ürettiği yüksek kaliteli rotary kompresörler
- Sessiz çalışma: İç ünite 19 dB(A)'ya kadar, dış ünite düşük gürültü seviyesi
- Hava temizleme: Çok kademeli filtre sistemi, antibakteriyel filtre, alerjen önleme
- Uzaktan kontrol: Kablolu/kablosuz kumanda, WiFi opsiyonel (akıllı telefon uygulaması ile kontrol)
- Soğutucu gaz: R32 (düşük GWP, çevre dostu)
- Geniş çalışma aralığı: -15°C ile +46°C arasında kesintisiz çalışma

**`## Gül-tekin Mühendislik ile İlişkimiz`** (1-2 paragraphs):
- Bodrum'da Fujitsu General klima ve ısı pompası sistemlerinin tedarik, kurulum, bakım ve onarım hizmetleri
- General markasının Bodrum iklim koşullarına uygunluğu: sıcak yaz aylarında etkili soğutma, ılıman kış aylarında verimli ısı pompası performansı
- Bodrum'daki lüks villa ve otel projelerinde General multi-split sistem tercih edilme nedenleri
- Japon kalitesi ve güvenilirliğine verilen önem

**`## Bodrum'da General Uygulamaları`** (1-2 paragraphs with specific locations):
- Bodrum'daki villalarda General split ve multi-split klima sistemleri (Yalıkavak, Türkbükü, Bitez, Turgutreis bölgeleri)
- Sıcak yaz aylarında etkili soğutma çözümleri, yüksek EER değerleri sayesinde düşük elektrik faturası
- Kış aylarında General ısı pompaları ile verimli ısıtma desteği
- Otel ve restoranlarda General kaset tipi ve kanal tipi gizli ünite uygulamaları

- [ ] Expand the existing `## İlgili Hizmetlerimiz` CardGroup. Currently it should have only "Isı Pompaları" from FN-019. Expand to include these additional Cards:

```
## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari"></Card>
  <Card title="Klima Sistemleri" href="/hizmetlerimiz/klima-sistemleri"></Card>
</CardGroup>
```

> **Note:** Replace the entire existing CardGroup block (from `<CardGroup>` to `</CardGroup>`) with the expanded version above. Keep all other surrounding content intact.

- [ ] Add image placement research comment at end of file:

```
<!-- GÖRSEL ÖNERİSİ: General için Hakkında bölümünden sonra Fujitsu General klima ürün fotoğrafı veya kurulum görseli eklenebilir. Kaynak: Fujitsu General resmi sitesi. Dosya adı önerisi: images/markalar/general-klima-header.jpg -->
```

- [ ] Verify final file ≥ 2000 bytes

**Artifacts:**
- `markalar/general.mdx` (modified)

### Step 5: Final Content Quality Review

- [ ] Verify ALL 4 files are ≥ 2000 bytes each. Check with:
  ```
  wc -c markalar/eds.mdx markalar/element.mdx markalar/fronius.mdx markalar/general.mdx
  ```
- [ ] Verify all `<CardGroup>` and `<Card>` tags are properly closed (valid MDX)
- [ ] Verify all Card `href` values point to real `.mdx` files under `hizmetlerimiz/`
- [ ] Verify no Card uses an `icon` attribute
- [ ] Verify no broken markdown syntax (unclosed headings, mismatched bold/italic, unclosed HTML tags)
- [ ] Verify frontmatter `description:` values are wrapped in quotes and don't contain syntax-breaking characters
- [ ] Verify that no external link-card sections (`## 🌟 ... Hizmetlerimiz` with `class="link-card featured"`) were modified — these must remain intact
- [ ] Verify each page has at least:
  - `## Hakkında` section with founding story (yıl, merkez, sektör pozisyonu)
  - `## Ürün Grupları` section with detailed product lists with descriptions
  - `## Gül-tekin Mühendislik ile İlişkimiz` section describing the business relationship
  - `## Bodrum'da {Brand} Uygulamaları` section with specific Bodrum location application examples
  - `## İlgili Hizmetlerimiz` CardGroup with correct service links
  - An HTML comment `<!-- GÖRSEL ÖNERİSİ: ... -->` documenting image placement opportunities

**Artifacts:**
- All 4 files reviewed and validated

### Step 6: Testing & Verification

> ZERO test failures allowed. Mintlify docs site validation as quality gate.
> If keeping the site build green requires edits outside the initial File Scope, make those fixes as part of this task.

- [ ] Run final `wc -c` check on all 4 files — confirm ALL ≥ 2000 bytes
- [ ] For each file, validate frontmatter YAML with `head -4` — proper `---` separators, no broken key-value pairs
- [ ] Validate MDX syntax: `grep -n '<CardGroup>'` and `grep -n '</CardGroup>'` on each file — ensure matching pairs
- [ ] Validate Card hrefs: extract all `href="/hizmetlerimiz/` paths and confirm each referenced service page exists under `hizmetlerimiz/`
- [ ] Verify all original external link-card sections (`## 🌟 ...` with `class="link-card featured"`) are preserved exactly as they were on eds.mdx, fronius.mdx, and general.mdx
- [ ] If `npx mintlify` CLI is available, run `npx mintlify dev --check` or equivalent to verify the site builds
- [ ] Fix all failures — if fixes require editing outside the 4 target files, make those fixes anyway

### Step 7: Documentation & Delivery

- [ ] Save documentation deliverables via `fn_task_document_write`:
  - key="docs": structured summary listing all 4 pages enriched, byte count before/after, and any issues found
  - key="element-brand-clarification": notes on whether Element is a specific brand or a product category, and how the content was structured accordingly
- [ ] Create out-of-scope findings as new tasks via `fn_task_create` (e.g., if a brand has no clear official web presence, or if a service page is missing that should exist)

## Content Structure Template (apply to every page)

Every enriched page should follow this structure:

```markdown
---
title: "{Brand} {Product Category}"
description: "{Comprehensive 150-250 char description covering founding, specialization, and Gül-tekin relationship}"
---

# {Brand} {Product Category}

{Existing intro paragraph — KEEP as-is, do not remove. If it's too brief, add one more sentence at the end.}

## Hakkında

{2-3 paragraphs: founding year, headquarters, global/Turkish market position, sector leadership}

## Ürün Grupları

{Detailed bullet or sub-heading list of product groups with descriptions}

## Teknolojik Özellikler (optional — include when applicable; include for fronius, general, eds, element)

{Technical features, certifications, performance specs}

## Gül-tekin Mühendislik ile İlişkimiz

{1-2 paragraphs: how Gül-tekin uses this brand's products in Bodrum projects, why they chose this brand}

## Bodrum'da {Brand} Uygulamaları

{1-2 paragraphs: specific Bodrum location/project types where this brand's products are installed}

## 🌟 {External Link-Card Heading}  ← EXISTING — DO NOT MODIFY

<a href="..." target="_blank" rel="noopener noreferrer" class="link-card featured">  ← EXISTING — DO NOT MODIFY
  ...
</a>

## İlgili Hizmetlerimiz

<CardGroup>
  <Card title="Service 1" href="/hizmetlerimiz/service-1"></Card>
  <Card title="Service 2" href="/hizmetlerimiz/service-2"></Card>
  <Card title="Service 3" href="/hizmetlerimiz/service-3"></Card>
</CardGroup>

<!-- GÖRSEL ÖNERİSİ: ... -->
```

> **Important layout note:** The `## İlgili Hizmetlerimiz` section must be placed AFTER the `## 🌟 ... Hizmetlerimiz` external link-card section(s). This is the pattern established by FN-019 and must be maintained. For element (no external link-card), place at the end of the file after all content sections.

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
| Hidrofor Sistemleri | `/hizmetlerimiz/hidrofor-sistemleri` | eds |
| Pompalar | `/hizmetlerimiz/pompalar` | eds |
| Su Depoları | `/hizmetlerimiz/su-depolari` | eds |
| Su Arıtma Sistemleri | `/hizmetlerimiz/su-aritma-sistemleri` | eds |
| Termosifonik Sistemler | `/hizmetlerimiz/termosifonik-sistemler` | element |
| Isı Pompaları | `/hizmetlerimiz/isi-pompalari` | element, general, fronius |
| Radyatör Sistemleri | `/hizmetlerimiz/radyator` | element |
| Güneş Enerjisi Sistemleri | `/hizmetlerimiz/gunes-enerjisi` | fronius |
| Klima Sistemleri | `/hizmetlerimiz/klima-sistemleri` | general |

## Documentation Requirements

**Must Update:**
- None — content enrichment task

**Check If Affected:**
- `markalar.mdx` — verify the 4 brand slugs are still listed in the index (no accidental removal). Note: EDS, Element, Fronius, General are listed in the markalar.mdx index.

## Completion Criteria

- [ ] All 4 brand pages enriched with structured Turkish content (≥ 2000 bytes each)
- [ ] Each page contains: Hakkında (founding story), Ürün Grupları (detailed with descriptions), Teknolojik Özellikler, Gül-tekin Mühendislik ile İlişkimiz, Bodrum Uygulamaları (with locality names)
- [ ] Each page has a complete `## İlgili Hizmetlerimiz` CardGroup with appropriate service cards
- [ ] All existing external link-card sections (`## 🌟 ... Hizmetlerimiz`) are preserved intact on eds, fronius, general
- [ ] Element has a new `## İlgili Hizmetlerimiz` CardGroup (added from scratch since FN-019 does not cover it)
- [ ] All `<CardGroup>` / `<Card>` tags properly closed with valid MDX syntax
- [ ] All Card href values point to existing service pages under `hizmetlerimiz/`
- [ ] No Card uses the `icon` attribute
- [ ] Image placement research documented as HTML comment on each page
- [ ] Site builds without errors (if build tool available)
- [ ] Documentation summary saved via `fn_task_document_write`

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-028): complete Step N — enriched {brand-name}`
- **Bug fixes:** `fix(FN-028): description`
- **Final commit:** `feat(FN-028): enrich 4 mid-level brand pages with detailed content (eds, element, fronius, general)`

## Do NOT

- Remove, delete, or gut any existing content
- Modify or remove any existing `## 🌟 ... Hizmetlerimiz` external link-card sections — these must remain intact on eds, fronius, general
- Modify any content outside the 4 target files unless a build/test failure requires it
- Add `icon` attribute to any `<Card>` component
- Add English content — all content must be in Turkish
- Create new service pages or modify service pages
- Leave any `<Card>` href pointing to a non-existent path
- Refuse necessary fixes just because they touch files outside the initial File Scope
- Commit without the task ID prefix
- Remove features as "cleanup" — if something seems unused, create a task via `fn_task_create`
- Add hardcoded price/fiyat data

## Changeset Requirements

No changeset needed — this task only ADDS content to existing pages. It does not remove any existing functionality, modules, or exports.
