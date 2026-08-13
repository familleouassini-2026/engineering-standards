# Technology Steering

Status: TEMPLATE — complete from the actual project.

## Supported stack

- Runtime:
- Framework:
- Language:
- Package manager:
- Database:
- Authentication:
- Storage:
- Testing:
- CI:
- Deployment:
- Monitoring/error tracking:

## Version policy

Production runtimes/frameworks must remain on security-supported versions.

## Dependency principles

- use the lockfile;
- avoid duplicate libraries;
- document major libraries and responsibility;
- review vulnerabilities;
- do not add infrastructure without demonstrated need.

## Environments

- local/development:
- preview/staging:
- production:

## Secrets

Define the approved secret-management locations.
No real secrets belong in the repository.
