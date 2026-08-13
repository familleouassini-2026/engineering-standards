param(
    [string]$SourceRoot = (Resolve-Path "$PSScriptRoot\..").Path
)

$target = Join-Path $HOME ".kiro\steering"
New-Item -ItemType Directory -Force -Path $target | Out-Null

$source = Join-Path $SourceRoot "kiro\global-steering"
Copy-Item "$source\*.md" $target -Force

Write-Host "Installed Kiro Global Steering to: $target"
Write-Host "Restart/reload Kiro if required for your environment."
