# Dotfiles

Personal development environment configuration files.

## Contents

This repository contains configuration for:

- **tmux** - Terminal multiplexer with session management, fuzzy finder, and theme
- **zsh** - Shell configuration with Oh My Zsh and fzf integration
- **git** - Git settings with delta diff viewer
- **vim** - Basic vim configuration

## Prerequisites

### Required

- **zsh** - Shell (macOS default)
- **git** - Version control
- **tmux** - Terminal multiplexer (`brew install tmux`)
- **Oh My Zsh** - Zsh framework

### Recommended

- **fzf** - Fuzzy finder (`brew install fzf`)
- **delta** - Better git diffs (`brew install git-delta`)
- **TPM** - Tmux Plugin Manager (auto-installed by install.sh instructions)

### Tmux Plugins (installed via TPM)

The tmux configuration uses these plugins:
- `tmux-plugins/tpm` - Plugin manager
- `tmux-plugins/tmux-sensible` - Sensible defaults
- `tmux-plugins/tmux-yank` - Copy to system clipboard
- `tmux-plugins/tmux-resurrect` - Save/restore sessions
- `tmux-plugins/tmux-continuum` - Auto-save sessions
- `fcsonline/tmux-thumbs` - Quick text selection
- `Morantron/tmux-fingers` - Fast text copying
- `sainnhe/tmux-fzf` - Fuzzy finder integration
- `catppuccin/tmux` - Catppuccin theme
- `tmux-plugins/tmux-sessionist` - Session management

## Installation

1. **Clone this repository:**
   ```bash
   git clone <your-repo-url> ~/code/my-playground/dotfiles
   cd ~/code/my-playground/dotfiles
   ```

2. **Run the install script:**
   ```bash
   ./install.sh
   ```
   
   The script will:
   - Create symlinks for all config files
   - Back up existing configs to `.bak` files
   - Provide next steps for plugin installation

3. **Install Oh My Zsh** (if not already installed):
   ```bash
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

4. **Install Tmux Plugin Manager (TPM):**
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
   ```

5. **Reload shell configuration:**
   ```bash
   source ~/.zshrc
   ```

6. **Install tmux plugins:**
   - Start tmux: `tmux`
   - Press `prefix + I` (capital i) to install plugins
   - Default prefix is `Ctrl-b`

## Directory Structure

```
dotfiles/
├── git/
│   └── gitconfig          # Git configuration with delta
├── tmux/
│   ├── tmux.conf         # Main tmux config
│   ├── tmux.reset.conf   # Reset settings
│   └── scripts/          # Custom tmux scripts
│       └── ssh_session.sh
├── vim/
│   └── vimrc             # Vim configuration
├── zsh/
│   ├── zshrc             # Main zsh config (Oh My Zsh)
│   ├── fzf.zsh           # fzf key bindings
│   └── fzf-git.sh        # Git integration with fzf
├── install.sh            # Symlink creation script
└── README.md             # This file
```

## Key Features & Keybindings

### Tmux

**Session Management:**
- `prefix + o` - Fuzzy session switcher (tmux-fzf)
- `prefix + g` - Session switcher (tmux-sessionist)
- `prefix + C` - Create new session
- `prefix + X` - Kill session without detaching

**Window/Pane:**
- `prefix + p` - Open popup terminal (80% width/height)
- `prefix + Tab` - tmux-fingers (quick text selection)

**Persistence:**
- `prefix + Ctrl-s` - Manual session save
- Auto-saves every 15 minutes (tmux-continuum)
- Auto-restore on tmux server start

**Todo Management:**
- `prefix + t` - Open tuxedo (main todo)
- `prefix + T` - Open garden-task (project todo)

**Theme:**
- Catppuccin Mocha theme with custom status line
- Shows SSH session status in status bar

### Zsh

- **Theme:** gianu (Oh My Zsh)
- **fzf integration** for fuzzy file/history search
- **Git shortcuts** via fzf-git.sh

### Git

- **Delta diff viewer** with side-by-side view
- **Syntax highlighting** with Catppuccin Mocha theme
- **Line numbers** in diffs
- **3-way merge conflict style**

### Vim

- Line numbers (relative + absolute)
- Smart case-insensitive search
- 4-space indentation (spaces, not tabs)
- Mouse support
- Syntax highlighting
- No backup/swap files

## Customization

Edit files in this repository, not the symlinked locations:
- Tmux: `~/code/my-playground/dotfiles/tmux/tmux.conf`
- Zsh: `~/code/my-playground/dotfiles/zsh/zshrc`
- Git: `~/code/my-playground/dotfiles/git/gitconfig`
- Vim: `~/code/my-playground/dotfiles/vim/vimrc`

Changes are immediately reflected since these are symlinked.

## Important Notes

- **Never commit secrets** - This is a git repository. Don't add API keys, tokens, or passwords.
- **Environment variables** - Store secrets in `~/.zshrc.local` or `~/.env` (not in this repo)
- **Local overrides** - Create `.local` versions of configs for machine-specific settings

## Troubleshooting

**Tmux plugins not loading:**
1. Check TPM is installed: `ls ~/.config/tmux/plugins/tpm`
2. Reload tmux config: `tmux source ~/.config/tmux/tmux.conf`
3. Install plugins: `prefix + I`

**Zsh theme not loading:**
1. Verify Oh My Zsh is installed: `ls ~/.oh-my-zsh`
2. Check theme exists: `ls ~/.oh-my-zsh/themes/gianu.zsh-theme`
3. Reload: `source ~/.zshrc`

**Git delta not working:**
1. Install delta: `brew install git-delta`
2. Verify installation: `delta --version`

## Updates

To update configurations:

1. Pull latest changes: `git pull`
2. Reload configs:
   ```bash
   source ~/.zshrc
   tmux source ~/.config/tmux/tmux.conf  # if tmux is running
   ```
3. Update tmux plugins: `prefix + U` (inside tmux)
