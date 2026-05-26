#!/bin/bash
# Gül-Tekin Mühendislik - Günlük Docs Zenginleştirme Script
# Her gün 1 hizmet + 1 marka sayfasını NotebookLM'den bilgi alarak zenginleştirir
# Mintlify: push → otomatik deploy (free tier: 1 concurrent build, sınırsız deploy)

set -uo pipefail

# Auto-detect repo root from script location, overrideable via .env
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEFAULT_REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

# Source .env if present at repo root
ENV_FILE="$DEFAULT_REPO_DIR/.env"
[ -f "$ENV_FILE" ] && set -a && source "$ENV_FILE" && set +a

# Final REPO_DIR: env var wins, fallback to auto-detect
REPO_DIR="${REPO_DIR:-$DEFAULT_REPO_DIR}"
LOG_FILE="$REPO_DIR/scripts/docs-enrichment.log"
NOTEBOOK="${NOTEBOOK:-gultekin}"

# DB_URL is required
if [ -z "${DB_URL:-}" ]; then
  echo "ERROR: DB_URL is not set. Create a .env file at the project root with DB_URL." >&2
  exit 1
fi

log() { echo "$(date +%Y-%m-%d\ %H:%M:%S): $1" >> "$LOG_FILE"; }

cd "$REPO_DIR"

# ─── 1. NLM Session Check ───
if ! nlm login --check 2>/dev/null | grep -q "valid"; then
  log "Session expired, re-login needed"
  nlm login 2>/dev/null || { log "Login failed"; exit 1; }
fi

# ─── 2. En zayıf hizmet sayfasını seç ───
log "Selecting weakest service page..."

WEAKEST_SERVICE=""
WEAKEST_LINES=999
for f in hizmetlerimiz/*.mdx; do
  lines=$(wc -l < "$f")
  name=$(basename "$f" .mdx)
  if [ "$lines" -lt "$WEAKEST_LINES" ]; then
    WEAKEST_LINES=$lines
    WEAKEST_SERVICE="$name"
  fi
done

log "Weakest service: $WEAKEST_SERVICE ($WEAKEST_LINES lines)"

# ─── 3. En zayıf marka sayfasını seç ───
log "Selecting weakest brand page..."

WEAKEST_BRAND=""
WEAKEST_BRAND_LINES=999
for f in markalar/*.md*; do
  lines=$(wc -l < "$f")
  name=$(basename "$f" .mdx | sed 's/.md$//')
  if [ "$lines" -lt "$WEAKEST_BRAND_LINES" ]; then
    WEAKEST_BRAND_LINES=$lines
    WEAKEST_BRAND="$name"
  fi
done

log "Weakest brand: $WEAKEST_BRAND ($WEAKEST_BRAND_LINES lines)"

# ─── 4. NotebookLM'den hizmet bilgisi al ───
log "Querying NLM for service: $WEAKEST_SERVICE"

SERVICE_QUERY=$(python3 << PYEOF
import subprocess, json

# Map service slug to Turkish query
queries = {
    "akilli-oda-termostatlari": "Akıllı oda termostatları nasıl çalışır, faydaları, montaj ve Bodrum'da kullanım",
    "klima-sistemleri": "Klima sistemleri türleri VRF VRV split kaset Bodrum villa klimaları",
    "radyator": "Radyatör sistemleri alüminyum panel döküm Bodrum ısınma çözümleri",
    "su-aritma-sistemleri": "Su arıtma sistemleri villa için filtreleme yumuşatma Bodrum",
    "su-depolari": "Su deposu seçimi GRP prismatic modüler Bodrum villa su deposu",
    "tahliye-istasyonu": "Tahliye istasyonu atık su pompa sistemleri Bodrum villa",
    "termosifonik-sistemler": "Termosifonik sistemler güneş enerjili su ısıtma Bodrum",
    "pompalar": "Pompa sistemleri drenaj sirkülasyon hidrofor Bodrum",
    "sulama-sistemleri": "Sulama sistemleri otomatik damla yağmurlama Bodrum villa bahçe",
    "mekanik-sihhi-tesisat": "Mekanik sıhhi tesisat su tesisatı Bodrum villa inşaat",
    "isi-pompalari": "Isı pompası çalışma prensibi monoblok split Bodrum iklimi avantajları",
    "gunes-enerjisi": "Güneş enerjisi sistemleri fotovoltaik panel Bodrum villa elektrik üretimi",
    "hidrofor-sistemleri": "Hidrofor sistemleri villa su basıncı paket hidrofor Bodrum",
    "yerden-isitma-sistemleri": "Yerden ısıtma sistemleri PEX-a manifold Bodrum villa konfor",
    "gunes-enerjisi-ile-elektrik-uretimi": "Güneş enerjisi ile elektrik üretimi fotovoltaik Bodrum villa",
    "gunes-enerjisi-ile-su-isitma": "Güneş enerjisi ile su ısıtma termosifonik Bodrum"
}

slug = "$WEAKEST_SERVICE"
query = queries.get(slug, f"{slug} hakkında detaylı teknik bilgi ve Bodrum'da uygulama")
print(query)
PYEOF
)

SERVICE_INFO=$(nlm notebook query "$NOTEBOOK" "$SERVICE_QUERY" 2>/dev/null || echo "")
log "NLM service query done (${#SERVICE_INFO} chars)"

# ─── 5. NotebookLM'den marka bilgisi al ───
log "Querying NLM for brand: $WEAKEST_BRAND"

BRAND_QUERY="${WEAKEST_BRAND} marka ürünleri teknik özellikleri Türkiye distribütörü ve Bodrum'da kullanım"
BRAND_INFO=$(nlm notebook query "$NOTEBOOK" "$BRAND_QUERY" 2>/dev/null || echo "")
log "NLM brand query done (${#BRAND_INFO} chars)"

# ─── 6. İçerik zenginleştirme ───
# Service page enrichment
SERVICE_FILE="hizmetlerimiz/${WEAKEST_SERVICE}.mdx"
if [ -f "$SERVICE_FILE" ] && [ -n "$SERVICE_INFO" ]; then
  log "Enriching service: $SERVICE_FILE"
  
  python3 << PYEOF
import re, os

service_file = "$SERVICE_FILE"
info = """$SERVICE_INFO"""
slug = "$WEAKEST_SERVICE"

with open(service_file, 'r') as f:
    content = f.read()

# Extract frontmatter
fm_match = re.match(r'^---\n(.*?)\n---\n(.*)', content, re.DOTALL)
if fm_match:
    frontmatter = fm_match.group(1)
    body = fm_match.group(2)
else:
    frontmatter = ""
    body = content

# Add NLM-sourced section if not already there
if "## Teknik Detaylar" not in body:
    # Add technical details section from NLM
    enriched = body.rstrip()
    if enriched:
        enriched += "\n\n"
    enriched += f"""## Teknik Detaylar

{info[:1500]}

## Bodrum'da {slug.replace('-', ' ').title()}

Gül-Tekin Mühendislik, Bodrum yarımadası genelinde {slug.replace('-', ' ')} hizmetleri sunmaktadır. Yalıkavak, Gümüşlük, Göltürkbükü, Bitez, Konacık ve Türkbükü başta olmak üzere tüm Bodrum'da profesyonel çözüm ortağınız.

[İletişim](/contact) | [Tüm Hizmetler](/hizmetlerimiz)
"""
    
    with open(service_file, 'w') as f:
        f.write(f"---\n{frontmatter}\n---\n{enriched}")
    
    print(f"ENRICHED: {service_file}")
else:
    print(f"SKIP: {service_file} already has Teknik Detaylar")
PYEOF

fi

# Brand page enrichment
BRAND_FILE=""
for ext in mdx md; do
  if [ -f "markalar/${WEAKEST_BRAND}.${ext}" ]; then
    BRAND_FILE="markalar/${WEAKEST_BRAND}.${ext}"
    break
  fi
done

if [ -n "$BRAND_FILE" ] && [ -f "$BRAND_FILE" ] && [ -n "$BRAND_INFO" ]; then
  log "Enriching brand: $BRAND_FILE"
  
  python3 << PYEOF
import re

brand_file = "$BRAND_FILE"
info = """$BRAND_INFO"""
brand = "$WEAKEST_BRAND"

with open(brand_file, 'r') as f:
    content = f.read()

# Extract frontmatter
fm_match = re.match(r'^---\n(.*?)\n---\n(.*)', content, re.DOTALL)
if fm_match:
    frontmatter = fm_match.group(1)
    body = fm_match.group(2)
else:
    frontmatter = ""
    body = content

# Add brand details if not already rich
if "## Ürün Grupları" not in body and "## Teknik Bilgi" not in body:
    enriched = body.rstrip()
    if enriched:
        enriched += "\n\n"
    enriched += f"""## Teknik Bilgi

{info[:1500]}

## Gül-Tekin Mühendislik ile {brand.title()}

Gül-Tekin Mühendislik, {brand.title()} ürünlerinin Bodrum'daki yetkili satış ve uygulama partneridir. Kurulum, bakım ve teknik destek hizmetlerimizden yararlanmak için [iletişime geçin](/contact).

[Tüm Markalar](/markalar) | [Hizmetlerimiz](/hizmetlerimiz)
"""
    
    with open(brand_file, 'w') as f:
        f.write(f"---\n{frontmatter}\n---\n{enriched}")
    
    print(f"ENRICHED: {brand_file}")
else:
    print(f"SKIP: {brand_file} already rich")
PYEOF

fi

# ─── 7. Git commit & push ───
CHANGES=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
if [ "$CHANGES" -gt 0 ]; then
  git add -A
  git commit -m "docs: enrich $WEAKEST_SERVICE service + $WEAKEST_BRAND brand pages via NLM" 2>/dev/null
  git push origin main 2>/dev/null
  log "Pushed $CHANGES changes (service: $WEAKEST_SERVICE, brand: $WEAKEST_BRAND)"
else
  log "No changes to push"
fi

log "Done"
