# Kiro Architecture Consistency Review Prompt

Review the current project as a professional maintainable system.

Read:
- Global and Workspace Steering;
- active Specs;
- architecture docs;
- repository structure;
- dependencies;
- data/migrations;
- tests/CI;
- deployment configuration.

Do not implement changes yet.

Assess:
- source-of-truth clarity;
- module boundaries;
- business-rule duplication;
- hardcoded production/environment IDs;
- UI/API/report formula duplication;
- god files / excessive page/controller logic;
- data-fetch patterns;
- typing;
- dependency duplication;
- database constraints;
- migration reproducibility;
- security boundaries;
- testability;
- performance proportionality;
- documentation drift;
- over-engineering.

Classify each finding:
- Critical / High / Medium / Low
- Immediate / Short term / Progressive
- Security / Data / DevOps / Architecture / Kiro

Return:
- top risks;
- evidence;
- recommended target state;
- phased remediation order;
- items that should become Steering invariants;
- items that should become Feature Specs.

Do not modify business rules based on current data unless validated.
