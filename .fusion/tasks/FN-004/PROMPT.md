# Task: FN-004 — Move Hardcoded Credentials and Config to .env

**Created:** 2026-05-26
**Size:** S

## Review Level: 2 (Plan and Code)

**Assessment:** Straightforward credential extraction from a single shell script into standard `.env` + `.env.example` pattern. Low blast radius (one script, no product code), near-zero pattern novelty, but security-sensitive (plaintext DB password). Easy to revert.
**Score:** 5/8 — Blast radius: 1, Pattern novelty: 0, Security: 2, Reversibility: 2

## Mission

`scripts/daily-docs-enrichment.sh` contains a plaintext Neon.tech database password (`npg_fjQXK6w3iWDP`) in the hardcoded `DB_URL` variable, plus hardcoded `REPO_DIR` and `NOTEBOOK` values. Move all three into a `.env` file at the project root so the script reads them at runtime. Create `.env.example` (with dummy values) for onboarding/documentation, and add `.env` to a new `.gitignore` so the credential is never committed. The script should auto-detect `REPO_DIR` as a fallback (from its own location) so it remains runnable without a `.env` — but `DB_URL` is required and must fail explicitly if unset.

## Dependencies

- **None**

## Context to Read First

- `scripts/daily-docs-enrichment.sh` — the file to modify
- `README.md` — update with setup instructions

## File Scope

- `scripts/daily-docs-enrichment.sh` (modified)
- `.env` (new) — gitignored; contains the real values
- `.env.example` (new) — tracked; contains dummy placeholders
- `.gitignore` (new) — must include `.env`
- `README.md` (modified) — add .env setup instructions

## Steps

### Step 0: Preflight

- [ ] `scripts/daily-docs-enrichment.sh` exists and is readable
- [ ] No existing `.env` or `.gitignore` files in the project root (confirm absence — these files are NEW)
- [ ] Confirm current `REPO_DIR` and `DB_URL` values from the script for migration

### Step 1: Create `.gitignore` at project root

- [ ] Create `.gitignore` with entries: `.env`, `.env.local`, `.env.*.local` — standard `.env` gitignore pattern
- [ ] Verify `git status` shows `.gitignore` as an untracked file (confirm it's not already ignored)

**Artifacts:**
- `.gitignore` (new)

### Step 2: Create `.env` with real values and `.env.example` with placeholders

- [ ] Create `.env` at project root with these exact key-value pairs (extracted from the script):
  ```
  REPO_DIR=/Users/ebartan/gul-tekin-docs
  DB_URL=postgresql://neondb_owner:npg_fjQXK6w3iWDP@ep-polished-frog-adaec7m0-pooler.c-2.us-east-1.aws.neon.tech/neondb?sslmode=require
  NOTEBOOK=gultekin
  ```
- [ ] Create `.env.example` at project root with same keys but dummy safe values:
  ```
  REPO_DIR=/path/to/gul-tekin-docs
  DB_URL=postgresql://user:password@host:port/dbname?sslmode=require
  NOTEBOOK=my-notebook
  ```
- [ ] Verify `git status` shows `.env` is gitignored (not in untracked list) and `.env.example` IS untracked

**Artifacts:**
- `.env` (new, gitignored)
- `.env.example` (new)

### Step 3: Modify `scripts/daily-docs-enrichment.sh` to read from `.env`

- [ ] Replace hardcoded variables with environment variable reads + auto-detection fallback for `REPO_DIR`:
  - `REPO_DIR` at top of script:
    ```bash
    # Auto-detect repo root from script location, overrideable via .env
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    DEFAULT_REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

    # Source .env if present at repo root
    ENV_FILE="$DEFAULT_REPO_DIR/.env"
    [ -f "$ENV_FILE" ] && set -a && source "$ENV_FILE" && set +a

    # Final REPO_DIR: env var wins, fallback to auto-detect
    REPO_DIR="${REPO_DIR:-$DEFAULT_REPO_DIR}"
    ```
  - `LOG_FILE` stays derived from `REPO_DIR` as before
  - `NOTEBOOK`: use `${NOTEBOOK:-gultekin}` so the default is preserved but overridable
  - `DB_URL`: **required** — add an explicit check after sourcing `.env`:
    ```bash
    if [ -z "${DB_URL:-}" ]; then
      echo "ERROR: DB_URL is not set. Create a .env file at the project root with DB_URL." >&2
      exit 1
    fi
    ```
- [ ] Remove the old hardcoded lines:
  - `REPO_DIR="/Users/ebartan/gul-tekin-docs"`
  - `DB_URL="postgresql://neondb_owner:..."` (entire line)
  - `NOTEBOOK="gultekin"`
- [ ] Update the `cd "$REPO_DIR"` line — it still works because `REPO_DIR` is now set via env/fallback
- [ ] Run the script (add execute permission if missing: `chmod +x scripts/daily-docs-enrichment.sh`) — verify it starts without errors (use `bash -n scripts/daily-docs-enrichment.sh` for syntax check, and a dry-run mode: temporarily prepend `exit 0` at the top after sourcing to confirm `.env` loads without crash)
- [ ] Run targeted tests: `bash -n scripts/daily-docs-enrichment.sh` must pass

**Artifacts:**
- `scripts/daily-docs-enrichment.sh` (modified)

### Step 4: Testing & Verification

> ZERO test failures allowed. Full test suite as quality gate.
> If keeping lint/tests/build/typecheck green requires edits outside the initial File Scope, make those fixes as part of this task.

- [ ] Run syntax check: `bash -n scripts/daily-docs-enrichment.sh` exits 0
- [ ] Run a dry-load test using a temporary directory to confirm the script's env-loading logic correctly reads `.env` and exposes `DB_URL`:
  ```bash
  REPO_DIR_TEST=$(mktemp -d)
  cp scripts/daily-docs-enrichment.sh "$REPO_DIR_TEST/test.sh"
  echo 'DB_URL=test_value' > "$REPO_DIR_TEST/.env"
  cd "$REPO_DIR_TEST"
  bash -c '
    ENV_FILE=".env"
    [ -f "$ENV_FILE" ] && source "$ENV_FILE"
    [ -z "${DB_URL:-}" ] && { echo "FAIL: DB_URL not set"; exit 1; } || echo "PASS: DB_URL=$DB_URL"
  '
  rm -rf "$REPO_DIR_TEST"
  ```
- [ ] Verify `.env` is gitignored: `git check-ignore .env` must return the path
- [ ] Verify `.env.example` is NOT gitignored: `git check-ignore .env.example` must return non-zero
- [ ] Fix all failures
- [ ] Build passes (if any build command exists)

### Step 5: Documentation & Delivery

- [ ] Update `README.md` with a setup section:
  ```markdown
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
  ```
- [ ] Save documentation deliverables as task documents via `fn_task_document_write` (key="docs", content=summary of changes)
- [ ] Out-of-scope findings created as new tasks via `fn_task_create` tool — specifically: check if `add_meta_descriptions.py` also has hardcoded paths that should follow the same pattern (if yes, create a task for that)

**Artifacts:**
- `README.md` (modified)

## Documentation Requirements

**Must Update:**
- `README.md` — add Setup section with .env instructions

**Check If Affected:**
- (no other docs affected)

## Completion Criteria

- [ ] All steps complete
- [ ] `bash -n scripts/daily-docs-enrichment.sh` passes
- [ ] `.env` is gitignored (verified via `git check-ignore`)
- [ ] `.env.example` is tracked with dummy values
- [ ] Script runs with `.env` values and fails explicitly when `DB_URL` is missing
- [ ] `README.md` updated with setup instructions

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-004): complete Step N — description`
- **Bug fixes:** `fix(FN-004): description`
- **Tests:** `test(FN-004): description`

## Do NOT

- Expand task scope to other scripts (e.g., `add_meta_descriptions.py` — that's FN-009)
- Commit `.env` with real credentials to git
- Remove or modify any functionality of the enrichment script beyond the variable extraction
- Skip gitignore verification step
- Commit without the task ID prefix
- Remove, delete, or gut modules, settings, interfaces, exports, or test files outside the File Scope
- Remove features as "cleanup" — if something seems unused, create a task via `fn_task_create`

## Changeset Requirements

This task does NOT remove existing functionality — it extracts hardcoded values to a config file and preserves all defaults. No changeset file required.
