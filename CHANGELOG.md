# Changelog

All notable changes to the Engineering Standards repository are documented here.

This project follows Semantic Versioning.

## [1.0.1] - 2026-08-13

### Fixed

- MANIFEST.json: corrected file_count (59 → 67) and added 10 missing entries
  (self-steering-validation workflow, generated runtime steering files,
  self-steering manifest, sync-self-steering scripts, VERSION).
- MANIFEST.json: file list sorted alphabetically for maintainability.

### Changed

- GitHub Actions upgraded via Dependabot:
  - `actions/checkout` v4 → v7 (security: blocks fork PR checkout for pull_request_target).
  - `actions/setup-node` v4 → v7 (ESM migration, new cache outputs).
  - `gitleaks/gitleaks-action` v2 → v3 (Node 24 runtime; required before Sept 2026 deprecation).

## [1.0.0] - 2026-08-13

### Added

- Universal Software Project Foundation Standard.
- Secure development baseline.
- Testing and CI baseline.
- Database and migration baseline.
- Documentation standard.
- AI/Kiro development standard.
- Kiro Global Steering package.
- Project Steering templates.
- Project Initiation and review prompts.
- GitHub Pull Request and reusable workflow templates.
- Supabase migration, RLS and seed guidelines.
- Vercel environment, deployment and rollback guidelines.
- Project Health, ADR, runbook, threat review and release-readiness templates.
- Bootstrap and Global Steering installation scripts.

### Safety principles

- No secrets in Git.
- No real sensitive production data in fixtures.
- No production numeric IDs as business rules.
- No significant feature without test strategy.
- No undocumented production database changes.
- No silent AI business assumptions.
- No production activation of critical engines without explicit readiness/approval.
