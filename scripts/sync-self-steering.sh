#!/usr/bin/env bash
set -euo pipefail

# sync-self-steering.sh
#
# Regenerates .kiro/steering/ from the canonical manifest.
# Uses #[[file:]] references — no content duplication.
#
# Phases:
#   1. Parse and validate the entire manifest (no mutations).
#   2. Generate runtime steering files (only after Phase 1 succeeds).
#   3. Cleanup obsolete generated files (only after Phase 2 succeeds).
#
# The script fails closed: any validation error aborts before any file
# is generated, overwritten, or deleted.
#
# Cleanup dual condition — only deletes files that BOTH:
#   a) match the generated naming pattern (two-digit prefix + slug + .md); AND
#   b) contain the exact generated ownership marker.

GENERATED_MARKER="GENERATED RUNTIME COPY"
GENERATED_PATTERN='^[0-9][0-9]-[a-z][-a-z0-9]*\.md$'

# Resolve repository root
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MANIFEST="${ROOT}/kiro/self-steering-manifest.txt"
TARGET="${ROOT}/.kiro/steering"

# ============================================================
# PHASE 1 — Parse and validate (no mutations)
# ============================================================

if [ ! -f "${MANIFEST}" ]; then
  echo "ERROR: Manifest not found: ${MANIFEST}" >&2
  exit 1
fi

errors=0
entry_count=0
all_prefixes=""
all_dest_names=""

# Collect entries for Phase 2
entries=""

while IFS= read -r line; do
  # Skip comments and blank lines
  case "${line}" in
    "#"*|"") continue ;;
  esac

  entry_count=$((entry_count + 1))

  # Parse: <prefix> <path> <title...>
  prefix="$(echo "${line}" | awk '{print $1}')"
  source_path="$(echo "${line}" | awk '{print $2}')"
  title="$(echo "${line}" | awk '{$1=""; $2=""; sub(/^[[:space:]]+/, ""); print}')"

  # Validate line format
  if [ -z "${prefix}" ] || [ -z "${source_path}" ] || [ -z "${title}" ]; then
    echo "ERROR: Malformed manifest line: ${line}" >&2
    errors=$((errors + 1))
    continue
  fi

  # Validate prefix is two digits
  if ! echo "${prefix}" | grep -qE '^[0-9][0-9]$'; then
    echo "ERROR: Prefix must be exactly two digits, got: ${prefix}" >&2
    errors=$((errors + 1))
    continue
  fi

  # Derive destination name
  slug="$(basename "${source_path}" .md)"
  dest_name="${prefix}-${slug}.md"

  # Validate destination matches generated pattern
  if ! echo "${dest_name}" | grep -qE "${GENERATED_PATTERN}"; then
    echo "ERROR: Generated name does not match pattern: ${dest_name}" >&2
    errors=$((errors + 1))
    continue
  fi

  # Validate canonical source exists
  if [ ! -f "${ROOT}/${source_path}" ]; then
    echo "ERROR: Canonical source does not exist: ${source_path}" >&2
    errors=$((errors + 1))
    continue
  fi

  # Validate no duplicate prefix
  for existing_prefix in ${all_prefixes}; do
    if [ "${existing_prefix}" = "${prefix}" ]; then
      echo "ERROR: Duplicate prefix '${prefix}' for: ${source_path}" >&2
      errors=$((errors + 1))
      break
    fi
  done

  # Validate no duplicate destination name
  for existing_dest in ${all_dest_names}; do
    if [ "${existing_dest}" = "${dest_name}" ]; then
      echo "ERROR: Duplicate destination name: ${dest_name}" >&2
      errors=$((errors + 1))
      break
    fi
  done

  all_prefixes="${all_prefixes} ${prefix}"
  all_dest_names="${all_dest_names} ${dest_name}"

  # Collect entry for Phase 2 (pipe-delimited to avoid whitespace issues in title)
  entries="${entries}${prefix}|${source_path}|${title}
"

done < "${MANIFEST}"

# Validate at least one entry
if [ "${entry_count}" -eq 0 ]; then
  echo "ERROR: Manifest contains no entries." >&2
  errors=$((errors + 1))
fi

# --- FAIL CLOSED ---
if [ "${errors}" -gt 0 ]; then
  echo "FAILED: ${errors} validation error(s). No files generated, overwritten, or deleted." >&2
  exit 1
fi

echo "Phase 1: Manifest validated (${entry_count} entries, 0 errors)."

# ============================================================
# PHASE 2 — Generate runtime steering files
# ============================================================

mkdir -p "${TARGET}"

generated_dest_names=""

echo "${entries}" | while IFS='|' read -r prefix source_path title; do
  [ -z "${prefix}" ] && continue

  slug="$(basename "${source_path}" .md)"
  dest_name="${prefix}-${slug}.md"
  dest_file="${TARGET}/${dest_name}"

  cat > "${dest_file}" <<EOF
---
inclusion: always
---

<!-- ${GENERATED_MARKER} -- DO NOT EDIT INDEPENDENTLY
     Canonical source: ${source_path}
     Regenerate with: scripts/sync-self-steering.sh or .ps1
     Any edits here will be overwritten on next sync. -->

# ${title} (Active Steering)

This file activates the ${title} rules for Kiro Web.

#[[file:${source_path}]]
EOF

done

echo "Phase 2: Generated ${entry_count} runtime steering files."

# ============================================================
# PHASE 3 — Cleanup obsolete generated files
# ============================================================

cleaned=0

for existing in "${TARGET}"/*.md; do
  [ -f "${existing}" ] || continue
  filename="$(basename "${existing}")"

  # Dual condition A: must match generated naming pattern
  if ! echo "${filename}" | grep -qE "${GENERATED_PATTERN}"; then
    continue
  fi

  # Check if this file is in the expected set
  is_expected=0
  for expected in ${all_dest_names}; do
    if [ "${filename}" = "${expected}" ]; then
      is_expected=1
      break
    fi
  done

  if [ "${is_expected}" -eq 0 ]; then
    # Dual condition B: must contain the generated ownership marker
    if grep -qF "${GENERATED_MARKER}" "${existing}" 2>/dev/null; then
      echo "Removing obsolete generated file: ${filename}"
      rm -f "${existing}"
      cleaned=$((cleaned + 1))
    fi
  fi
done

echo "Phase 3: Cleanup complete (${cleaned} obsolete file(s) removed)."
echo ""
echo "Self-steering synchronized: ${TARGET}/"
ls -1 "${TARGET}/"
