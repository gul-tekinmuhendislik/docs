# Task: FN-016 — Marka Dokümanları Kalite Kontrolü: Eksik/Yetersiz İçerik Analizi

**Created:** 2026-05-26
**Size:** M

## Review Level: 1 (Plan Only)

**Assessment:** Read-only analysis of 47 markdown brand pages; produces a report and creates follow-up tasks. No production file changes, no security impact, fully reversible.
**Score:** 3/8 — Blast radius: 0, Pattern novelty: 1, Security: 0, Reversibility: 2

## Mission

Systematically analyze all 47 brand documentation pages in `markalar/` against 5 defined quality criteria (marka bilgisi, Gül-tekin ilişkisi, hizmet linkleri, görsel varlığı, format tutarlılığı), produce a comprehensive quality-control report with per-page scores and gap descriptions, and ensure every identified quality gap is covered by an existing or newly created remediation task. This audit is the analytical foundation for the remediation work specified in subtasks FN-021 (format fixes), FN-022 (short-brand enrichment), FN-023 (medium-brand enrichment), and FN-024 (remaining brand validation). The executor must read every brand page, assign a pass/fail score per criterion, identify any gaps not yet covered by existing subtasks, and create new tasks for uncovered work. The final deliverable is a structured quality report saved as a task document.

## Dependencies

- **Task:** FN-001 (Codebase audit — provides baseline findings on brand page quality, file extensions, and listing gaps)
- **Task:** FN-021 (already in triage — warmeks.mdx JSON → markdown, varmeks.md → .mdx rename)
- **Task:** FN-022 (already in triage — enrich 8 short brands to 2000+ byte)
- **Task:** FN-023 (already in triage — enrich 12 medium brands to 2000+ byte)
- **Task:** FN-024 (already in triage — validate 25 remaining brands)

> Note: FN-021, FN-022, FN-023, FN-024 are in the triage column but have NOT been fully specified with PROMPT.md yet. Their descriptions from triage are referenced in the analysis below.

## Context to Read First

- `markalar/` directory listing — confirm the exact set of 47 files
- `.fusion/memory/MEMORY.md` lines 25-44 — FN-001 audit findings about brand page quality
- `.fusion/tasks/FN-001/PROMPT.md` — baseline audit findings if available via `fn_task_get(FN-001)`
- `hizmetlerimiz.mdx` — reference for valid service page paths
- `markalar.mdx` — reference for how brands are listed/indexed
- `custom.css` — check for `.link-card`, `.status-dot`, `.brand-grid` patterns already available

## File Scope

**Read-only (analysis only — no modifications to these files by this task):**
- `markalar/*.mdx` (46 .mdx files)
- `markalar/varmeks.md` (1 .md file)
- `hizmetlerimiz/*.mdx` (for cross-reference validation)

**Created:**
- This task's documents (via `fn_task_document_write`)
- New triage tasks for any uncovered gaps (via `fn_task_create`)

## Steps

### Step 0: Preflight

- [ ] Confirm `markalar/` contains exactly 47 brand entries by listing files: run `ls markalar/` 
- [ ] Verify the known file list matches: 46 `.mdx` files + 1 `.md` file (varmeks.md)
- [ ] Read the existing triage subtasks FN-021, FN-022, FN-023, FN-024 via `fn_task_get` to understand their exact scope
- [ ] Verify no other FN-016-level analysis has been done (check for saved task documents)

### Step 1: Read & Score All 47 Brand Pages

Read every file in `markalar/` and score each one against these 5 quality criteria:

**Criterion A — Marka Bilgisi (Brand Information)**
Pass if the page includes at least 3 of: kuruluş yılı, merkez/ülke, sektör pozisyonu/liderliği, ana ürün grupları, teknik detaylar.
**Criterion B — Gül-tekin İlişkisi (Relationship with Gül-tekin)**
Pass if the page includes a paragraph explaining how Gül-tekin Mühendislik works with the brand and provides their products/services in Bodrum.
**Criterion C — Hizmet Bağlantıları (Service Page Links)**
Pass if the page links to at least one relevant service page under `/hizmetlerimiz/`. Bonus for featured link-cards.
**Criterion D — Görsel (Visual/Image)**
Pass if the page includes an image (e.g. `<img` tag or image reference).
**Criterion E — Format Tutarlılığı (Format Consistency)**
Pass if: (a) It's `.mdx` extension (not `.md`), (b) YAML frontmatter has both `title` and `description`, (c) No raw JSON or code blocks containing data that should be markdown.

**Build the scoring matrix as you go.** Record results in a structured Markdown table with columns: File | A | B | C | D | E | Byte Size | Notes.

The 47 files to read and score:

**Short (<1000 byte):** aqualine.mdx, nobo.mdx, radyal.mdx, rain-bird.mdx, sanihydro.mdx, sukar.mdx, tekneciler.mdx, vitra.mdx

**Medium (1000-1500 byte):** astral.mdx, beser.mdx, demirdokum.mdx, eca.mdx, eds.mdx, element.mdx, fronius.mdx, general.mdx, lg.mdx, mega.mdx, pimtas.mdx, vesbo.mdx

**Large (>1500 byte):** alarko.mdx, aldea.mdx, atlantis.mdx, atlas.mdx, baylan.mdx, baymak.mdx, burak.mdx, caleffi.mdx, eraslan.mdx, grundfos.mdx, hakan-plastik.mdx, honeywell.mdx, jinko.mdx, panasonic.mdx, ph-mekanik.mdx, rehau.mdx, siemens.mdx, solimpeks.mdx, standart.mdx, teksan.mdx, toshiba.mdx, tse.mdx, varmeks.md, warmeks.mdx, wepomp.mdx, wilo.mdx, yelkenci.mdx

- [ ] Read and score every brand page
- [ ] Record file byte sizes using `wc -c markalar/<filename>`
- [ ] Flag misnamed files (varmeks.md) and format issues (warmeks.mdx JSON)
- [ ] Flag title/description mismatches (radyal.mdx title says "Vanalar" but brand makes radiators; beser.mdx title says "Termostat" but body is about water tanks)
- [ ] Flag specific content gaps for each file in the Notes column

**Artifacts:**
- (in-memory scoring matrix to be written as report in Step 2)

### Step 2: Produce Comprehensive Quality Report

- [ ] Compile the scoring matrix into a structured Markdown report
- [ ] Include summary statistics: pass/fail counts per criterion, byte-size distribution, format issues
- [ ] For each file that failed one or more criteria, write a specific remediation recommendation
- [ ] Cross-reference each recommendation against existing triage tasks (FN-021 through FN-024) to determine if it's already covered

**Report Template:**
```markdown
# FN-016 Kalite Kontrol Raporu

## Özet
- Toplam marka sayfası: 47
- Tam puan (5/5) alan: N
- En az 1 kriterde başarısız: N
- Ortalama puan: X.X/5

## Kriter Bazında Dağılım
| Kriter | Geçen | Kalan | Geçme Oranı |
|--------|-------|-------|-------------|
| A - Marka Bilgisi | N | N | X% |
| B - Gül-tekin İlişkisi | N | N | X% |
| C - Hizmet Bağlantıları | N | N | X% |
| D - Görsel | N | N | X% |
| E - Format Tutarlılığı | N | N | X% |

## Boyut Dağılımı
| Boyut | Sayı | Dosyalar |
|-------|------|----------|
| Kısa (<1000 byte) | 8 | ... |
| Orta (1000-1500 byte) | 12 | ... |
| Büyük (>1500 byte) | 27 | ... |

## Detaylı Puan Tablosu
| # | Dosya | Byte | A | B | C | D | E | Top | Notlar |
|---|-------|------|---|---|---|---|---|-----|--------|
| 1 | aqualine.mdx | 969 | ✅ | ✅ | ✅ | ❌ | ✅ | 4/5 | Kısa, görsel yok, hizmet linki var |
| ... | ... | ... | ... | ... | ... | ... | ... | ... | ... |

## Format Sorunları
### warmeks.mdx
- **Sorun:** İçinde ham JSON data blokları var ({"value": {"answer": ...}})
- **Çözüm:** JSON'daki teknik bilgileri temiz markdown'a çevir (FN-021 kapsamında)
- **Durum:** ✅ FN-021 tarafından kapsanıyor

### varmeks.md
- **Sorun:** .md uzantısı, diğer tüm markalar .mdx
- **Çözüm:** Git mv ile .mdx'e dönüştür (FN-021, FN-008 kapsamında)
- **Durum:** ✅ FN-021/FN-008 tarafından kapsanıyor

### radyal.mdx
- **Sorun:** Başlık "Vanalar ve Pompa Sistemleri" diyor ama marka alüminyum radyatör üreticisi
- **Çözüm:** Başlığı "Radyal Alüminyum Radyatör ve Havlupan" olarak düzelt
- **Durum:** ❌ Yeni task gerekiyor (bkz. Step 3)

### beser.mdx
- **Sorun:** Başlık "Akıllı Oda Termostatları" diyor ama marka su deposu üreticisi
- **Çözüm:** Başlığı "Beşer Su Depoları" olarak düzelt, içerikte de termostat referansını kaldır
- **Durum:** ❌ Yeni task gerekiyor (bkz. Step 3)

## Kısa Markalar (<1000 byte) — FN-022 Kapsamında
| Dosya | Bayt | Eksikler |
|-------|------|----------|
| aqualine.mdx | 969 | Kuruluş yılı ve global konum detayı yok, Pollet Water Group ortaklığı detaylandırılmalı |
| nobo.mdx | 947 | Norveç detayı yetersiz, ürün serileri, OSO ortaklığı bilgisi yok |
| radyal.mdx | 871 | Başlık sorunu + alüminyum radyatör detayı çok az, havlupan serileri eklenmeli |
| rain-bird.mdx | 932 | 1933 kuruluşu var ama ürün serileri (sprinkler, rotor, vana, damla sulama) sadece isim |
| sanihydro.mdx | 990 | SFA Group detayı, WC grinder modelleri, uygulama örnekleri eklenmeli |
| sukar.mdx | 982 | 1998 kuruluş, Kokumatik patenti, 200+ ürün çeşidi var ama sadece isim geçiyor |
| tekneciler.mdx | 950 | 1993 kuruluş, 30+ ülke ihracat var ama ürün grupları sadece isim, kollektör detayı yok |
| vitra.mdx | 873 | Eczacıbaşı grubu, global konum, vitrifiye serileri eklenmeli |

**Durum:** ✅ FN-022 tarafından kapsanıyor (tümü)

## Orta Boy Markalar (~1200-1500 byte) — FN-023 Kapsamında
| Dosya | Bayt | Eksikler |
|-------|------|----------|
| astral.mdx | ~1400 | 50 yıl tecrübe var ama ürün serileri sadece genel, AstralPool havuz ekipmanları detaylandırılmalı |
| beser.mdx | ~1300 | **Başlık sorunu**, su deposu detayı yetersiz, polietilen/polyester farkı anlatılmalı |
| demirdokum.mdx | ~1400 | 1954 kuruluş, kombi serileri (Nitromix, vs.), radyatör çeşitleri eklenmeli |
| eca.mdx | ~1400 | 35+ yıl, kombi/klima ürün serileri, endüstriyel çözümler eklenmeli |
| eds.mdx | ~1300 | Pompa/hidrofor serileri, teknik özellikler detaylandırılmalı |
| element.mdx | ~1200 | **Marka mı yoksa genel rezistans kategorisi mi?** Netleştirilmeli |
| fronius.mdx | ~1300 | 1945 Avusturya, inverter serileri (Galvo, Symo, Primo, SnapIN), enerji depolama detaylandırılmalı |
| general.mdx | ~1300 | Fujitsu General ortaklığı, klima serileri detaylandırılmalı |
| lg.mdx | ~1400 | Multi V, DUALCOOL, WHISEN serileri, R32/R410A gaz teknolojisi eklenmeli |
| mega.mdx | ~1300 | Endüstriyel pompa serileri, uygulama alanları (gıda, atık su) detaylandırılmalı |
| pimtas.mdx | ~1300 | 1977 kuruluş, U-PVC/HDPE boru serileri, vana tipleri (küresel, kelebek) eklenmeli |
| vesbo.mdx | ~1400 | PPR boru sistemleri, kaynak teknolojisi, basınç/sıcaklık değerleri eklenmeli |

**Durum:** ✅ FN-023 tarafından kapsanıyor (tümü)

## Büyük Markalar — FN-024 Kapsamında
(List each of the 25 "large" brands with pass/fail per criterion and specific gap notes)

**Durum:** ✅ FN-024 tarafından kapsanıyor (tümü)
(Or ❌ if any gaps found that FN-024 doesn't address)
```

- [ ] Save the complete report as task document: `fn_task_document_write(key="docs", content=<report>)`

**Artifacts:**
- Task document saved with key="docs" (the complete quality report)

### Step 3: Create New Tasks for Uncovered Gaps

After cross-referencing each finding against FN-021, FN-022, FN-023, and FN-024, identify any gaps NOT covered by existing subtasks:

**Known uncovered gaps to check:**
1. **Başlık çelişkileri:** radyal.mdx (title says "Vanalar" instead of "Radyatör") and beser.mdx (title says "Termostat" instead of "Su Deposu") — FN-022 covers content enrichment but may not fix the title mismatch in the YAML frontmatter. Determine if FN-022 covers this or a new task is needed.
2. **element.mdx kimliği:** Is "Element" a brand name or a generic category (resistive heating elements)? The page reads like a generic explainer, not a brand page. If it's a generic page, it should be moved out of `markalar/` or made into a brand-specific page. This is not covered by any existing subtask.
3. **Görsel eksikliği:** Many pages lack images entirely. None of the existing subtasks mention adding images. Determine if this is intentional (no brand images available) or requires a new task.
4. **Hizmet bağlantısı eksik markalar:** Some brands may lack any `/hizmetlerimiz/` link. Check if FN-018/FN-019/FN-020 cover this (they are sibling triage tasks in the same batch).
5. **Mintlify CardGroup dönüşümü:** FN-018/FN-019/FN-020 cover converting brand pages to CardGroup format. Confirm no brand page not covered.
6. **rehau.mdx** — exists but not mentioned in any category above. It's a well-formed page (~2KB). Verify it passes all criteria.

- [ ] For each uncovered gap, create a new task via `fn_task_create` with clear description, priority, and dependencies
- [ ] Update the quality report document to include the newly created task IDs and their coverage

**Artifacts:**
- New tasks created for uncovered gaps (via `fn_task_create`)
- Updated quality report (via `fn_task_document_write` with key="docs")

### Step 4: Verification & Validation

- [ ] Confirm all 47 brand files were analyzed (no omissions)
- [ ] Confirm the report includes at minimum: summary stats, per-file scores, per-gap recommendation, and coverage status mapped to existing/created task IDs
- [ ] Confirm all newly created tasks have valid dependency chains (reference only sibling tasks or pre-existing tasks; never reference FN-016 itself)
- [ ] Re-read the saved report document to verify completeness and accuracy

### Step 5: Documentation & Delivery

- [ ] Update `.fusion/memory/MEMORY.md` with the key findings from this audit, especially:
  - Any brand pages that need to be moved from `markalar/` to `hizmetlerimiz/` (e.g. tse.mdx is not a brand)
  - The title/description conflicts found (radyal, beser)
  - element.mdx identity determination
- [ ] Save the final quality report as task document via `fn_task_document_write(key="docs", content=<report>)`
- [ ] Any out-of-scope findings saved as new tasks via `fn_task_create`

## Documentation Requirements

**Must Save:**
- Comprehensive quality report via `fn_task_document_write(key="docs", content=...)` — the full scoring matrix, gap analysis, and task coverage map

**Must Update:**
- `.fusion/memory/MEMORY.md` — append key audit findings (title conflicts, page identity issues, uncovered gaps)

## Completion Criteria

- [ ] All 47 brand pages read and scored against all 5 criteria
- [ ] Complete quality report saved as task document (summary stats + per-file scores + gap analysis)
- [ ] Every identified quality gap mapped to an existing or newly created task
- [ ] New tasks created for all gaps not covered by FN-021, FN-022, FN-023, FN-024
- [ ] Report contains: per-file byte size, pass/fail per criterion, specific remediation notes, task coverage status
- [ ] Memory file updated with key findings

## Git Commit Convention

This task is read-only (no file modifications), so git commits are expected only if `fn_task_create` is unavailable and you need to produce a file-based record. If commits are needed:

- **Report completion:** `feat(FN-016): complete brand quality audit — N of 47 pages scored, M gaps found`
- **Memory update:** `docs(FN-016): update memory with brand audit findings`

## Do NOT

- Modify any brand `.mdx` or `.md` files — this task is analysis only
- Modify `docs.json`, `hizmetlerimiz.mdx`, `markalar.mdx`, or `custom.css`
- Create tasks that depend on FN-016 (the parent will be deleted after splitting — use sibling task IDs only)
- Skip pages because they appear "good enough" — every file must be scored
- Hardcode service page links or brand information without reading the actual file contents
- Remove, delete, or rename any files

## Frontend UX Criteria

This task is read-only analysis (does not create or modify frontend UI files). The Frontend UX Criteria section is omitted.
