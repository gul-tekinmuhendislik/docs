# Task: FN-013 — Service Pages (Part 1) — Heat/Climate related

**Created:** 2026-05-26
**Size:** S

## Review Level: 1 (Plan Only)

**Assessment:** Straightforward text replacement of bullet-point brand lists with Mintlify CardGroup/Card components across 7 service pages. Pattern is well-established by the existing `su-aritma-sistemleri.mdx` reference. No new functionality, no data changes, no risk to existing content outside the replaced lists.
**Score:** 2/8 — Blast radius: 1, Pattern novelty: 0, Security: 0, Reversibility: 1

## Mission

Replace bullet-point brand lists in 7 heat/climate-related service pages with Mintlify `<CardGroup>` / `<Card>` components, following the exact pattern established in `hizmetlerimiz/su-aritma-sistemleri.mdx`. This improves the visual presentation of brand references across the site using Mintlify's native card layout instead of raw markdown lists. Each page's brand data (which brands, what href) stays the same — only the markup changes. Descriptive text below each brand in the original list must be preserved as content inside the Card component.

## Frontend UX Criteria

- [ ] **Design tokens only** — no hardcoded `px` values except `0`, no hardcoded hex/rgb colors; use CSS custom properties (`--color-*`, `--spacing-*`, etc.)
- [ ] **Icon sizing** — match the surrounding component's icon size convention (default lucide size unless the local pattern already uses an explicit `size={N}`)
- [ ] **Semantic color tokens for status** — use `--color-error` for stderr/error states, `--color-warning` for starting/pending states; never hardcode status colors
- [ ] **Component reuse** — reach for existing classes (`.btn`, `.btn-icon`, `.card`, `.input`) before writing one-off styles
- [ ] **Responsive scaffolding** — add `@media (max-width: 768px)` overrides for any new layout; verify mobile usability
- [ ] **Single canonical nav destination** — each route must appear in exactly one of: Header primary nav, Header overflow menu, or MobileNavBar More; no duplicates across all three
- [ ] **Status-indicator dot convention** — use the existing `.status-dot` pattern (size, border, animation) rather than custom dot styling
- [ ] **Visual hierarchy preserved** — new elements must not disrupt heading levels, content flow, or information architecture established in the surrounding page

## Dependencies

- **None** (all 7 files exist and are independent of other in-flight tasks)

## Context to Read First

1. `hizmetlerimiz/su-aritma-sistemleri.mdx` — the reference implementation showing the CardGroup/Card pattern
2. All 7 target files (read each to verify current brand list state before editing):
   - `hizmetlerimiz/isi-pompalari.mdx`
   - `hizmetlerimiz/klima-sistemleri.mdx`
   - `hizmetlerimiz/radyator.mdx`
   - `hizmetlerimiz/yerden-isitma-sistemleri.mdx`
   - `hizmetlerimiz/akilli-oda-termostatlari.mdx`
   - `hizmetlerimiz/termosifonik-sistemler.mdx`
   - `hizmetlerimiz/su-depolari.mdx`

## File Scope

- `hizmetlerimiz/isi-pompalari.mdx`
- `hizmetlerimiz/klima-sistemleri.mdx`
- `hizmetlerimiz/radyator.mdx`
- `hizmetlerimiz/yerden-isitma-sistemleri.mdx`
- `hizmetlerimiz/akilli-oda-termostatlari.mdx`
- `hizmetlerimiz/termosifonik-sistemler.mdx`
- `hizmetlerimiz/su-depolari.mdx`

## Steps

### Step 0: Preflight

- [ ] Verify the 7 target `.mdx` files exist under `hizmetlerimiz/`
- [ ] Verify the reference file `hizmetlerimiz/su-aritma-sistemleri.mdx` exists and contains the CardGroup pattern to follow
- [ ] Read each target file to confirm current brand list content before editing — do not rely solely on the spec description (file states may have changed)

### Step 1: isi-pompalari.mdx — Convert brand lists

This page has two separate brand listing sections:

**Section A — "## İlgili Markalar"** (12 brands):
Replace the bullet-point list under `## İlgili Markalar` with a single `<CardGroup>` containing `<Card>` components for these brands in the same order:

| title | icon | href | descriptive text to preserve inside `<Card> ... </Card>` |
|-------|------|------|--------------------------------------------------------|
| Alarko | alarko | /markalar/alarko | Isıtma, soğutma ve havalandırma alanlarında bütünsel çözümler sunan Alarko, verimli ve güvenilir ısı pompaları üretmektedir. |
| Aldea | aldea | /markalar/aldea | Türkiye'nin önde gelen ısı pompası üreticilerinden olan Aldea, çevre dostu ve enerji verimliliği yüksek ürünler sunmaktadır. |
| Baymak | baymak | /markalar/baymak | Türkiye'nin köklü markası Baymak, "Iotherm" serisi ile konutlar için yüksek verimli ısı pompası çözümleri sağlamaktadır. |
| Demirdöküm | demirdokum | /markalar/demirdokum | Isıtma sektörünün liderlerinden Demirdöküm, "MaxiAir" serisi ile çevre dostu ve tasarruflu ısı pompaları sunmaktadır. |
| ECA | eca | /markalar/eca | Tesisat ve iklimlendirme sektörünün öncü markası ECA, monoblok tipte yüksek verimli ve kullanıcı dostu ısı pompaları üretmektedir. |
| General | general | /markalar/general | Japon teknoloji devi Fujitsu'nun bir parçası olan General, yüksek kaliteli ve dayanıklı klima ve ısı pompası sistemleri sunmaktadır. |
| LG | lg | /markalar/lg | Teknoloji lideri LG, "Therma V" serisi ile yenilikçi ve yüksek performanslı ısı pompası çözümleri geliştirmektedir. |
| Panasonic | panasonic | /markalar/panasonic | Elektronik ve iklimlendirme devi Panasonic, "Aquarea" serisi ile yüksek enerji verimliliğine sahip ısı pompaları üretmektedir. |
| Rehau | rehau | /markalar/rehau | Polimer bazlı çözümlerde dünya lideri olan Rehau, özellikle yerden ısıtma sistemleriyle entegre, yüksek verimli ısı pompaları sunar. |
| Solimpeks | solimpeks | /markalar/solimpeks | Güneş enerjisi sistemleri uzmanı Solimpeks, yenilenebilir enerji çözümlerinin bir parçası olarak çeşitli ısı pompaları üretmektedir. |
| Toshiba | toshiba | /markalar/toshiba | Japon teknoloji devi Toshiba, "Estia" serisi ile konutlar ve ticari alanlar için yüksek verimli havadan suya ısı pompaları sunmaktadır. |
| Varmeks | varmeks | /markalar/varmeks | Türkiye'nin önde gelen yerli ısı pompası üreticilerinden olan Varmeks, geniş bir ürün yelpazesi ile yenilikçi çözümler sunmaktadır. |

**Section B — "### Havuz Isıtma Çözümleri"** (1 brand):
Replace the single bullet point under `### Havuz Isıtma Çözümleri` with a `<CardGroup>` containing:

| title | icon | href | descriptive text |
|-------|------|------|-----------------|
| Astral (AstralPool) | astral | /markalar/astral | Havuz ekipmanları lideri olan Astral, özellikle yüzme havuzlarının ısıtılması için tasarlanmış verimli ısı pompaları üretmektedir. |

**Preserve the subsection heading `### Havuz Isıtma Çözümleri`** and the section heading `## İlgili Markalar` — only replace the bullet-point lists within each section.

Card format (descriptive text placed between `<Card>` and `</Card>` tags, after any closing `>` if the card has attributes):

```mdx
<CardGroup>
  <Card title="Alarko" icon="alarko" href="/markalar/alarko">
    Isıtma, soğutma ve havalandırma alanlarında bütünsel çözümler sunan Alarko, verimli ve güvenilir ısı pompaları üretmektedir.
  </Card>
  ...
</CardGroup>
```

- [ ] Replace the 12-brand bullet list under `## İlgili Markalar` with a CardGroup
- [ ] Replace the single-brand bullet under `### Havuz Isıtma Çözümleri` with a CardGroup
- [ ] Verify all brand links, descriptive text, and ordering are preserved

### Step 2: klima-sistemleri.mdx — Convert brand lists

This page has no `## İlgili Markalar` heading. Instead, brands are organized under descriptive subheadings. Replace each bullet list under its respective heading with its own CardGroup.

**Section A — "### Japon Teknoloji Markaları"** (3 brands):

| title | icon | href | descriptive text |
|-------|------|------|-----------------|
| General | general | /markalar/general | Fujitsu tarafından üretilen, zorlu koşullarda dahi güvenle çalışan bir klima markasıdır. |
| Panasonic | panasonic | /markalar/panasonic | Özellikle VRF sistemleri ve inverter teknolojili klimaları ile sektörün liderlerindendir. |
| Toshiba | toshiba | /markalar/toshiba | Konut tipi split klimalardan ticari tip VRF sistemlere kadar geniş bir ürün yelpazesi sunar. |

**Section B — "### Global Teknoloji Lideri"** (1 brand):

| title | icon | href | descriptive text |
|-------|------|------|-----------------|
| LG | lg | /markalar/lg | Yenilikçi, enerji verimli ve estetik tasarımlı klimaları ile tanınan bir dünya markasıdır. |

**Section C — "### Yerli ve Köklü Markalar"** (2 brands):

| title | icon | href | descriptive text |
|-------|------|------|-----------------|
| Demirdöküm | demirdokum | /markalar/demirdokum | İklimlendirme sektöründeki geniş ürün yelpazesi içinde klimalar da bulunmaktadır. |
| E.C.A. | eca | /markalar/eca | Isıtma ve soğutma alanındaki tecrübesiyle klima çözümleri sunmaktadır. |

- [ ] Replace each section's bullet list with its own CardGroup
- [ ] Preserve the section heading text and any introductory paragraphs between them
- [ ] Verify brand links and ordering

### Step 3: radyator.mdx — Convert brand lists

**Section A — "### Radyatör Üreticileri"** (3 brands):

| title | icon | href | descriptive text |
|-------|------|------|-----------------|
| Demirdöküm | demirdokum | /markalar/demirdokum | Geniş ürün yelpazesi içinde panel radyatörler sunan köklü bir markadır. |
| E.C.A. | eca | /markalar/eca | Isıtma sistemleri kapsamında panel radyatör üretimi yapmaktadır. |
| Radyal | radyal | /markalar/radyal | Modern ve estetik tasarımlı alüminyum radyatör ve havlupan üretiminde uzmanlaşmıştır. |

**Section B — "### Tamamlayıcı Ürünler"** (1 brand):

| title | icon | href | descriptive text |
|-------|------|------|-----------------|
| Tekneciler | tekneciler | /markalar/tekneciler | Radyatörlerin verimli çalışması için gerekli olan radyatör vanaları gibi kritik bileşenleri üretmektedir. |

- [ ] Replace each section's bullet list with its own CardGroup
- [ ] Preserve headings
- [ ] Verify links and ordering

### Step 4: yerden-isitma-sistemleri.mdx — Convert brand lists

**Section A — "### Ana Sistem ve Boru Üreticileri"** (3 brands):

| title | icon | href | descriptive text |
|-------|------|------|-----------------|
| Rehau | rehau | /markalar/rehau | Sektör lideri olarak, yüksek kaliteli PEX boruları, kolektörleri ve otomasyonu içeren komple yerden ısıtma sistemleri sunar. |
| Hakan Plastik (GF) | hakan-plastik | /markalar/hakan-plastik | Yerden ısıtma sistemlerinin temelini oluşturan, oksijen bariyerli PEX ve PE-RT boruların önemli bir üreticisidir. |
| Vesbo | vesbo | /markalar/vesbo | Isıtma sistemleri için özel olarak geliştirilmiş, oksijen bariyerli, uzun ömürlü PEX borular üretmektedir. |

**Section B — "### Kritik Bileşen Üreticileri (Pompa, Otomasyon, Kolektör)"** (7 brands):

| title | icon | href | descriptive text |
|-------|------|------|-----------------|
| Caleffi | caleffi | /markalar/caleffi | Kolektörler, pompalar, vanalar ve otomasyon üniteleri gibi yerden ısıtma sistemlerinin verimli çalışması için kritik bileşenler üretir. |
| Grundfos | grundfos | /markalar/grundfos | Isıtma suyunun sistem içinde verimli bir şekilde dolaşımını sağlayan yüksek teknolojili sirkülasyon pompalarının lider üreticisidir. |
| Wilo | wilo | /markalar/wilo | Enerji verimli ve akıllı kontrol özelliklerine sahip sirkülasyon pompaları ile yerden ısıtma sistemleri için çözümler sunar. |
| Wepomp | wepomp | /markalar/wepomp | Isıtma sistemlerinde suyun dolaşımı için güvenilir ve çeşitli sirkülasyon pompası modelleri üretmektedir. |
| Standart Pompa | standart | /markalar/standart | Yerli üretimin önemli markalarından biri olarak, ısıtma sistemleri için geniş bir sirkülasyon pompası yelpazesi sunar. |
| Honeywell | honeywell | /markalar/honeywell | Hassas sıcaklık kontrolü ve enerji verimliliği sağlayan, kablolu ve akıllı oda termostatları konusunda uzmandır. |
| Siemens | siemens | /markalar/siemens | Akıllı bina teknolojileri kapsamında, yerden ısıtma sistemlerinin hassas kontrolü için basit ve akıllı otomasyon çözümleri sunar. |

**Preserve the parent heading `## İlgili Markalar ve Çözümlerimiz`** and both `###` subsection headings.

- [ ] Replace each section's bullet list with its own CardGroup
- [ ] Preserve all subsection headings and any introductory text between them

### Step 5: akilli-oda-termostatlari.mdx — Convert brand lists

No `## İlgili Markalar` heading. Brands are under descriptive subheadings.

**Section A — "### Akıllı Otomasyon ve Termostat Üreticileri"** (2 brands):

| title | icon | href | descriptive text |
|-------|------|------|-----------------|
| Honeywell | honeywell | /markalar/honeywell | Bina otomasyonu ve HVAC sistemleri için geliştirdiği akıllı oda termostatları ile enerji verimliliği ve konforu bir arada sunar. |
| Siemens | siemens | /markalar/siemens | Akıllı bina teknolojileri kapsamında, ısıtma sistemlerinin hassas kontrolü için basit ve akıllı otomasyon ve termostat çözümleri sunar. |

**Section B — "### Sistem Entegre Çözümler"** (2 brands):

| title | icon | href | descriptive text |
|-------|------|------|-----------------|
| Nobo | nobo | /markalar/nobo | Elektrikli konvektör ısıtıcıları için ortam sıcaklığını hassas bir şekilde kontrol eden gelişmiş termostat teknolojisi kullanır. |
| Caleffi | caleffi | /markalar/caleffi | Isıtma ve yerden ısıtma sistemlerinin verimli çalışması için otomasyon üniteleri ve kontrol bileşenleri üretmektedir. |

- [ ] Replace each section's bullet list with its own CardGroup
- [ ] Preserve headings and any introductory text

### Step 6: termosifonik-sistemler.mdx — Convert brand list

Single section `## İlgili Markalar` with 6 brands and NO descriptive text per brand (just bare links).

Replace the bullet-point list with a single CardGroup:

| title | icon | href |
|-------|------|------|
| Aldea | aldea | /markalar/aldea |
| Baymak | baymak | /markalar/baymak |
| Demirdöküm | demirdokum | /markalar/demirdokum |
| Solimpeks | solimpeks | /markalar/solimpeks |
| Toshiba | toshiba | /markalar/toshiba |
| Varmeks | varmeks | /markalar/varmeks |

Since there is no descriptive text, use self-closing `<Card>` tags: `<Card title="Aldea" icon="aldea" href="/markalar/aldea"></Card>`

- [ ] Replace the bullet list under `## İlgili Markalar` with a CardGroup
- [ ] Verify brand links and ordering

### Step 7: su-depolari.mdx — Convert brand list

Single section `## İlgili Markalar` with 3 brands, NO descriptive text per brand.

| title | icon | href |
|-------|------|------|
| Beşer | beser | /markalar/beser |
| Yelkenci | yelkenci | /markalar/yelkenci |
| Solimpeks | solimpeks | /markalar/solimpeks |

Use self-closing `<Card>` tags.

- [ ] Replace the bullet list under `## İlgili Markalar` with a CardGroup
- [ ] Verify brand links and ordering

### Step 8: Testing & Verification

> This is a Mintlify documentation site with no package.json, test runner, or CI pipeline. Validation is done via manual file review and visual inspection of the rendered output.

- [ ] For each of the 7 modified files, verify:
  - No broken Markdown/MDX syntax (check that all `<CardGroup>`, `<Card>` tags are properly opened/closed)
  - No leftover bullet-point syntax (`*   [...]`)
  - All brand link `href` values point to valid markalar/ pages
  - All descriptive text from original lists is preserved inside `<Card>` tags
  - Section headings and non-brand content above/below the replaced sections are fully intact
- [ ] Open the rendered site (run `npx mintlify dev` if mintlify CLI is installed, or inspect the `.mdx` files for structural correctness) and visually confirm CardGroups render with correct brand cards
- [ ] Fix any issues found

### Step 9: Documentation & Delivery

- [ ] Save a summary of changes as a task document: `fn_task_document_write(key="changes", content="...")` listing which files were modified and a brief summary of brands converted per file
- [ ] If any brand appears in these pages but has NO corresponding `.mdx` file in `markalar/`, create a new task via `fn_task_create` to add the missing brand page

## Documentation Requirements

**Must Update:**
- This task produces no standalone documentation; the `.mdx` file changes are self-documenting

**Check If Affected:**
- `hizmetlerimiz/hizmetlerimiz.mdx` — check if the index page references any brand link structures that might need updating (unlikely, but verify)

## Completion Criteria

- [ ] All 7 service pages have their brand bullet-point lists replaced with CardGroup/Card components
- [ ] Each CardGroup uses the established pattern (`<Card title="..." icon="..." href="...">desc</Card>` or self-closing for bare links)
- [ ] All original brand links, ordering, and descriptive text are preserved
- [ ] Section headings and non-brand content are unchanged
- [ ] No broken MDX syntax in any modified file
- [ ] Changes summary saved as task document

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-013): complete Step N — converted {page-name} brand lists to CardGroup`
- **Bug fixes:** `fix(FN-013): description`
- **Final:** `feat(FN-013): convert 7 heat/climate service page brand lists to CardGroup components`

## Do NOT

- Change any content other than the brand bullet-point lists themselves (preserve headings, descriptions, technical content, contact sections, and all other page content)
- Remove the descriptive text that accompanied each brand — place it inside the Card component instead
- Reorder brands from their original listing order
- Add or remove brands from the lists
- Modify files outside the declared File Scope
- Refuse to fix issues found during verification

## Changeset Requirements

This task does NOT remove existing functionality — it only replaces markup. No changeset file is required.
