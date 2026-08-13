# Scripts

## Install Kiro Global Steering

Windows PowerShell:

```powershell
.\scripts\install-kiro-global.ps1
```

macOS/Linux:

```bash
chmod +x scripts/*.sh
./scripts/install-kiro-global.sh
```

## Bootstrap a new project

Windows:

```powershell
.\scripts\bootstrap-project.ps1 -ProjectPath C:\path\to\project
```

macOS/Linux:

```bash
./scripts/bootstrap-project.sh /path/to/project
```

## Synchronize the generated project foundation file

Windows:

```powershell
.\scripts\sync-project-standard.ps1 -ProjectPath C:\path\to\project
```

macOS/Linux:

```bash
./scripts/sync-project-standard.sh /path/to/project
```

Project-specific Steering files are intentionally **not overwritten** by the sync script.

## Synchronize self-steering (this repository)

This repository is **self-consuming**: Kiro Web automatically loads steering from
`.kiro/steering/` at the workspace root. The generated runtime files in that
directory reference the canonical sources via `#[[file:]]` includes — no content
is duplicated.

### Architecture

| Layer | Location | Role |
|-------|----------|------|
| Canonical source of truth | `kiro/global-steering/*.md` | Author and review edits here |
| Authoritative manifest | `kiro/self-steering-manifest.txt` | Maps canonical files to runtime names |
| Generated runtime copies | `.kiro/steering/*.md` | Loaded by Kiro Web (never edit directly) |

### Commands

macOS/Linux:

```bash
./scripts/sync-self-steering.sh
```

Windows PowerShell:

```powershell
.\scripts\sync-self-steering.ps1
```

### When canonical files are added or removed

1. Create or delete the file under `kiro/global-steering/`.
2. Add or remove the corresponding line in `kiro/self-steering-manifest.txt`.
3. Run the synchronization script.

The script generates new runtime files for added entries and **safely removes
obsolete generated files** for removed entries.

### What may be deleted

Only files in `.kiro/steering/` that contain the marker `GENERATED RUNTIME COPY`
are eligible for automatic removal. The script detects this marker before deleting.

### What is never deleted

Manually maintained or project-specific steering files in `.kiro/steering/` that
do **not** contain the generated marker are never touched by the synchronization
script — regardless of their filename.
