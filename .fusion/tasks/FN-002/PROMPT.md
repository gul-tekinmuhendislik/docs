# Task: FN-002 — Varmeks / Warmeks Yazım Tutarsızlığını Giderme ve Dosya Birleştirme

**Created:** 2026-05-26
**Size:** S

## Review Level: 1 (Plan Only)

**Assessment:** Small scope, two files in a single directory. Blast radius limited to `markalar/` directory only. No security, data, or infrastructure implications. Fully reversible by restoring deleted files from git.

**Score:** 2/8 — Blast radius: 0, Pattern novelty: 1, Security: 0, Reversibility: 1

## Mission

`markalar/warmeks.mdx` (NLM-zenginleştirilmiş, "Warmeks" olarak yanlış yazılmış) ve `markalar/varmeks.md` (doğru marka adı "Varmeks", .md uzantılı, navigasyonda listeleniyor) aynı marka için iki dosyadır. Görev: her iki kaynağın en iyi içeriğini tek bir `markalar/varmeks.mdx` dosyasında birleştirmek, tüm "Warmeks" referanslarını "Varmeks" ile düzeltmek, NLM JSON sarmalayıcısını kaldırmak, eski dosyaları silmek ve Varmeks'i `markalar.mdx` index sayfasına eklemektir. Bu çözüm, FN-008'i (varmeks.md → .mdx dönüşümü) otomatik olarak halleder ve FN-005'in (eksik marka linklerini markalar.mdx'e ekleme) bağımlılığıdır.

## Dependencies

- **Task:** FN-003 (tse.mdx sayfası Mintlify navigasyonuna eklendi — markalar.mdx'deki sıralamayı etkileyebilir; FN-002'nin çıktısı olan varmeks.mdx linkini markalar.mdx'e eklerken mevcut sıraya dikkat edilmeli)
- **Task:** FN-008 (varmeks.md → .mdx dönüşümü — **bu task FN-002 tarafından kapsanır**; FN-008'in kapsamı FN-002'nin çıktısıyla çözülür)

**Not:** FN-005 (markalar.mdx'e eksik marka linklerini ekleme) FN-002'nin tamamlanmasına bağlıdır — bu task çözüldükten sonra FN-005 yalnızca "varmeks" linkini eklemelidir (hem "varmeks" hem "warmeks" değil).

## Context to Read First

- `markalar/warmeks.mdx` — NLM-zenginleştirilmiş içerik, ham JSON bloğu içerir, tüm dosyada "Warmeks" yanlış yazımı mevcut (JSON sarmalayıcısı nedeniyle MWC'de otomatik render edilemez)
- `markalar/varmeks.md` — Temiz yapılandırılmış içerik, doğru marka adı, .md uzantısı
- `markalar.mdx` — Marka index sayfası (ne varmeks ne warmeks listelenmiyor)
- `docs.json` — Mintlify navigasyon yapılandırması (`markalar/varmeks`'e 3 grupta referans verir)

## File Scope

- `markalar/varmeks.mdx` (yeni — birleştirilmiş çıktı)
- `markalar/warmeks.mdx` (silinecek)
- `markalar/varmeks.md` (silinecek)
- `markalar.mdx` (değiştirilecek — Varmeks linki eklenecek)
- `.changeset/fn-002-varmeks-merge.md` (yeni — dosya silme için changeset)

## Steps

### Step 0: Preflight

- [ ] `markalar/warmeks.mdx` mevcut ve NLM-zenginleştirilmiş JSON içeriği içeriyor
- [ ] `markalar/varmeks.md` mevcut ve yapılandırılmış içerik içeriyor
- [ ] `docs.json` `markalar/varmeks` referansını (markalar/varmeks değil) içeriyor

### Step 1: İçerikleri Oku ve Karşılaştır

- [ ] Her iki dosyayı da tamamen oku ve tüm bölümleri anla
- [ ] warmeks.mdx'teki JSON bloğunu tespit et: `{"value": {"answer": "..."}}" yapısındaki NLM "answer" alanı — çıkarılacak gerçek Markdown içeriği budur
- [ ] warmeks.mdx'in JSON içeriğinin yarıda kesildiğini doğrula ("Büyük ölçekl" ile bitiyor — kesik)
- [ ] Tüm "Warmeks" → "Varmeks" değiştirmelerini not et (frontmatter başlık, frontmatter açıklama, altbilgi bölümü, gövde metni)
- [ ] varmeks.md'nin temiz bölüm yapısını not et: Hakkında, Ürün Grupları, Teknolojik Özellikler, Kullanılan Soğutucu Akışkanlar, Uygulama Alanları, Avantajları, Teknik Destek ve Garanti, Sertifikalar ve Standartlar

### Step 2: Birleştirilmiş `markalar/varmeks.mdx` Oluştur

Her iki kaynağın en iyi içeriğini birleştiren temiz, iyi yapılandırılmış bir MDX dosyası oluştur:

- **Frontmatter**: Başlık olarak `varmeks.md`'den `"Varmeks Isı Pompaları ve Klima Sistemleri"` kullan, description'ları her iki kaynaktan birleştir
- **İçerik yapısı**: `varmeks.md`'nin temiz yapısını kullan (Hakkında, Ürün Grupları, Teknolojik Özellikler, vs.)
- **NLM zenginleştirme entegrasyonu**: warmeks.mdx'in JSON sarmalayıcısındaki NLM "answer" alanını çıkar — JSON blok tamamen kaldırılmalı, yalnızca iç Markdown içeriği birleştirilmiş dosyaya gitmeli. Zenginleştirilmiş ürün serisi detaylarını (Varm Up, Varm Silent Pool, Varm Boost, Varm Fuzzy, Endüstriyel Çözümler) ilgili bölümlerin altına entegre et
- **Tüm "Warmeks" → "Varmeks"**: Dosyadaki her "Warmeks" geçişini (frontmatter, altbilgi, gövde metni dahil) "Varmeks" ile değiştir
- **Footer**: Gül-Tekin Mühendislik partner satırını ve navigasyon linklerini düzeltilmiş marka adıyla koru
- **Çapraz referans linki**: Alttaki `/isi-pompalari/varmeks-seriler` linkini koru

- [ ] `markalar/varmeks.mdx`'i birleştirilmiş içerik ve tüm yazım düzeltmeleriyle yaz
- [ ] Dosyada "Warmeks" referansı kalmadığını doğrula (grep ile)
- [ ] JSON sarmalayıcısının tamamen kaldırıldığını doğrula
- [ ] Dosyanın `.mdx` uzantısını ve geçerli frontmatter formatını kullandığını doğrula

**Artifacts:**
- `markalar/varmeks.mdx` (yeni)

### Step 3: Eski Dosyaları Sil

- [ ] `markalar/warmeks.mdx`'i sil (yanlış yazılmış kopya, docs.json'da referansı yok)
- [ ] `markalar/varmeks.md`'yi sil (yerini varmeks.mdx aldı)
- [ ] Her iki dosyanın da `ls markalar/` ile diskten kaldırıldığını doğrula

**Artifacts:**
- `markalar/warmeks.mdx` (silindi)
- `markalar/varmeks.md` (silindi)

### Step 4: `markalar.mdx` Marka Index Sayfasını Güncelle

- [ ] `markalar.mdx`'i oku ve Varmeks için doğru alfabetik konumu belirle
  - Mevcut liste "Sukar" ile bitiyor (Sukar'dan sonra V harfi gelir)
  - Varmeks, Sukar'dan sonra ilk V-entry'si olacak — EĞER toshiba eklenmişse (FN-005'ten önce veya başka bir task'tan) Toshiba'dan sonra; aksi halde Sukar'dan sonra
  - Konumu belirlemek için mevcut markalar.mdx listesinin güncel halini OKU
- [ ] `[Varmeks](/markalar/varmeks)` entry'sini markalar.mdx'teki marka listesine doğru alfabetik sıraya ekle
- [ ] Linkin `/markalar/varmeks`'e işaret ettiğini doğrula (dosya uzantısı yok — Mintlify kuralı)

**Artifacts:**
- `markalar.mdx` (değiştirildi)

### Step 5: Changeset Oluştur (Dosya Silme)

Bu task MEVCUT dosyaları sildiği için bir changeset dosyası ZORUNLUDUR:

- [ ] `.changeset/fn-002-varmeks-merge.md` oluştur ve şunları açıkla:
  - Neler silindi: `markalar/warmeks.mdx` (yanlış yazılmış kopya, içeriği varmeks.mdx'e birleştirildi) ve `markalar/varmeks.md` (.mdx formatına dönüştürüldü)
  - Neden: Yazım tutarsızlığı çözüldü, dosyalar tek bir kanonik `markalar/varmeks.mdx`'te birleştirildi

**Artifacts:**
- `.changeset/fn-002-varmeks-merge.md` (yeni)

### Step 6: Testing & Verification

> Bu projede test framework'ü veya lint mevcut değildir. Doğrulama manuel kontrollerle yapılır.

- [ ] `markalar/varmeks.mdx`'in geçerli olduğunu doğrula (düzgün frontmatter, bozuk Markdown yok)
- [ ] `markalar/varmeks.mdx`'te hiç "Warmeks" referansı kalmadığını doğrula (grep -i ile)
- [ ] `markalar/warmeks.mdx` ve `markalar/varmeks.md`'nin artık var olmadığını doğrula
- [ ] `markalar/` dizininde artık hiç `.md` uzantılı marka dosyası kalmadığını doğrula (tümü `.mdx` olmalı)
- [ ] `markalar.mdx`'te Varmeks entry'sinin doğru alfabetik konumda olduğunu doğrula
- [ ] `docs.json`'un hala `markalar/varmeks` referansını içerdiğini doğrula (nav otomatik olarak varmeks.mdx'i çözecektir)
- [ ] `markalar/varmeks.mdx`'i bir Mintlify ön izlemesinde (veya en azından bir Markdown render edicide) render edilebilir olduğunu kontrol et

### Step 7: Documentation & Delivery

- [ ] Birleştirme özetini `fn_task_document_write` ile kaydet (key="docs", content=merged file's frontmatter + bölüm listesi + yapılan değişikliklerin özeti)
- [ ] Kapsam dışı bulgular varsa `fn_task_create` ile yeni task oluştur

## Documentation Requirements

**Must Update:**
- `markalar.mdx` — Varmeks linkini ekle

**Check If Affected:**
- `markalar.mdx` — yukarıda zaten kapsandı

## Completion Criteria

- [ ] Tüm adımlar tamamlandı
- [ ] `markalar/varmeks.mdx` her iki kaynak dosyadan birleştirilmiş içerikle oluşturuldu
- [ ] Birleştirilmiş dosyada hiç "Warmeks" yazım hatası kalmadı
- [ ] `markalar/warmeks.mdx` silindi
- [ ] `markalar/varmeks.md` silindi
- [ ] `markalar.mdx` Varmeks entry'si ile güncellendi
- [ ] Silinen dosyalar için changeset dosyası oluşturuldu

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-002): complete Step N — description`
- **Bug fixes:** `fix(FN-002): description`

## Do NOT

- `docs.json`'u değiştirme (zaten `markalar/varmeks` referansını içeriyor — doğru şekilde çözülecek)
- Birleştirilmiş dosyada "Warmeks" yazımını koru
- NLM JSON sarmalayıcısını birleştirilmiş dosyada bırak
- İlgisiz marka dosyalarını değiştirme
- Gerekli changeset'i oluşturmadan dosya silme
- Kapsamı FN-005'i düzeltmek için genişletme (tüm eksik markaları ekleme) — yalnızca Varmeks ekle
- `isi-pompalari/varmeks-seriler.md` veya diğer ilgili task'lerin dosya kapsamına dokunma
- Task ID ön eki olmadan commit yapma
- Hiçbir test veya lint komutu olmadığı için sahte test/lint adımları ekleme (yalnızca gerçek doğrulama kontrolleri)

## Changeset Requirements

Bu task `markalar/warmeks.mdx` ve `markalar/varmeks.md`'yi SİLİYOR. Bir changeset dosyası ZORUNLUDUR:

- `.changeset/fn-002-varmeks-merge.md` oluştur, neyin neden silindiğini açıkla
