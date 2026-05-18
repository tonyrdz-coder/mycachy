#!/bin/bash
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing packages..."
sudo pacman -S --needed - < "$REPO_DIR/packages.txt"

echo "==> Installing AUR packages..."
paru -S --needed - < "$REPO_DIR/packages-aur.txt"

echo "==> Enabling services..."
sudo systemctl enable --now bluetooth iwd
systemctl --user enable --now pipewire wireplumber

echo "==> Linking configs..."
for dir in "$REPO_DIR/config"/*/; do
  name=$(basename "$dir")
  ln -sf "$dir" "$HOME/.config/$name"
done

echo "==> Installing bin scripts..."
mkdir -p "$HOME/.local/bin"
for f in "$REPO_DIR/bin/"*; do
  [ -f "$f" ] && ln -sf "$f" "$HOME/.local/bin/$(basename "$f")"
done

echo "==> Installing Claude Code..."
npm install -g @anthropic-ai/claude-code

echo "==> Setting fish as default shell..."
chsh -s /usr/bin/fish

echo ""
echo "Done. Log out and back in to start the desktop."
