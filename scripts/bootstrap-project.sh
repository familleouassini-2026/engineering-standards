#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <project-path>"
  exit 1
fi

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT="$1"

mkdir -p \
  "${PROJECT}/.kiro/steering" \
  "${PROJECT}/.kiro/specs" \
  "${PROJECT}/docs/architecture" \
  "${PROJECT}/docs/business" \
  "${PROJECT}/docs/adr" \
  "${PROJECT}/docs/runbooks" \
  "${PROJECT}/tests" \
  "${PROJECT}/.github"

cp "${ROOT}/kiro/global-steering/engineering-foundation.md" "${PROJECT}/.kiro/steering/00-engineering-foundation.md"
cp "${ROOT}"/kiro/project-steering/*.md "${PROJECT}/.kiro/steering/"
cp "${ROOT}/templates/README.template.md" "${PROJECT}/README.md"
cp "${ROOT}/templates/.env.example" "${PROJECT}/.env.example"
cp "${ROOT}/templates/project-health-template.md" "${PROJECT}/project-health.md"
cp "${ROOT}/templates/engineering-standard-adoption.md" "${PROJECT}/docs/engineering-standard.md"
cp "${ROOT}/templates/pull_request_template.md" "${PROJECT}/.github/pull_request_template.md"

echo "Project foundation bootstrapped at ${PROJECT}"
echo "Next: complete project Steering and run kiro/prompts/project-init.md"
