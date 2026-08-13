# Database Migration Standards

Status: TEMPLATE

## Canonical migration mechanism

Define the project migration tool/path.

## Rules

- production schema changes exist in Git;
- no undocumented manual production changes;
- seed IDs are not production identities;
- synthetic development seeds only;
- risky migrations tested in non-production;
- destructive operations explicitly reviewed;
- backfills designed for restart/idempotence where needed.

## Environment reconciliation

Document how repository, staging and production schema state are verified.

## Generated types

Document how database types are generated and updated.
