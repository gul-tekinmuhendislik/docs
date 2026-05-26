# Task: FN-010 — Add prefers-reduced-motion support for link-card and brand-card hover animations

**Created:** 2026-05-26
**Size:** S

## Review Level: 1 (Plan Only)

**Assessment:** Single-file CSS change with zero blast radius, well-understood pattern, no security implications, and trivially reversible.
**Score:** 2/8 — Blast radius: 0, Pattern novelty: 1, Security: 0, Reversibility: 1

## Mission

Add a `@media (prefers-reduced-motion: reduce)` media query to `custom.css` that disables `transform: translateY()` hover animations on `.link-card` and `.brand-card` components. This is an accessibility improvement for users who experience motion sensitivity — it uses an industry-standard media query to suppress unnecessary movement without changing the visual layout or behavior for users who don't need it.

## Dependencies

- **None**

## Context to Read First

- `custom.css` — the only file to modify

## File Scope

- `custom.css` (modified)

## Steps

### Step 0: Preflight

- [ ] `custom.css` exists in project root
- [ ] File contains `.link-card:hover` and `.brand-card:hover` rules with `transform: translateY()`

### Step 1: Add prefers-reduced-motion override

Add the following media query block at the **end** of `custom.css` (after the existing `@media (max-width: 768px)` responsive block):

```css
/* Reduced motion for accessibility */
@media (prefers-reduced-motion: reduce) {
  .link-card:hover,
  .link-card.featured:hover,
  .brand-card:hover {
    transform: none;
  }
}
```

Note: `.link-card.featured:hover` is included alongside `.link-card:hover` because the `.featured` variant applies `translateY(-4px)` via a more specific selector (`.link-card.featured:hover`), which would otherwise override the `transform: none` on the base `.link-card:hover` rule in the media query.

- [ ] Media query added after the existing `@media (max-width: 768px)` block — not nested inside it
- [ ] All three hover transforms are suppressed: `.link-card:hover`, `.link-card.featured:hover`, `.brand-card:hover`
- [ ] Verify no syntax errors — all selectors and braces are balanced

**Artifacts:**
- `custom.css` (modified)

### Step 2: Testing & Verification

> ZERO test failures allowed. Full test suite as quality gate.
> If keeping lint/tests/build/typecheck green requires edits outside the initial File Scope, make those fixes as part of this task.

- [ ] Check CSS validity — run a CSS syntax checker if available, otherwise visually verify the file parses correctly
- [ ] Confirm the media query is at the correct location (end of file, not nested in any other block)
- [ ] Confirm `.link-card.featured:hover` is included in the selector list (prevents specificity override)
- [ ] Confirm there are no duplicate or conflicting `transform` declarations in the reduced-motion block

### Step 3: Documentation & Delivery

- [ ] Update the project memory with a brief note about the accessibility fix if not already captured
- [ ] Out-of-scope findings created as new tasks via `fn_task_create` tool

**Artifacts:**
- None (no doc files require updating for this change)

## Documentation Requirements

**Must Update:**
- None — this is a purely internal CSS change with no user-facing documentation or config

**Check If Affected:**
- None

## Completion Criteria

- [ ] All steps complete
- [ ] `custom.css` has the `@media (prefers-reduced-motion: reduce)` block with correct selectors
- [ ] No syntax errors in `custom.css`
- [ ] Documentation checked — no doc updates needed

## Git Commit Convention

Commits at step boundaries. All commits include the task ID:

- **Step completion:** `feat(FN-010): add prefers-reduced-motion support for .link-card and .brand-card`
- **Bug fixes:** `fix(FN-010): description`
- **Formatting/docs:** `chore(FN-010): description`

## Do NOT

- Remove, delete, or modify any existing CSS rules outside the added media query
- Change the existing `transform: translateY()` values or any other style property
- Nest the new media query inside any existing block
- Forget to include `.link-card.featured:hover` (its higher specificity would defeat the base rule)
- Modify worktree copies of `custom.css` — only the root-level `custom.css`
