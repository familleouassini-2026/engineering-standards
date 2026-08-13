#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <project-path>"
  exit 1
fi

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT="$1"
TARGET="${PROJECT}/.kiro/steering/00-engineering-foundation.md"

if [[ ! -d "${PROJECT}/.kiro/steering" ]]; then
  echo "Project .kiro/steering does not exist. Run bootstrap first."
  exit 1
fi

cp "${ROOT}/kiro/global-steering/engineering-foundation.md" "${TARGET}"
echo "Synchronized project foundation steering: ${TARGET}"
echo "Review docs/engineering-standard.md and update adopted version/date."
