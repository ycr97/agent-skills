#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$ROOT_DIR/skills"
errors=0
count=0

fail() {
  printf 'ERROR: %s\n' "$*" >&2
  errors=$((errors + 1))
}

for dir in "$SKILLS_DIR"/*; do
  [[ -d "$dir" ]] || continue
  count=$((count + 1))
  skill="$(basename "$dir")"
  file="$dir/SKILL.md"

  [[ "$skill" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] || fail "$skill: directory name must be lowercase kebab-case"
  [[ -f "$file" ]] || { fail "$skill: missing SKILL.md"; continue; }

  first_line="$(sed -n '1p' "$file")"
  [[ "$first_line" == '---' ]] || { fail "$skill: SKILL.md must start with YAML frontmatter"; continue; }

  end_line="$(awk 'NR>1 && $0=="---" {print NR; exit}' "$file")"
  [[ -n "$end_line" ]] || { fail "$skill: unterminated YAML frontmatter"; continue; }

  frontmatter="$(sed -n "2,$((end_line - 1))p" "$file")"
  name="$(printf '%s\n' "$frontmatter" | sed -n 's/^name:[[:space:]]*//p' | head -n1)"
  description="$(printf '%s\n' "$frontmatter" | sed -n 's/^description:[[:space:]]*//p' | head -n1)"

  [[ -n "$name" ]] || fail "$skill: frontmatter is missing name"
  [[ -n "$description" ]] || fail "$skill: frontmatter is missing description"
  [[ "$name" == "$skill" ]] || fail "$skill: frontmatter name '$name' must match directory name"
done

if (( count == 0 )); then
  fail "no skills found"
fi

if (( errors > 0 )); then
  printf '\nValidation failed with %d error(s).\n' "$errors" >&2
  exit 1
fi

printf 'Validated %d skill(s) successfully.\n' "$count"
