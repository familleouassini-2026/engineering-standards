# Security and Privacy Standard

## Objectives

Projects must prevent unauthorized access, accidental data exposure, secret leakage, and untraceable privileged changes.

## Mandatory baseline

### Identity
- Production multi-user systems MUST use real actor identity.
- Shared passwords are not accepted as user identity.
- Service identities must be separate from human identities where applicable.

### Authorization
- Authorization is enforced server-side.
- Sensitive data should also be protected at the database/data layer when supported.
- UI hiding is not authorization.
- Default access is deny/least privilege.

### Data classification

Classify application data at least conceptually:

- PUBLIC
- INTERNAL
- CONFIDENTIAL
- HIGHLY SENSITIVE

The classification determines access, logging, fixture, retention and export rules.

### Secrets
- Never commit secrets.
- Never add insecure fallback credentials.
- Separate environment secrets.
- Rotate credentials after suspected exposure.

### Sensitive data in development
- Do not copy production personal data into test/dev repositories.
- Prefer synthetic fixtures.
- If anonymized data is required, use a documented irreversible anonymization process appropriate to the domain.

### API boundaries
- Authenticate where identity is required.
- Authorize every sensitive action.
- Validate untrusted input.
- Rate-limit or otherwise protect abuse-sensitive endpoints where risk justifies it.
- Do not expose privileged service credentials to browsers.

### Audit
For sensitive mutations, preserve reliable actor identity and enough context to answer:

- who;
- what;
- when;
- before;
- after;
- why/source.

### Logging
Do not log:
- passwords;
- raw access/refresh tokens;
- private keys;
- unnecessary personal/sensitive payloads.

### Security review triggers
Require explicit review for:
- authentication/authorization;
- payroll/finance/payment;
- health/sensitive personal data;
- admin/impersonation;
- public file upload/download;
- cryptography/secrets;
- privileged database functions;
- cross-tenant access.

## Verification

Use automated and manual controls appropriate to risk:
- dependency scanning;
- secret scanning;
- SAST/linting;
- authorization tests;
- RLS/data-access tests;
- threat review;
- penetration/security testing for high-risk systems.
