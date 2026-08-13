param(
    [Parameter(Mandatory=$true)]
    [string]$ProjectPath,

    [string]$StandardsVersion = "1.0.0"
)

$root = (Resolve-Path "$PSScriptRoot\..").Path
New-Item -ItemType Directory -Force -Path $ProjectPath | Out-Null

$dirs = @(
    ".kiro\steering",
    ".kiro\specs",
    "docs\architecture",
    "docs\business",
    "docs\adr",
    "docs\runbooks",
    "tests",
    ".github"
)

foreach ($d in $dirs) {
    New-Item -ItemType Directory -Force -Path (Join-Path $ProjectPath $d) | Out-Null
}

Copy-Item (Join-Path $root "kiro\global-steering\engineering-foundation.md") (Join-Path $ProjectPath ".kiro\steering\00-engineering-foundation.md") -Force
Copy-Item (Join-Path $root "kiro\project-steering\*.md") (Join-Path $ProjectPath ".kiro\steering\") -Force
Copy-Item (Join-Path $root "templates\README.template.md") (Join-Path $ProjectPath "README.md") -Force
Copy-Item (Join-Path $root "templates\.env.example") (Join-Path $ProjectPath ".env.example") -Force
Copy-Item (Join-Path $root "templates\project-health-template.md") (Join-Path $ProjectPath "project-health.md") -Force
Copy-Item (Join-Path $root "templates\engineering-standard-adoption.md") (Join-Path $ProjectPath "docs\engineering-standard.md") -Force
Copy-Item (Join-Path $root "templates\pull_request_template.md") (Join-Path $ProjectPath ".github\pull_request_template.md") -Force

Write-Host "Project foundation bootstrapped at: $ProjectPath"
Write-Host "Next: complete project Steering and run kiro/prompts/project-init.md"
