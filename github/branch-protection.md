# Recommended GitHub Branch Protection

For production repositories, protect `main`.

Recommended baseline:

- require a Pull Request before merging;
- require required status checks;
- require branch to be up to date when appropriate;
- block force pushes;
- block branch deletion;
- dismiss stale approvals after significant changes where review policy requires it;
- require conversation resolution for review-heavy repositories;
- restrict direct pushes for higher-risk teams/projects.

High-risk projects should consider:
- required approvals;
- CODEOWNERS;
- signed commits/tags where organizational policy requires them;
- deployment environment approvals.

Do not claim these settings are active until verified in GitHub repository rules/settings.
