# Universal Software Project Foundation Standard

Version: 1.0.0  
Status: Active  
Applies to: New and existing software projects

## 1. Purpose

This standard defines the minimum engineering foundation required before software development scales.

Its purpose is to prevent predictable failures such as:

- secrets or personal data committed to Git;
- unsupported frameworks;
- weak authentication or authorization;
- unreproducible databases;
- duplicated business rules;
- hardcoded production IDs;
- missing tests;
- unsafe deployments;
- missing rollback/recovery;
- stale documentation;
- AI agents operating from incorrect assumptions.

The standard is technology-neutral. Stack-specific standards may extend it but must not silently weaken its security, privacy, integrity, auditability, or release-safety requirements.

## 2. Normative language

**MUST / MUST NOT** — mandatory unless a documented exception is explicitly approved.  
**SHOULD / SHOULD NOT** — strongly recommended; deviation requires documented reasoning.  
**MAY** — optional depending on risk and context.  
**BLOCKING** — feature/release work must not continue until resolved or explicitly accepted by an authorized owner.

## 3. Core principles

1. Security and privacy are design requirements.
2. Every important concept has one canonical source of truth.
3. One business rule has one canonical implementation.
4. Production changes are reproducible, reviewable and recoverable.
5. Unknown business facts are flagged, not invented.
6. Least privilege applies to humans, services, CI and database roles.
7. Critical failures are observable.
8. AI-generated changes pass the same controls as human-generated changes.
9. Prefer the simplest architecture that safely meets requirements.
10. Project documentation is written in English by default.

## 4. Foundation Gate

Before substantial business feature development, verify:

### Repository
- `.gitignore` matches the stack.
- no credentials, private keys, production dumps, or real sensitive fixtures are committed;
- meaningful changes use Pull Requests;
- the production branch is protected;
- required status checks are configured.

### Technology
- runtime/framework versions are security-supported;
- lockfiles are committed;
- dependency responsibilities are understood;
- major architecture choices are documented.

### Security
- authentication strategy is explicit;
- authorization is explicit and server-side;
- data is classified;
- secrets have an approved storage mechanism;
- untrusted input is validated;
- audit requirements are identified.

### Data
- a canonical migration mechanism exists;
- database changes are version-controlled;
- synthetic/anonymized development fixtures are used;
- backup/restore expectations are defined for stateful systems.

### Quality
- typecheck/lint/build can be run reliably;
- important business rules have automated tests;
- CI runs the required checks before merge.

### Delivery
- deployment environments are separated as appropriate;
- production deployment ownership is clear;
- risky changes have rollback or forward-fix plans.

### Observability
- important failures can be detected and diagnosed;
- high-risk workflows expose run/request/correlation identifiers where useful.

### Kiro
- Global and Workspace Steering are installed and accurate;
- important work follows an appropriate Spec workflow;
- Kiro must inspect existing code before proposing architecture.

The Foundation Gate result is one of:

- `READY`
- `PARTIAL`
- `BLOCKED`

Any `BLOCKED` critical security/privacy/data-integrity issue prevents production-sensitive feature work.

## 5. Git and repository rules

- Secrets MUST NOT be committed.
- Real production personal/sensitive data MUST NOT be committed as fixtures or examples.
- Use synthetic test data.
- Protected primary branches SHOULD prevent force pushes/deletion.
- Significant changes MUST use Pull Requests.
- Required CI checks MUST pass before merge.
- High-risk security/database changes SHOULD receive explicit review.
- Source-control history is part of the security boundary; deleting a file in a later commit does not erase prior exposure.

## 6. Security and privacy

- Multi-user production applications MUST identify real actors.
- A shared password is not sufficient identity.
- Authentication is not authorization.
- Authorization MUST be enforced server-side and at the appropriate data layer.
- UI visibility is never an authorization mechanism.
- Least privilege MUST be used.
- Sensitive logs MUST avoid secrets/tokens and unnecessary personal data.
- Security-critical missing configuration MUST fail safely.
- Hardcoded fallback passwords/tokens are forbidden.
- High-risk systems SHOULD map relevant requirements to a verification baseline such as OWASP ASVS.

## 7. Secrets and environment configuration

- `.env.example` contains names and safe placeholders only.
- Real values live in the platform secret/environment system.
- Development, preview/staging and production secrets are separated.
- Browser-exposed environment values must be explicitly safe for public exposure.
- Secret rotation procedures SHOULD exist for production systems.

## 8. Architecture and maintainability

- One business rule = one implementation.
- Search for existing helpers/services before adding new ones.
- Keep UI/routes/controllers thin where practical.
- Put durable business logic in testable domain/services.
- Production numeric IDs MUST NOT be encoded as business logic.
- Changeable business configuration belongs in Master/configuration data.
- Avoid duplicate libraries and competing abstractions.
- Prefer a modular monolith until real requirements justify additional distributed complexity.
- Major durable decisions SHOULD be recorded through architecture documentation or ADRs.

## 9. Database and migrations

- One migration mechanism is canonical.
- Every production schema change MUST exist as version-controlled migration code.
- Undocumented manual production changes are not an acceptable normal workflow.
- Migration ordering must be deterministic.
- Risky migrations must be tested before production.
- Integrity constraints SHOULD be enforced at the database layer where practical.
- Dev/seed IDs are not assumed to match production IDs.
- Database/application types SHOULD be generated where supported.
- Seeds MUST be synthetic or anonymized.

## 10. Testing

Minimum expectations vary with project risk, but:

- deterministic business rules MUST have unit tests;
- important API/database/service boundaries MUST have integration tests;
- critical user journeys SHOULD have E2E coverage;
- important bugs MUST receive regression tests;
- authorization behavior SHOULD be tested;
- error/invalid cases MUST be included, not only happy paths;
- money, dates/timezones, permissions and state transitions are treated as high-risk domains when applicable.

## 11. CI/CD quality gates

CI SHOULD run as appropriate:

- reproducible dependency installation;
- typecheck;
- lint/format checks;
- unit tests;
- integration tests;
- production build;
- migration/schema validation;
- secret/dependency/security scans appropriate to the project.

Required checks MUST block merge if they fail.

## 12. Deployment and rollback

- Production data/secrets are separate from development.
- Staging/preview SHOULD exist when deployment failure has significant impact.
- Normal deployment procedures are documented.
- Risky changes require rollback or forward-fix planning.
- Critical engines may use explicit safety states / feature flags.
- Activation of critical business behavior MUST be explicit.

## 13. Backup and recovery

Stateful production systems MUST define backup expectations.

Know:

- where backups exist;
- retention;
- who can restore;
- what dependencies must be restored;
- how recovery is tested.

A backup that has never been successfully restored is not considered fully validated.

## 14. Observability

- Important technical failures MUST be logged.
- Sensitive values MUST NOT be logged unnecessarily.
- Failed jobs/calculations/migrations must be visible.
- Major incidents SHOULD trigger actionable alerts.
- Deployed versions should be traceable from incidents.
- Expected business validation errors should be distinguishable from unexpected technical exceptions.

## 15. Documentation

Minimum project documentation should include as appropriate:

- README;
- architecture overview;
- business/domain rules;
- ADRs for durable decisions;
- security/access model;
- operational runbooks;
- migration/deployment guidance;
- active Feature Specs.

Documentation MUST remain aligned with the actual code/repository.

## 16. Kiro governance

Kiro is an engineering contributor subject to the same standards.

- Global Steering provides universal standards.
- Workspace Steering provides project-specific facts.
- Steering stores durable truths, not sprint status.
- Important unfamiliar/high-risk work SHOULD use Feature Specs.
- Known business requirements default to Requirements -> Design -> Tasks -> Implementation.
- When a Spec exists, read/use it rather than duplicating it in every prompt.
- Kiro must not invent unresolved business rules.
- Kiro must not alter approved rules for technical convenience.
- Kiro must not run production migrations/backfills/activation without explicit authorization.
- Kiro must not bypass failing tests to make a change appear successful.

## 17. Definition of Ready

Before implementation:

- objective/users are understood;
- acceptance criteria are testable;
- sources of truth are identified;
- security/authorization impact is understood;
- data/migration impact is understood;
- unresolved decisions are listed;
- design is consistent with current architecture;
- test strategy exists;
- rollback/gating requirements are identified.

## 18. Definition of Done

A significant feature is done only when:

- acceptance criteria pass;
- security/data protections exist;
- no unjustified duplication/hardcoding was introduced;
- required tests/typecheck/lint/build pass;
- migrations are versioned/tested where required;
- rollback/forward-fix exists where needed;
- failures are observable;
- documentation/specs match implementation;
- no secret/real sensitive fixture was introduced;
- CI quality gates are green;
- production activation is explicit when applicable.

## 19. Exceptions

An exception requires:

- unmet rule;
- reason;
- risk;
- compensating control;
- owner;
- expiry/review date.

Known secret/sensitive-data exposure, deliberate authorization bypass, or known critical vulnerability must not be normalized through a routine exception.
