<#
.SYNOPSIS
    Regenerates .kiro/steering/ from the canonical manifest.

.DESCRIPTION
    Uses #[[file:]] references — no content duplication.

    Phases:
      1. Parse and validate the entire manifest (no mutations).
      2. Generate runtime steering files (only after Phase 1 succeeds).
      3. Cleanup obsolete generated files (only after Phase 2 succeeds).

    The script fails closed: any validation error aborts before any file
    is generated, overwritten, or deleted.

    Cleanup dual condition — only deletes files that BOTH:
      a) match the generated naming pattern (two-digit prefix + slug + .md); AND
      b) contain the exact generated ownership marker.

    Output encoding: UTF-8 without BOM, LF line endings, exactly one final newline.
    This ensures byte-equivalence with the shell implementation.
#>
[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$GeneratedMarker = 'GENERATED RUNTIME COPY'
$GeneratedPattern = '^[0-9]{2}-[a-z][-a-z0-9]*\.md$'

# Resolve repository root (scripts/ is one level below root)
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$Root = Split-Path -Parent $ScriptDir
$KiroDir = Join-Path $Root 'kiro'
$Manifest = Join-Path $KiroDir 'self-steering-manifest.txt'
$RuntimeKiroDir = Join-Path $Root '.kiro'
$Target = Join-Path $RuntimeKiroDir 'steering'

# UTF-8 without BOM encoder
$Utf8NoBom = New-Object System.Text.UTF8Encoding($false)

# ============================================================
# PHASE 1 — Parse and validate (no mutations)
# ============================================================

if (-not (Test-Path $Manifest)) {
    Write-Error "Manifest not found: $Manifest"
    exit 1
}

$errors = 0
$entries = @()
$allPrefixes = @()
$allDestNames = @()

foreach ($line in Get-Content $Manifest) {
    # Skip comments and blank lines
    if ($line -match '^\s*#' -or $line -match '^\s*$') { continue }

    # Parse: <prefix> <path> <title...>
    $parts = $line -split '\s+', 3
    if ($parts.Count -lt 3 -or [string]::IsNullOrWhiteSpace($parts[0]) -or
        [string]::IsNullOrWhiteSpace($parts[1]) -or [string]::IsNullOrWhiteSpace($parts[2])) {
        Write-Host "ERROR: Malformed manifest line: $line" -ForegroundColor Red
        $errors++
        continue
    }

    $prefix = $parts[0]
    $sourcePath = $parts[1]
    $title = $parts[2]

    # Validate prefix is two digits
    if ($prefix -notmatch '^[0-9]{2}$') {
        Write-Host "ERROR: Prefix must be exactly two digits, got: $prefix" -ForegroundColor Red
        $errors++
        continue
    }

    # Derive destination name
    $slug = [System.IO.Path]::GetFileNameWithoutExtension($sourcePath)
    $destName = "${prefix}-${slug}.md"

    # Validate destination matches generated pattern
    if ($destName -notmatch $GeneratedPattern) {
        Write-Host "ERROR: Generated name does not match pattern: $destName" -ForegroundColor Red
        $errors++
        continue
    }

    # Validate canonical source exists
    $fullSourcePath = Join-Path $Root $sourcePath
    if (-not (Test-Path $fullSourcePath)) {
        Write-Host "ERROR: Canonical source does not exist: $sourcePath" -ForegroundColor Red
        $errors++
        continue
    }

    # Validate no duplicate prefix
    if ($allPrefixes -contains $prefix) {
        Write-Host "ERROR: Duplicate prefix '${prefix}' for: $sourcePath" -ForegroundColor Red
        $errors++
        continue
    }

    # Validate no duplicate destination name
    if ($allDestNames -contains $destName) {
        Write-Host "ERROR: Duplicate destination name: $destName" -ForegroundColor Red
        $errors++
        continue
    }

    $allPrefixes += $prefix
    $allDestNames += $destName

    # Collect entry for Phase 2
    $entries += [PSCustomObject]@{
        Prefix     = $prefix
        SourcePath = $sourcePath
        Title      = $title
        DestName   = $destName
    }
}

# Validate at least one entry
if ($entries.Count -eq 0) {
    Write-Host "ERROR: Manifest contains no entries." -ForegroundColor Red
    $errors++
}

# --- FAIL CLOSED ---
if ($errors -gt 0) {
    Write-Error "FAILED: $errors validation error(s). No files generated, overwritten, or deleted."
    exit 1
}

Write-Host "Phase 1: Manifest validated ($($entries.Count) entries, 0 errors)."

# ============================================================
# PHASE 2 — Generate runtime steering files
# ============================================================

if (-not (Test-Path $Target)) {
    New-Item -ItemType Directory -Path $Target -Force | Out-Null
}

foreach ($entry in $entries) {
    $destFile = Join-Path $Target $entry.DestName

    # Build content with LF line endings
    $lines = @(
        '---'
        'inclusion: always'
        '---'
        ''
        "<!-- ${GeneratedMarker} — DO NOT EDIT INDEPENDENTLY"
        "     Canonical source: $($entry.SourcePath)"
        '     Regenerate with: scripts/sync-self-steering.sh or .ps1'
        '     Any edits here will be overwritten on next sync. -->'
        ''
        "# $($entry.Title) (Active Steering)"
        ''
        "This file activates the $($entry.Title) rules for Kiro Web."
        ''
        "#[[file:$($entry.SourcePath)]]"
        ''
    )

    $content = ($lines -join "`n")

    # Write UTF-8 without BOM, LF line endings, using .NET directly
    [System.IO.File]::WriteAllText($destFile, $content, $Utf8NoBom)
}

Write-Host "Phase 2: Generated $($entries.Count) runtime steering files."

# ============================================================
# PHASE 3 — Cleanup obsolete generated files
# ============================================================

$cleaned = 0

foreach ($existing in Get-ChildItem -Path $Target -Filter '*.md' -File) {
    # Dual condition A: must match generated naming pattern
    if ($existing.Name -notmatch $GeneratedPattern) { continue }

    # Check if this file is in the expected set
    if ($allDestNames -contains $existing.Name) { continue }

    # Dual condition B: must contain the generated ownership marker
    $fileContent = Get-Content $existing.FullName -Raw -ErrorAction SilentlyContinue
    if ($fileContent -and $fileContent.Contains($GeneratedMarker)) {
        Write-Host "Removing obsolete generated file: $($existing.Name)"
        Remove-Item $existing.FullName -Force
        $cleaned++
    }
}

Write-Host "Phase 3: Cleanup complete ($cleaned obsolete file(s) removed)."
Write-Host ""
Write-Host "Self-steering synchronized: $Target/"
Get-ChildItem -Path $Target -Filter '*.md' -File | ForEach-Object { Write-Host $_.Name }
