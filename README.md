# Engineering Standards

**Canonical engineering foundation for Kiro-assisted software projects.**

This repository defines the reusable engineering, DevSecOps, security, data, documentation, and Kiro governance standards that should be applied to new projects before substantial feature development begins.

## Purpose

The goal is to make healthy engineering foundations the default instead of repairing them later.

Projects adopting this standard should start with:

- safe Git and repository practices;
- no secrets or real sensitive fixtures in source control;
- supported runtimes/frameworks;
- explicit authentication and authorization;
- reproducible database migrations;
- automated tests and CI quality gates;
- deployment and rollback planning;
- observability and recovery;
- accurate Kiro Steering;
- Feature Specs for significant work;
- a clear Definition of Ready and Definition of Done.

## Operating model

This repository is the **canonical source** for universal engineering rules.

Each project should keep a **version-pinned local copy** of the required Kiro foundation steering so that the project remains self-contained and reproducible.

```text
engineering-standards
        |
        +--> Kiro Global Steering (~/.kiro/steering/)
        |
        +--> project-local generated steering
        |    (.kiro/steering/00-engineering-foundation.md)
        |
        +--> project-specific Steering / Specs
        |
        +--> GitHub CI / templates
        |
        +--> Supabase / Vercel project-specific implementation
```

Do **not** make application runtime behavior depend on live network access to this repository.

## Standard version

See [`VERSION`](VERSION) and [`CHANGELOG.md`](CHANGELOG.md).

A project adopting this repository should record its adopted version in:

```text
docs/engineering-standard.md
```

Example:

```md
# Engineering Standard Adoption

Standard: Engineering Standards
Version: 1.0.0
Adopted: 2026-08-13
Source: familleouassini-2026/engineering-standards
```

## Repository map

```text
standards/                 Human-readable engineering standards
kiro/global-steering/      Global Kiro rules
kiro/project-steering/     Project-specific steering templates
kiro/prompts/              Reusable Kiro prompts
templates/                 Project governance templates
.github/                   Reusable GitHub workflows and PR templates
supabase/                  Supabase-specific engineering guidelines
vercel/                    Vercel-specific engineering guidelines
scripts/                   Bootstrap and synchronization helpers
```

## New project workflow

1. Create the repository.
2. Install Global Kiro Steering from `kiro/global-steering/`.
3. Copy/bootstrap the project templates.
4. Complete project-specific `product.md`, `tech.md`, `structure.md`.
5. Run the Project Initiation prompt.
6. Obtain `FOUNDATION GATE = READY` before substantial feature implementation.
7. Build important features with Requirements -> Design -> Tasks -> Implementation.
8. Require CI checks on every meaningful Pull Request.

## Documentation language

All internal project and engineering documentation is written in **English** by default.

User-facing product content may use the language required by the product.

## Security note

This repository must never contain:

- real production secrets;
- private keys;
- production database dumps;
- real personal employee/customer/patient data;
- reusable production credentials.

Only synthetic examples are allowed.

## Updating the standard

Use semantic versioning:

- PATCH: clarification with no material behavior change;
- MINOR: new compatible standard or template;
- MAJOR: incompatible governance or workflow change.

Every release should update `CHANGELOG.md`.

## References

The standard is informed by:

- NIST Secure Software Development Framework (SSDF)
- OWASP ASVS
- OWASP SAMM
- GitHub protected branches / required status checks
- Kiro Steering and Feature Specs
- Supabase security / migration practices
- Vercel environment and deployment practices

See `standards/software-project-foundation.md` for the complete baseline.
