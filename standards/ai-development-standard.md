# AI / Kiro Development Standard

## Principle

AI coding agents are subject to the same engineering controls as human contributors.

## Mandatory behavior

1. Inspect before modifying.
2. Read applicable Global/Workspace Steering.
3. Read active Specs and architecture documentation.
4. Search existing helpers/services before adding new ones.
5. Do not invent business rules.
6. Do not infer authoritative rules from unverified data.
7. Do not hardcode secrets or production-specific numeric IDs.
8. Do not bypass failing quality gates.
9. Do not claim deployment/configuration changes were applied unless verified.
10. Do not run production migration/backfill/activation without explicit authorization.
11. Update documentation when durable architecture/business behavior changes.
12. Report files changed, tests run, blockers and risks.

## Spec selection

Use a Requirements-First Feature Spec when:
- behavior/business requirements are important;
- the feature is complex;
- security/data impact is significant;
- multiple modules are affected;
- migration/rollback matters.

Use lighter planning only for small, low-risk, well-understood changes.

Use a Bugfix Spec for:
- unclear root cause;
- critical path;
- regression-prone behavior;
- data/security defects requiring durable documentation.

## Required review dimensions

Every important feature should cover:
- Security
- Authorization
- Data/source of truth
- Testing
- Migration
- Rollback
- Observability
- Performance
- Documentation

## Subagents

Subagents may inspect/code/test isolated tasks, but the main agent remains responsible for interpreting approved Specs and durable business rules.
