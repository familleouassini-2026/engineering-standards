# Vercel Deployment Guidelines

## Expected flow

Pull Request -> Preview deployment -> automated checks -> review -> merge -> Production deployment.

## Before production

Verify:
- required CI checks pass;
- migrations are understood and ordered;
- environment variables exist;
- sensitive config is production-scoped;
- rollback/forward-fix is known;
- important monitoring/logging is available.

## Preview

Use Preview deployments for:
- UI review;
- integration validation;
- smoke tests;
- migration-compatible application testing against a safe backend.

Do not use real production personal data simply because the Vercel Preview URL is private/unguessable.
