#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$ROOT_DIR/skills"

for dir in "$SKILLS_DIR"/*; do
  [[ -d "$dir" ]] || continue
  basename "$dir"
done
