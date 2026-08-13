## Summary

What changed and why?

## Scope

- [ ] Small/low-risk
- [ ] Business logic
- [ ] Database/migration
- [ ] Authentication/authorization
- [ ] Security/privacy
- [ ] Infrastructure/deployment
- [ ] Documentation only

## Source of truth

What authoritative rule/data/design does this implementation follow?

## Tests

List tests executed and results.

- [ ] Typecheck
- [ ] Lint
- [ ] Unit tests
- [ ] Integration tests
- [ ] Build
- [ ] Relevant E2E
- [ ] Security/data checks where applicable

## Data / migration impact

Describe migrations, backfill, compatibility and production data assumptions.

## Security / authorization impact

Describe access-control or sensitive-data changes.

## Rollback / forward-fix

How do we recover if this change fails?

## Observability

How will important failures be detected?

## Documentation

What Steering / Spec / architecture / runbook documentation changed?

## Checklist

- [ ] No secret/credential added
- [ ] No real sensitive fixture added
- [ ] No production numeric ID hardcoded as business logic
- [ ] Existing helper/service searched before adding duplicate logic
- [ ] Required tests added/updated
- [ ] Docs reflect actual behavior
- [ ] Production activation/backfill is explicit if applicable
