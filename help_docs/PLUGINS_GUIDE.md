# Plugin Guide & Cheatsheet

## Zsh Plugins (Oh My Zsh)

### git
**What it does:** Provides git aliases and functions for faster git operations

**Common aliases:**
```bash
gst    # git status
ga     # git add
gc     # git commit
gp     # git push
gl     # git pull
gco    # git checkout
gcb    # git checkout -b
gd     # git diff
glog   # git log --oneline --decorate --graph
```

---

## Tmux Plugins (TPM - Tmux Plugin Manager)

### 1. **tpm** (Tmux Plugin Manager)
**What it does:** Plugin manager itself - manages all other tmux plugins

**Key bindings:**
- `Prefix + I` - Install new plugins
- `Prefix + U` - Update plugins
- `Prefix + alt + u` - Uninstall plugins not in config

---

### 2. **tmux-sensible**
**What it does:** Basic tmux settings everyone can agree on (sane defaults)

**Features:**
- Increases scrollback to 50,000 lines
- Emacs key bindings in command mode
- Better status line refresh
- Mouse mode enabled
- Focus events enabled

**No keybindings** - just improves default behavior

---

### 3. **tmux-yank**
**What it does:** Copies text to system clipboard

**Key bindings:**
- `y` in copy mode - copy selection to clipboard
- `Y` in copy mode - copy current line to clipboard
- `Prefix + y` - copy command line to clipboard
- `Prefix + Y` - copy current pane's working directory

---

### 4. **tmux-resurrect**
**What it does:** Save and restore tmux sessions across reboots

**Key bindings:**
- `Prefix + Ctrl-s` - Save session (you have this configured)
- `Prefix + Ctrl-r` - Restore session

**What it saves:**
- All windows, panes, layouts
- Working directories
- Running programs

---

### 5. **tmux-continuum**
**What it does:** Automatic saving and restoring of tmux sessions

**Your config:**
- Auto-restore on tmux start: ON
- Auto-save interval: Every 5 minutes

**No manual keybindings** - works automatically with tmux-resurrect

---

### 6. **tmux-thumbs**
**What it does:** Copy/paste text hints (like vimium for terminal) - shows hints over text you can copy

**Key bindings:**
- `Prefix + Space` (default) - Activate thumbs mode
- Type the hint letters to copy that text

**Great for:** Copying file paths, URLs, commit hashes, IPs

---

### 7. **extrakto**
**What it does:** Fuzzy-find and copy text from current pane using fzf

**Your config:**
- `Prefix + Tab` - Open extrakto
- Grab area: full pane
- Split size: 15 lines

**What it extracts:** URLs, file paths, git SHAs, IPs, etc.

---

### 8. **tmux-fzf**
**What it does:** Fuzzy finder menu for tmux operations

**Key bindings:**
- `Prefix + F` - Open full fzf menu (you configured this)
- `Prefix + o` - Session switcher (your custom binding)

**Can fuzzy-find:**
- Sessions, windows, panes
- Commands, keybindings

---

### 9. **tmux-fzf-url**
**What it does:** Opens URLs from terminal using fzf

**Key bindings:**
- `Prefix + u` (default) - List all URLs in pane, select with fzf to open in browser

---

### 10. **catppuccin/tmux**
**What it does:** Beautiful Catppuccin theme for tmux status bar

**Your config:**
- Theme with custom window separators
- Shows: session name, SSH status
- Custom colors: mauve for active window, pitch black background

**No keybindings** - visual theme only

---

### 11. **tmux-sessionx**
**What it does:** Session manager with zoxide integration and fuzzy finding

**Your config:**
- `Prefix + o` - Open sessionx
- Zoxide mode: ON (smart directory jumping)
- Window: 85% height, 75% width
- Preview: right side, 60% ratio

**Features:**
- Create/switch sessions
- Zoxide integration for smart directory suggestions
- Live preview of sessions

---

### 12. **tmux-floax**
**What it does:** Floating terminal windows (like a dropdown terminal)

**Your config:**
- `Prefix + p` - Toggle floating window
- `Ctrl + Alt + x` - Close floating pane (custom to avoid Rectangle conflict)
- Size: 80% width, 80% height
- Auto-change to current directory

---

### 13. **tmux-logging**
**What it does:** Save pane output to a file

**Key bindings:**
- `Prefix + Shift + p` - Toggle logging
- `Prefix + Alt + p` - Save complete pane history
- `Prefix + Alt + Shift + p` - Clear pane history

**Output location:** `~/tmux-logs/`

---

### 14. **tmux-open**
**What it does:** Smart opening of highlighted files/URLs

**Key bindings (in copy mode):**
- `o` - Open highlighted selection (files in editor, URLs in browser)
- `Ctrl-o` - Open in $EDITOR
- `Shift-s` - Search highlighted text in Google

---

### 15. **tmux-copycat**
**What it does:** Smart regex searches in tmux scrollback

**Key bindings:**
- `Prefix + /` - Search (regex)
- `Prefix + Ctrl-f` - File search
- `Prefix + Ctrl-g` - Git status search
- `Prefix + Alt-h` - SHA-1 hash search
- `Prefix + Ctrl-u` - URL search
- `Prefix + Ctrl-d` - Number search (IP addresses, etc.)
- `n` - Jump to next match
- `N` - Jump to previous match

---

## Quick Reference: Your Custom Keybindings

### Tmux Custom Keys (from your config)
```
Prefix + Ctrl-s    Save session manually
Prefix + o         Open sessionx (session switcher with zoxide)
Prefix + p         Toggle floating window
Prefix + t         Open tuxedo (newly added)
Prefix + F         Full tmux-fzf menu
Prefix + Tab       Extrakto (fuzzy copy text)
Ctrl + Alt + x     Close floating pane
```

### Zsh Aliases (from your config)
```bash
dot              # cd ~/dotfiles
conf-tmux        # vim ~/dotfiles/tmux/tmux.conf
conf-zsh         # vim ~/dotfiles/zsh/.zshrc
conf-fzf         # vim ~/dotfiles/zsh/fzf.zsh
reload-zsh       # source ~/.zshrc
reload-tmux      # tmux source-file ~/.config/tmux/tmux.conf
ll               # ls -al
```

---

## Workflow Tips

### Session Management
1. **Quick switch sessions:** `Prefix + o` (sessionx with zoxide)
2. **Save before system restart:** `Prefix + Ctrl-s`
3. **Auto-restore after reboot:** Sessions restore automatically

### Copy/Paste Workflow
1. **Copy visible text with hints:** `Prefix + Space` (tmux-thumbs)
2. **Fuzzy search and copy:** `Prefix + Tab` (extrakto)
3. **Copy URLs:** `Prefix + u` (tmux-fzf-url)
4. **Visual selection copy:** Enter copy mode, select, press `y`

### Finding Things
1. **Search scrollback:** `Prefix + /` (copycat)
2. **Find files in output:** `Prefix + Ctrl-f` (copycat)
3. **Find URLs:** `Prefix + Ctrl-u` (copycat)

### Floating Terminal
1. **Quick scratchpad:** `Prefix + p` (floax)
2. **Run quick command without leaving context**
3. **Close when done:** `Ctrl + Alt + x`

---

## Notes
- **Prefix** = `Ctrl-space` (your custom prefix)
- All plugin configs are in: `~/code/my-playground/dotfiles/tmux/tmux.conf`
- Tmux sessions auto-save every 5 minutes
- Zoxide learns your directory usage automatically
