# Structure Steering

Status: TEMPLATE — update to match the actual repository.

## Repository map

Document the current high-level folder structure.

## Module boundaries

List business/domain modules and responsibilities.

## Shared code

Define where shared:
- auth;
- database;
- validation;
- logging;
- configuration;
- dates;
- UI components

belong.

## Business logic rule

Business rules should be implemented in canonical testable modules/services rather than independently in UI, reports, APIs and jobs.

## Source-of-truth rule

For each major concept, document its canonical source.
Do not create competing editable sources of truth.

## Naming / organization conventions

Document only conventions actually followed by the repository.
