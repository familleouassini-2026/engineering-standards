# GitHub Reusable Workflow Guidance

This repository may host reusable workflows for projects owned by the same team.

## Version pinning

Projects should call a versioned tag/branch, for example:

```yaml
jobs:
  quality:
    uses: familleouassini-2026/engineering-standards/.github/workflows/node-quality-reusable.yml@v1
```

Do not reference a moving development branch for production merge gates.

## Important

Reusable workflows are implementation helpers, not the source of project business rules.

Each project still owns:
- its own package/build scripts;
- its own tests;
- its own database migrations;
- its own environment values;
- its own deployment configuration.

Private-repository workflow sharing may require GitHub Actions access configuration.
