#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${HOME}/.kiro/steering"

mkdir -p "${TARGET}"
cp "${ROOT}"/kiro/global-steering/*.md "${TARGET}/"

echo "Installed Kiro Global Steering to ${TARGET}"
