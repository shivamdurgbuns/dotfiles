# New Tools Usage Guide

All tools have been installed and configured! Reload your shell to activate:
```bash
source ~/.zshrc
```

For tmux plugins, press: `Ctrl-space + Shift-I` to install them.

---

## 1. Zsh Autosuggestions ⭐⭐⭐

**What it does:** Suggests commands as you type based on your history

### How to use:
1. Start typing any command you've used before
2. You'll see a **gray suggestion** appear
3. Press **→ (Right Arrow)** to accept the full suggestion
4. Or press **Ctrl-→** to accept one word at a time
5. Just keep typing to ignore the suggestion

### Example:
```bash
# You type: cd do
# It suggests (in gray): cd dotfiles/tmux
# Press → to accept, or keep typing
```

**Pro tip:** The more you use your terminal, the smarter it gets!

---

## 2. Zsh Syntax Highlighting ⭐⭐⭐

**What it does:** Colors your commands in real-time

### How to use:
Just type normally! It highlights automatically:
- **Green** = Valid command (exists)
- **Red** = Invalid command (typo or doesn't exist)
- **Blue** = Path/file that exists
- **Yellow** = String/argument

### Example:
```bash
ls        # Green (command exists)
lss       # Red (typo!)
~/code    # Blue (path exists)
```

**Pro tip:** Catch typos BEFORE hitting Enter!

---

## 3. Lazygit ⭐⭐⭐

**What it does:** Beautiful TUI for git - stage, commit, push, rebase all with keyboard

### How to use:
```bash
lg    # Opens lazygit in current directory
```

### Key bindings (inside lazygit):
```
Navigation:
  1-5       Switch panels (Files/Commits/Branches/etc)
  ↑/↓       Navigate items
  Enter     View details

Files Panel:
  Space     Stage/unstage file
  a         Stage all
  d         Discard changes
  c         Commit (opens editor)
  
Commits:
  s         Squash commits
  r         Reword commit message
  d         Delete commit
  
Branches:
  n         New branch
  Space     Checkout branch
  m         Merge
  r         Rebase
  
General:
  P         Push
  p         Pull
  R         Refresh
  x         Open command menu
  ?         Help (shows all keys)
  q         Quit
```

### Workflow example:
1. Run `lg` in your git repo
2. Press `Space` to stage changed files
3. Press `c` to commit
4. Type message, save and close editor
5. Press `P` to push
6. Press `q` to quit

**Pro tip:** Press `?` inside lazygit to see all keybindings!

---

## 4. bat (Better cat) ⭐⭐⭐

**What it does:** Like `cat` but with syntax highlighting, line numbers, and git integration

### How to use:
```bash
cat filename.py       # Now uses bat automatically
bat filename.js       # Explicit bat command
```

### Features:
- **Syntax highlighting** for 200+ languages
- **Line numbers** on the left
- **Git diff** indicators (+ for added, - for removed)
- **Automatic paging** for long files

### Options:
```bash
bat -n file.py        # No line numbers
bat -A file.txt       # Show non-printable characters
bat --style=plain     # Plain output (like regular cat)
bat file1 file2       # View multiple files
```

### Example:
```bash
cat ~/.zshrc          # Beautiful colored output with line numbers
bat package.json      # See JSON with syntax highlighting
```

**Pro tip:** Use it to preview files before editing!

---

## 5. eza (Better ls) ⭐⭐

**What it does:** Modern `ls` replacement with icons, colors, and git status

### How to use:
```bash
ls          # Now uses eza with icons
ll          # Long listing with icons and git status
```

### What you'll see:
- **📁 Icons** for different file types
- **Colors** for different file categories
- **Git status** (modified, added, ignored)
- **File sizes** in human-readable format
- **Permissions** clearly displayed

### More options:
```bash
eza --tree           # Tree view (like 'tree' command)
eza --tree --level=2 # Tree with depth limit
eza -T --git-ignore  # Tree but respect .gitignore
eza -la --sort=size  # Sort by size
eza -la --sort=mod   # Sort by modification time
```

### Example:
```bash
cd ~/code/my-playground/dotfiles
ls                   # See all your config folders with icons
ll                   # Detailed view with git status
```

**Pro tip:** In git repos, you'll see which files are modified!

---

## 6. ripgrep (Better grep) ⭐⭐⭐

**What it does:** Insanely fast code search that respects .gitignore

### How to use:
```bash
grep "pattern" .              # Now uses ripgrep (rg)
rg "function_name"            # Search in current directory
rg "TODO" ~/code              # Search in specific directory
```

### Why it's better:
- **5-10x faster** than regular grep
- **Respects .gitignore** (skips node_modules, .git, etc.)
- **Syntax highlighting** in results
- **Smart defaults** (recursive, line numbers, colors)

### Useful patterns:
```bash
rg "import.*React"            # Regex search
rg -i "todo"                  # Case-insensitive
rg -t py "def.*test"          # Only search Python files
rg -l "api_key"               # Just list filenames (not content)
rg "error" -A 3 -B 3          # Show 3 lines before/after match
rg "password" -g '!*.log'     # Exclude log files
```

### Example workflow:
```bash
cd ~/code/my-playground
rg "zoxide"                   # Find all mentions of zoxide
rg "export.*PATH"             # Find all PATH exports
rg -t sh "alias"              # Find aliases in shell files only
```

**Pro tip:** It's automatically recursive and fast. Just `rg pattern` is usually enough!

---

## 7. git-delta (Better git diff) ⭐⭐

**What it does:** Beautiful syntax-highlighted diffs with side-by-side view

### How to use:
It's automatic! Just use normal git commands:
```bash
git diff                 # Now beautiful with delta
git show                 # Show commits with delta
git log -p               # Log with diffs in delta
git diff main..feature   # Compare branches
```

### What you'll see:
- **Side-by-side** diff view
- **Line numbers** on both sides
- **Syntax highlighting** in code
- **Word-level** change highlighting
- **Better colors** for additions/deletions

### Navigation (in pager):
```
↑/↓         Scroll line by line
Space       Scroll page down
b           Scroll page up
/pattern    Search
n           Next search result
q           Quit
```

### Example:
```bash
git diff HEAD~1          # See last commit changes beautifully
git show abc123          # View specific commit
```

**Pro tip:** The side-by-side view makes refactors much easier to review!

---

## 8. tmux-prefix-highlight

**What it does:** Visual indicator when you press the prefix key (Ctrl-space)

### How to use:
1. Install it: `Ctrl-space + Shift-I`
2. It automatically shows in your status bar
3. Press `Ctrl-space` and you'll see a **highlighted indicator**
4. Helps you know when prefix is active

**Pro tip:** No more "did I press the prefix?" confusion!

---

## Quick Reference Cheat Sheet

### Daily Workflow:

**File browsing:**
```bash
ls              # See files with icons
ll              # Detailed view with git status
cat file.py     # Preview with syntax highlighting
```

**Code searching:**
```bash
rg "pattern"              # Fast recursive search
rg "TODO" -t py           # Search only Python files
rg -i "error"             # Case-insensitive search
```

**Git workflow:**
```bash
lg                        # Open lazygit TUI
# OR traditional:
git status               # See changes
git diff                 # Beautiful side-by-side diff
git add .
git commit -m "message"
git push
```

**Navigation:**
```bash
cd tmux         # Just type partial name (zoxide)
cd dot          # Jumps to dotfiles
# Start typing + → to accept suggestions
```

---

## Troubleshooting

### Autosuggestions not showing?
```bash
source ~/.zshrc
```

### Syntax highlighting not working?
```bash
source ~/.zshrc
```

### Tmux prefix highlight not visible?
```bash
# In tmux:
Ctrl-space + Shift-I    # Install plugins
Ctrl-space + Shift-U    # Update plugins
```

### Delta not showing in git diff?
```bash
# Check if configured:
git config --get core.pager
# Should output: delta
```

---

## Pro Tips

1. **Combine tools:**
   ```bash
   rg "function" | bat            # Search and view with syntax
   eza --tree | bat               # Tree view with paging
   ```

2. **Lazygit + tmux:**
   - Bind `Ctrl-space + g` to open lazygit?
   - Let me know if you want this!

3. **Practice shortcuts:**
   - Start typing → press `→` (autosuggestion)
   - Type `lg` instead of git commands
   - Use `rg` instead of `grep`

4. **Explore more:**
   ```bash
   bat --help
   eza --help
   rg --help
   delta --help
   ```

---

## What Changed in Your Dotfiles

✅ **zshrc updated:**
- Added zsh-autosuggestions
- Added zsh-syntax-highlighting
- Changed `ls` → `eza` with icons
- Changed `ll` → `eza -la --icons --git`
- Changed `cat` → `bat`
- Changed `grep` → `rg`
- Added `lg` → `lazygit`

✅ **tmux.conf updated:**
- Added tmux-prefix-highlight plugin

✅ **New gitconfig created:**
- Configured git-delta for beautiful diffs
- Symlinked to ~/.gitconfig

**To activate everything:**
```bash
source ~/.zshrc                              # Reload shell
# In tmux:
Ctrl-space + Shift-I                        # Install new tmux plugin
```

Enjoy your supercharged terminal! 🚀
