#!/bin/bash
set -e

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

echo "📂 Using dotfiles directory: $DOTFILES_DIR"

# Create necessary directories if they don't exist
mkdir -p "$CONFIG_DIR/tmux"
mkdir -p "$CONFIG_DIR/zsh"

echo "🔗 Starting symlinking..."

# --- Tmux Configuration ---
if [ -f "$HOME/.config/tmux/tmux.conf" ]; then
    echo "⚠️  Found existing tmux.conf, backing up to tmux.conf.bak"
    mv "$HOME/.config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf.bak"
fi
ln -sf "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
echo "✅ Linked tmux.conf"

if [ -f "$HOME/.config/tmux/tmux.reset.conf" ]; then
    mv "$HOME/.config/tmux/tmux.reset.conf" "$HOME/.config/tmux/tmux.reset.conf.bak"
fi
ln -sf "$DOTFILES_DIR/tmux/tmux.reset.conf" "$HOME/.config/tmux/tmux.reset.conf"
echo "✅ Linked tmux.reset.conf"

# Symlink tmux scripts directory
if [ -e "$HOME/.config/tmux/scripts" ]; then
    echo "⚠️  Found existing tmux scripts, backing up to scripts.bak"
    mv "$HOME/.config/tmux/scripts" "$HOME/.config/tmux/scripts.bak"
fi
ln -sf "$DOTFILES_DIR/tmux/scripts" "$HOME/.config/tmux/scripts"
echo "✅ Linked tmux scripts directory"

# --- Zsh Configuration ---
if [ -f "$HOME/.zshrc" ]; then
    echo "⚠️  Found existing .zshrc, backing up to .zshrc.bak"
    mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
fi
ln -sf "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
echo "✅ Linked .zshrc"

ln -sf "$DOTFILES_DIR/zsh/fzf.zsh" "$CONFIG_DIR/zsh/fzf.zsh"
echo "✅ Linked fzf.zsh"

ln -sf "$DOTFILES_DIR/zsh/fzf-git.sh" "$CONFIG_DIR/zsh/fzf-git.sh"
echo "✅ Linked fzf-git.sh"

# --- Git Configuration ---
if [ -f "$HOME/.gitconfig" ]; then
    echo "⚠️  Found existing .gitconfig, backing up to .gitconfig.bak"
    mv "$HOME/.gitconfig" "$HOME/.gitconfig.bak"
fi
ln -sf "$DOTFILES_DIR/git/gitconfig" "$HOME/.gitconfig"
echo "✅ Linked .gitconfig"

# --- Alacritty Configuration ---
mkdir -p "$CONFIG_DIR/alacritty"
if [ -f "$CONFIG_DIR/alacritty/alacritty.toml" ]; then
    echo "⚠️  Found existing alacritty.toml, backing up to alacritty.toml.bak"
    mv "$CONFIG_DIR/alacritty/alacritty.toml" "$CONFIG_DIR/alacritty/alacritty.toml.bak"
fi
ln -sf "$DOTFILES_DIR/alacritty/alacritty.toml" "$CONFIG_DIR/alacritty/alacritty.toml"
echo "✅ Linked alacritty.toml"

# --- Vim Configuration ---
if [ -f "$HOME/.vimrc" ]; then
    echo "⚠️  Found existing .vimrc, backing up to .vimrc.bak"
    mv "$HOME/.vimrc" "$HOME/.vimrc.bak"
fi
ln -sf "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"
echo "✅ Linked .vimrc"

echo ""
echo "🚀 All done! Symlinks created successfully."
echo ""
echo "Next steps:"
echo "  1. Install tmux plugin manager: git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm"
echo "  2. Install Oh My Zsh if not already installed: sh -c \"\$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
echo "  3. Reload zsh: source ~/.zshrc"
echo "  4. Start tmux and install plugins: tmux, then press prefix + I"
