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
