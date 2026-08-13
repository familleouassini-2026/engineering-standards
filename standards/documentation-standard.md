# Documentation Standard

## Language

All internal engineering/project documentation is written in English by default.

This includes:
- README;
- Kiro Steering;
- Feature Specs;
- requirements/design/tasks;
- architecture;
- ADRs;
- business/domain docs;
- security docs;
- runbooks;
- migration docs;
- test plans;
- audit reports;
- technical implementation plans.

User-facing product content may use the required product language.

## Principles

- Documentation reflects the current system.
- Durable facts go in Steering/architecture/domain docs.
- Volatile sprint status does not belong in always-on Steering.
- One document/source is clearly authoritative for each concept.
- Old docs are marked `LEGACY`, `SUPERSEDED`, or removed.
- Avoid copying the same rules into multiple places.

## Minimum README

A project README should answer:
- What is the project?
- How do I run it?
- What are prerequisites?
- Which environment variables exist?
- How do I test?
- How do I build?
- How do migrations work?
- How is deployment performed?
- Where are architecture/business rules/specs?

## ADRs

Use ADRs for durable, significant technical choices with alternatives/tradeoffs.

## Runbooks

Production projects document procedures for:
- deployment;
- rollback/forward-fix;
- restoration;
- key rotation where relevant;
- incident/admin workflows where relevant.
