# Gül-Tekin Mühendislik Docs

- Hidrofor hizmetler
- tab sekme

## Setup

1. Copy `.env.example` to `.env`:
   ```bash
   cp .env.example .env
   ```
2. Edit `.env` with your actual values (DB_URL, NOTEBOOK, REPO_DIR)
3. Run the enrichment script:
   ```bash
   ./scripts/daily-docs-enrichment.sh
   ```
