# Testing and Quality Standard

## Principle

Tests are executable evidence of intended behavior.

## Required layers

### Unit tests
Use for:
- deterministic business rules;
- money/rounding;
- dates/timezones;
- validation;
- permissions decisions;
- state transitions.

### Integration tests
Use for:
- database constraints;
- API/service orchestration;
- authentication;
- authorization;
- migrations;
- external-service adapters where important.

### End-to-End tests
Use selectively for critical journeys:
- sign in;
- approval;
- payroll/financial workflow;
- critical administration;
- irreversible user actions.

### Regression tests
Important bugs must receive a test that reproduces the defect before the fix and passes after the fix.

## Rules

- Tests are deterministic.
- Tests do not use real production personal data.
- Error/invalid/unauthorized behavior is tested.
- Important boundary conditions are tested.
- Business rules are not duplicated in test helpers in a way that makes the test prove itself.
- CI is authoritative for merge readiness.

## Recommended project scripts

Projects should expose simple commands such as:

```text
test
test:unit
test:integration
typecheck
lint
build
```

Exact names may vary by stack, but the capabilities should be discoverable from README/package/build files.
