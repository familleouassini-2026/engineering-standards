# Project Testing Standards

Status: TEMPLATE

## Test stack

- Unit:
- Integration:
- E2E:
- Fixtures:
- CI:

## Required coverage by domain

List critical calculations/workflows.

## Rules

- synthetic test data only;
- business rules tested outside UI;
- important defects receive regression tests;
- authorization tests included for sensitive actions;
- date/money/timezone edge cases included where relevant.

## Merge gate

Required checks:
- typecheck:
- lint:
- unit:
- integration:
- build:
- security checks:
