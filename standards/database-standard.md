# Database and Migration Standard

## Canonical source of truth

The version-controlled migration chain is the canonical definition of schema evolution.

## Rules

1. Every production schema change is represented in Git.
2. Manual production changes are emergency-only and immediately reconciled into migration history.
3. Migration ordering is deterministic.
4. Migration files are immutable after they have been applied to shared production-like environments unless the migration system explicitly supports safe correction semantics.
5. Destructive operations are identified and reviewed.
6. Data backfills are separated from schema changes when that reduces risk.
7. Backfills are idempotent/restartable when meaningful.
8. Stable business identifiers/relationships are preferred over hardcoded numeric IDs.
9. Seed IDs are not assumed to match production.
10. Referential and integrity constraints are enforced in the DB where practical.

## Environments

Maintain clear separation between:
- local/development;
- staging/preview;
- production.

## Fixtures

Fixtures and seeds use synthetic/anonymized values only.

## Verification

Before production:
- apply migrations to a clean environment;
- test forward migration;
- test important application flows;
- validate rollback/forward-fix strategy;
- reconcile expected vs actual schema.

## Types

When supported, generate database types automatically and use them in application code rather than manually duplicating schema definitions.
