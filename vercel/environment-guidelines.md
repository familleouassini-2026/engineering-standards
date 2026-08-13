# Vercel Environment Guidelines

## Separation

Use Vercel environment scopes intentionally:
- Development
- Preview
- Production

Do not automatically reuse production secrets in Preview.

## Rules

- Environment variable names are documented in `.env.example`.
- Values are stored in Vercel/project secret configuration, not Git.
- Browser-exposed variables contain only values explicitly safe to expose.
- Missing security-critical values fail safely.
- Production-only integrations use production-scoped credentials.
- Preview environments should use non-production backends/data where practical.

## Change management

High-impact environment changes should be:
- reviewed;
- documented;
- validated in non-production when practical;
- reversible.
