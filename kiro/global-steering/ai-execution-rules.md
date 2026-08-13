---
inclusion: always
---

# AI Engineering Execution Rules

Before non-trivial changes:

1. Inspect the current repository.
2. Read relevant Workspace Steering.
3. Read the active Spec if one exists.
4. Inspect neighboring code/tests/migrations before inventing a new pattern.
5. Identify source of truth, security/data impact, migration impact, tests and rollback needs.
6. Flag unresolved business decisions rather than guessing.

During implementation:

- avoid duplicate logic;
- avoid production-ID hardcoding;
- prefer existing project abstractions;
- keep changes scoped and coherent;
- preserve backward compatibility when required by the approved plan;
- do not weaken security controls to make tests pass.

Production safety:

- no production migration/backfill/activation without explicit authorization;
- no automatic destructive data correction based on unverified records;
- no silent fallback that mixes authoritative business sources unless explicitly designed/approved;
- fail visibly when safe calculation cannot be guaranteed.

After work:

- run the required checks;
- update relevant docs/spec/tasks;
- report completed work, files changed, tests, failures, blockers and residual risks.
