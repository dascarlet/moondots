#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

shopt -s nullglob
for f in "$REPO_DIR"/.??*; do
  name="$(basename "$f")"
  case "$name" in
    .git|.github) continue ;;
  esac
  target="$HOME/$name"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "skip: $target exists and is not a symlink" >&2
    continue
  fi
  ln -snfv "$f" "$target"
done
