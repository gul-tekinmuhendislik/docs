# Project Memory

<!-- This file stores durable project learnings. Agents consult and update it during triage and execution. -->

## Architecture

<!-- Key architectural patterns, module boundaries, and design decisions -->

## Conventions

<!-- Project-specific coding standards, naming patterns, file organization -->

## Pitfalls

<!-- Known issues, common mistakes, and things to avoid -->

## Context

<!-- Important background information, dependency constraints, deployment notes -->

## Brand Identity: "Warmeks" = "Varmeks" (Same Brand)

- **warmeks** and **varmeks** are the SAME brand. "Warmeks" is a misspelling.
- Primary evidence: `markalar/warmeks.mdx` contains an NLM-generated JSON answer field that explicitly states: `"Varmeks (veya kaynaklarda geçtiği haliyle Warmeks)"`
- Product series match: warmeks.mdx describes Varm Up, Varm Silent Pool, Varm Boost, Varm Fuzzy — varmeks.md describes Varm Up, Varm Fuzzy, Varm Commercial, Varm Plus, Varm Pool, Varm BCP, Varm All.
- Navigation authority: `docs.json` references `"markalar/varmeks"` (3 occurrences) but never `"markalar/warmeks"`.
- NLM enrichment log shows the pipeline queried for brand "warmeks" (the misspelled slug) because that's what the filename was at enrichment time.
- **Impact on task ordering:** FN-021 (format fixes) and FN-002 (merge + spelling fix) both touch the same files. FN-021 fixes format issues independently; FN-002 consumes those fixes and does the full merge/consolidation.

## FN-019: Brand Pages — İlgili Hizmetlerimiz CardGroup pattern

Added `## İlgili Hizmetlerimiz` (without star emoji) `<CardGroup>` sections after the last external `class="link-card featured"` section on 23 brand pages. The pattern maps external headings like `## 🌟 Isı Pompası Hizmetlerimiz` to internal Card links like `<Card title="Isı Pompaları" href="/hizmetlerimiz/isi-pompalari">`. For multi-section pages, all applicable Cards are included in a single CardGroup. No `icon` attribute should be used on Card components. External link-card sections must remain intact — only additive changes are allowed.

## FN-027: ORTA SEVIYE MARKALAR - Grup A (astral, beser, demirdokum, eca)

- FN-027 enriches 4 mid-level brand pages (astral, beser, demirdokum, eca) from ~1400-1581 bytes to ≥2000 bytes
- **Depends on FN-019** (in-review) which adds `## İlgili Hizmetlerimiz` CardGroups to demirdokum.mdx and eca.mdx
- astral.mdx and beser.mdx are NOT covered by FN-019 — they get new `## İlgili Hizmetlerimiz` sections from scratch
- **CRITICAL:** beser.mdx title must be fixed from "Beşer Akıllı Oda Termostatları" to "Beşer Su Depoları" (brand makes water tanks, not thermostats)
- FN-023 (in-progress) originally covered all 12 medium brands; FN-027/028/029 are subgroup decompositions
