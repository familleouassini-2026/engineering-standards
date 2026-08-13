# Supabase Local Development Baseline

A Supabase project should be reproducible from version-controlled configuration and migrations.

Recommended:
- Supabase CLI configuration in the project;
- migrations in `supabase/migrations/`;
- synthetic seed data for development where useful;
- generated application DB types;
- repeatable local reset/start commands documented in README.

Do not rely on undocumented production-only schema state.

Before a major feature relying on database changes, confirm:
- local schema;
- staging schema;
- production schema;
- migration history assumptions.
