#!/usr/bin/env bash
set -euo pipefail

# Regenerates .kiro/steering/ from canonical kiro/global-steering/ sources.
# This makes the engineering-standards repository self-consuming for Kiro Web
# without duplicating content (uses #[[file:]] references).
#
# Run from repository root or provide the repo root as argument.

ROOT="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
TARGET="${ROOT}/.kiro/steering"

mkdir -p "${TARGET}"

HEADER='<!-- ⚠️ GENERATED RUNTIME COPY — DO NOT EDIT INDEPENDENTLY
     Canonical source: kiro/global-steering/FILENAME
     Regenerate with: scripts/sync-self-steering.sh
     Any edits here will be overwritten on next sync. -->'

generate_steering() {
  local num="$1"
  local slug="$2"
  local title="$3"
  local source="kiro/global-steering/${slug}.md"
  local dest="${TARGET}/${num}-${slug}.md"
  local header
  header=$(echo "${HEADER}" | sed "s|FILENAME|${slug}.md|g")

  cat > "${dest}" <<EOF
---
inclusion: always
---

${header}

# ${title} (Active Steering)

This file activates the ${title,,} for Kiro Web.

#[[file:${source}]]
EOF
}

generate_steering "00" "engineering-foundation" "Engineering Foundation"
generate_steering "01" "security-baseline" "Security Baseline"
generate_steering "02" "testing-baseline" "Testing Baseline"
generate_steering "03" "documentation-language" "Documentation Language"
generate_steering "04" "ai-execution-rules" "AI Execution Rules"

echo "Self-steering synchronized: ${TARGET}/"
ls -1 "${TARGET}/"
