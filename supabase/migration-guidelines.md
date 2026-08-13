# Supabase Migration Guidelines

## Canonical model

For projects using Supabase CLI, keep project schema evolution in:

```text
supabase/migrations/
```

Commit migration files.

## Rules

- Do not use `schema.sql`, ad-hoc SQL snippets and migrations as competing authoritative setup paths.
- Avoid manual production SQL changes.
- If an emergency manual change occurs, reconcile it immediately into version-controlled migration history.
- Verify production schema state before assuming migration files exactly represent historical production.
- Do not hardcode seed numeric IDs into application business logic.
- Test risky migrations on a non-production database.
- Separate large/long data backfills from schema migrations where appropriate.
- Make backfills restartable/idempotent when practical.

## Workflow

Typical safe workflow:

1. create migration;
2. apply locally;
3. run DB/integration tests;
4. validate on staging;
5. review generated/changed SQL;
6. deploy migration;
7. run post-migration validation;
8. monitor.

## Generated database types

Where the project uses TypeScript, generate Supabase database types and make the application client consume them.

Do not manually duplicate the full database schema in application metadata unless there is a clear, justified reason.
