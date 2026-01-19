#!/bin/bash

# Define directories
DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# Create necessary directories if they don't exist
mkdir -p "$CONFIG_DIR/tmux"
mkdir -p "$CONFIG_DIR/zsh"

echo "🔗 Starting symlinking..."

# --- Tmux Symlink ---
if [ -f "$HOME/.config/tmux/tmux.conf" ]; then
    echo "⚠️  Found existing tmux.conf, backing up to tmux.conf.bak"
    mv "$HOME/.config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf.bak"
fi
ln -sf "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
echo "✅ Linked tmux.conf"

# --- Zsh Symlinks ---
if [ -f "$HOME/.zshrc" ]; then
    echo "⚠️  Found existing .zshrc, backing up to .zshrc.bak"
    mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
fi
ln -sf "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
echo "✅ Linked .zshrc"

ln -sf "$DOTFILES_DIR/zsh/fzf.zsh" "$CONFIG_DIR/zsh/fzf.zsh"
echo "✅ Linked fzf.zsh"

ln -sf "$DOTFILES_DIR/zsh/git-prompt.sh" "$CONFIG_DIR/zsh/git-prompt.sh"
echo "✅ Linked git-prompt.sh"

echo "🚀 All done! Please run 'source ~/.zshrc' to apply changes."
