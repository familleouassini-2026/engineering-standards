# Kiro Release Readiness Review Prompt

Review a release candidate before production.

Verify:
- acceptance criteria;
- required tests;
- CI status;
- migrations;
- data/backfill plan;
- security/authorization;
- environment variables/secrets;
- monitoring/logging;
- deployment order;
- rollback/forward-fix;
- backup/restore dependency;
- feature flags/safety mode;
- documentation/runbooks;
- known risks/exceptions.

For database/critical engine changes, verify:
- migration is version-controlled;
- non-production validation exists;
- idempotence/restart behavior where needed;
- production activation is explicit.

Return:
RELEASE GATE = READY / PARTIAL / BLOCKED

and:
- blocking issues;
- accepted risks;
- exact deployment checklist;
- exact rollback/forward-fix checklist;
- post-deploy validation.
