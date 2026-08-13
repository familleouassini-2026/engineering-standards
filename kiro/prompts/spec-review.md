# Kiro Feature Spec Quality Review Prompt

Review the active Feature Spec before implementation.

Do not implement.

Check requirements for:
- contradictions;
- ambiguity;
- missing business decisions;
- duplicated requirements;
- assumptions from unreliable data;
- testable acceptance criteria;
- source-of-truth clarity;
- security/authorization;
- migration/data impact;
- rollback/gating;
- observability;
- performance;
- legacy/coexistence impact.

Check design for:
- faithful implementation of requirements;
- no business-rule reinvention;
- no duplicated sources of truth;
- determinism/idempotence where applicable;
- database constraints;
- transaction boundaries;
- safe failure behavior;
- test architecture;
- proportional complexity.

Check tasks for:
- safe ordering;
- dependencies;
- blocked production actions;
- tests/docs included;
- migration/rollback included.

Return only:
- issues found;
- corrections made;
- unresolved business decisions;
- remaining technical risks;
- SPEC GATE = READY / PARTIAL / BLOCKED.
