param(
    [Parameter(Mandatory=$true)]
    [string]$ProjectPath
)

$root = (Resolve-Path "$PSScriptRoot\..").Path
$target = Join-Path $ProjectPath ".kiro\steering\00-engineering-foundation.md"

if (!(Test-Path (Split-Path $target))) {
    throw "Project .kiro/steering directory does not exist. Run bootstrap first."
}

Copy-Item (Join-Path $root "kiro\global-steering\engineering-foundation.md") $target -Force
Write-Host "Synchronized project foundation steering: $target"
Write-Host "Review docs/engineering-standard.md and update adopted version/date."
