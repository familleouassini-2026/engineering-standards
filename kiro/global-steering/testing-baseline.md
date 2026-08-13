---
inclusion: always
---

# Global Testing Baseline

- Deterministic business logic must be testable outside UI components.
- Important behavior changes require automated tests.
- Important bugs require regression tests.
- Cover invalid/error/unauthorized paths, not only happy paths.
- Money, rounding, dates, timezone boundaries, permissions, and state transitions are high-risk when present.
- CI quality gates are authoritative; do not bypass them.
- Tests must use synthetic/anonymized data.
- Do not duplicate the implementation formula inside a test in a way that makes the test self-confirming.
