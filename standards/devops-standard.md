# DevOps and Delivery Standard

## Repository workflow

- Primary branch protected.
- Meaningful changes through Pull Requests.
- Required checks before merge.
- No force-push on protected production branch except controlled emergency procedure.

## CI

At minimum, run applicable:
- dependency install from lockfile;
- typecheck/compile;
- lint;
- tests;
- production build;
- migration/schema checks;
- security/dependency checks.

## Environments

- development;
- preview/staging as risk requires;
- production.

Environment secrets are isolated.

## Deployment

Document:
- who/what deploys;
- source branch/tag;
- environment;
- migration ordering;
- smoke validation;
- rollback/forward-fix.

## Rollback

A rollback plan must not depend on undocumented tribal knowledge.

For database changes, rollback may be a forward-fix when reverse migrations would destroy data.

## Recovery

Stateful systems define:
- backups;
- retention;
- restoration owner;
- restore testing;
- RPO/RTO when business criticality requires it.

## Observability

Production should expose:
- application errors;
- failed jobs;
- critical business-engine failures;
- deployment version;
- alerting for important incidents.
