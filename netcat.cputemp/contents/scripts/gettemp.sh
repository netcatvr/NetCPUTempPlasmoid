#!/usr/bin/env bash
set -euo pipefail

if ! command -v sensors >/dev/null 2>&1; then
  echo "no sensors"
  exit 1
fi

sensors 2>/dev/null | awk '
  # Intel
  /Package id 0:/ {
    gsub(/\+/, "", $4)
    gsub(/°C/, "", $4)
    printf "%.1f°C\n", $4
    exit
  }

  # AMD Zen
  /Tctl:/ {
    gsub(/\+/, "", $2)
    gsub(/°C/, "", $2)
    printf "%.1f°C\n", $2
    exit
  }

  /Tdie:/ {
    gsub(/\+/, "", $2)
    gsub(/°C/, "", $2)
    printf "%.1f°C\n", $2
    exit
  }
'
