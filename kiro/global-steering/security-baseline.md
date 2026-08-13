---
inclusion: always
---

# Global Security and Privacy Baseline

- Never commit secrets, production credentials, private keys, or production dumps.
- Never use real sensitive/personal production data as public or repository fixtures.
- Use real identity for multi-user production systems.
- Authentication does not replace authorization.
- Authorization must be enforced server-side and at the data layer where appropriate.
- UI visibility is not authorization.
- Use least privilege.
- Security-critical missing configuration fails safely.
- Hardcoded fallback passwords/tokens are forbidden.
- Privileged service credentials never belong in browser code.
- Sensitive changes require auditable actor identity where the domain requires traceability.
- Do not log secrets, raw tokens, or unnecessary sensitive personal data.
- Explicitly flag security/privacy assumptions and blockers.
