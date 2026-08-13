# Supabase RLS and Access Guidelines

## Principle

RLS is part of authorization, not a substitute for understanding application identity.

## Baseline

- Sensitive tables should not rely on broad anonymous grants.
- Use authenticated identity and/or server authorization consistent with the project architecture.
- Service-role/secret keys bypass RLS and must remain server-only.
- A service-role client is safe only behind a server boundary that has already authenticated/authorized the action.
- Do not assume `employee_id = auth.uid()` or any other identity mapping unless the real data model proves it.
- Policies should be explicit and testable.
- Prefer operation-specific policies when that improves clarity.
- Test cross-user/cross-role access denial, not only allowed reads.

## Review checklist

For each sensitive table:
- data classification;
- actor roles;
- SELECT rule;
- INSERT rule;
- UPDATE rule;
- DELETE rule;
- service/admin access;
- audit requirement;
- test coverage.
