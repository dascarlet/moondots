#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
STOW_DIR="$(dirname "$REPO_DIR")"
PKG_NAME="$(basename "$REPO_DIR")"

if command -v stow >/dev/null 2>&1; then
  stow --target="$HOME" --dir="$STOW_DIR" --restow --verbose "$PKG_NAME"
  exit 0
fi

echo "stow not found; falling back to manual symlinks" >&2
for f in "$REPO_DIR"/.??*; do
  name="$(basename "$f")"
  case "$name" in
    .git|.github|.stow-local-ignore) continue ;;
  esac
  ln -snfv "$f" "$HOME/$name"
done
