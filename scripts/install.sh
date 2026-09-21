#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$ROOT_DIR/skills"
target=""
install_all=false
skill=""

usage() {
  cat <<'USAGE'
Usage:
  ./scripts/install.sh --target codex <skill-name>
  ./scripts/install.sh --target codex --all

The installer creates symbolic links and never overwrites an existing non-symlink path.
USAGE
}

while (($#)); do
  case "$1" in
    --target)
      [[ $# -ge 2 ]] || { usage; exit 2; }
      target="$2"
      shift 2
      ;;
    --all)
      install_all=true
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      if [[ -n "$skill" ]]; then
        printf 'Unexpected argument: %s\n' "$1" >&2
        usage
        exit 2
      fi
      skill="$1"
      shift
      ;;
  esac
done

[[ -n "$target" ]] || { printf 'Missing --target.\n' >&2; usage; exit 2; }

case "$target" in
  codex|openai)
    destination="$HOME/.agents/skills"
    ;;
  *)
    printf 'Unsupported target: %s\n' "$target" >&2
    printf 'Only verified target in V1 is codex/openai. See docs/agent-integration.md.\n' >&2
    exit 2
    ;;
esac

mkdir -p "$destination"

install_one() {
  local name="$1"
  local source="$SKILLS_DIR/$name"
  local dest="$destination/$name"

  [[ -d "$source" ]] || { printf 'Unknown skill: %s\n' "$name" >&2; exit 1; }
  [[ -f "$source/SKILL.md" ]] || { printf 'Invalid skill (missing SKILL.md): %s\n' "$name" >&2; exit 1; }

  if [[ -L "$dest" ]]; then
    current="$(readlink "$dest")"
    if [[ "$current" == "$source" ]]; then
      printf 'Already installed: %s\n' "$name"
      return
    fi
    printf 'Refusing to replace existing symlink with different target: %s -> %s\n' "$dest" "$current" >&2
    exit 1
  fi

  if [[ -e "$dest" ]]; then
    printf 'Refusing to overwrite existing path: %s\n' "$dest" >&2
    exit 1
  fi

  ln -s "$source" "$dest"
  printf 'Installed: %s -> %s\n' "$dest" "$source"
}

if $install_all; then
  [[ -z "$skill" ]] || { printf 'Use either --all or one skill name, not both.\n' >&2; exit 2; }
  for dir in "$SKILLS_DIR"/*; do
    [[ -d "$dir" ]] || continue
    install_one "$(basename "$dir")"
  done
else
  [[ -n "$skill" ]] || { printf 'Missing skill name or --all.\n' >&2; usage; exit 2; }
  install_one "$skill"
fi
