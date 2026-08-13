# Kiro Security and Privacy Review Prompt

Perform a security/privacy review before implementation or release.

Inspect:
- authentication;
- authorization;
- API routes/server actions;
- privileged credentials;
- RLS/data-layer policies;
- secret handling;
- environment variables;
- logging;
- sensitive fixtures/data in Git;
- file storage/access;
- audit trail;
- admin operations;
- dependency vulnerabilities;
- CI security checks.

Do not assume UI protection is authorization.

Identify:
- Critical / High / Medium / Low;
- evidence;
- exploit/impact in plain language;
- remediation;
- required tests;
- whether release is blocked.

Explicitly search for:
- shared/fallback passwords;
- exposed service-role/admin credentials;
- broad anonymous grants;
- disabled RLS on sensitive tables;
- real personal data in fixtures;
- production DB dumps;
- numeric-ID-based authorization/business rules;
- client-side-only authorization;
- sensitive logs.

Return a RELEASE SECURITY GATE:
READY / PARTIAL / BLOCKED.
