# Git Workflow Guide - All Your Tools

You now have several powerful git tools working together. Here's how to use them effectively.

---

## Quick Overview

**Tools you have:**
1. **lazygit** - Visual TUI for all git operations
2. **git-delta** - Beautiful diffs with syntax highlighting
3. **eza** - Shows git status in file listings
4. **ripgrep** - Search through git repositories (respects .gitignore)
5. **tmux-copycat** - Find commit SHAs in terminal output

---

## 1. Lazygit - Your Main Git Interface ⭐⭐⭐

Lazygit is a terminal UI that makes git visual and keyboard-driven.

### Starting lazygit

```bash
lg    # Opens lazygit in current directory
```

### Main Interface Layout

```
┌─────────────────────────────────────────────────┐
│ Files Panel     │  Commits Panel               │
│ (changed files) │  (commit history)            │
├─────────────────────────────────────────────────┤
│ Branches Panel  │  Stash Panel                 │
│ (local/remote)  │  (stashed changes)           │
└─────────────────────────────────────────────────┘
```

### Navigation Between Panels

```
1    Files panel
2    Commits panel
3    Branches panel
4    Stash panel
5    Remote panel
↑/↓  Navigate within panel
Tab  Next panel
```

---

## Common Git Workflows in Lazygit

### Workflow 1: Stage, Commit, Push

**Scenario:** You've made changes and want to commit them.

```
1. Open lazygit: lg
2. You're in Files panel (panel 1)
3. Navigate to files with ↑/↓
4. Press Space to stage a file (or 'a' to stage all)
5. Press 'c' to commit
6. Type commit message, save and close editor
7. Press 'P' (capital) to push
8. Press 'q' to quit
```

**Pro shortcut:** If you want to commit all changes:
```
a     Stage all files
c     Commit
P     Push
```

### Workflow 2: View Changes Before Staging

**Scenario:** Check what changed in files before committing.

```
1. lg
2. Navigate to a file with ↑/↓
3. Press Enter to see full diff in right panel
4. Review the changes (with delta's beautiful syntax highlighting!)
5. Press Space to stage if good
6. Press Esc to go back to file list
```

### Workflow 3: Branch Management

**Scenario:** Create a new branch, switch branches, merge.

```
# Create new branch:
1. Press '3' (Branches panel)
2. Press 'n' for new branch
3. Type branch name, press Enter
4. You're now on the new branch

# Switch branches:
1. Press '3' (Branches panel)
2. Navigate to branch with ↑/↓
3. Press Space to checkout
4. Press 'q' to go back

# Merge branches:
1. Checkout target branch (where you want to merge TO)
2. Press '3' (Branches panel)
3. Navigate to source branch (what to merge FROM)
4. Press 'm' for merge
5. Confirm
```

### Workflow 4: Interactive Rebase

**Scenario:** Squash commits, reorder, edit messages.

```
1. Press '2' (Commits panel)
2. Navigate to commit BEFORE the ones you want to rebase
3. Press 'e' for interactive rebase
4. Navigate to commits you want to change
5. Press:
   - 's' to squash commit with previous
   - 'r' to reword commit message  
   - 'd' to drop/delete commit
   - ↑/↓ to move commits up/down
6. Press Enter when done
```

### Workflow 5: Stash Changes

**Scenario:** You have uncommitted changes but need to switch branches.

```
1. lg
2. Press 's' to stash all changes
3. Or press 'S' for stash options (with message)
4. Switch branches/do other work
5. Press '4' (Stash panel)
6. Press Space to apply stash
7. Or 'g' to pop stash (apply and delete)
```

### Workflow 6: Cherry-pick Commits

**Scenario:** Take a specific commit from another branch.

```
1. Press '3' to go to Branches
2. Navigate to branch with the commit you want
3. Press Space to view its commits
4. Press '2' for Commits panel
5. Navigate to the commit
6. Press 'c' for cherry-pick options
7. Choose to cherry-pick
8. Go back to your branch
```

### Workflow 7: Resolve Merge Conflicts

**Scenario:** You have merge conflicts.

```
1. lg will show conflicted files
2. Navigate to conflicted file
3. Press 'e' to open in editor
4. Resolve conflicts manually
5. Save and close editor
6. Back in lazygit, press Space to stage resolved file
7. Press 'c' to continue merge
```

---

## Complete Lazygit Keybindings Reference

### Files Panel (1)
```
Space     Stage/unstage file
a         Stage/unstage all
d         Discard changes (dangerous!)
e         Edit file in $EDITOR
o         Open file in default app
i         Ignore file (.gitignore)
c         Commit staged files
A         Amend last commit
Enter     View file diff
```

### Commits Panel (2)
```
Enter     View commit details
Space     Checkout commit
s         Squash commit
r         Reword commit message
d         Drop/delete commit
e         Edit commit / interactive rebase
g         Reset to this commit
c         Cherry-pick commit
C         Copy commit SHA
t         Tag commit
```

### Branches Panel (3)
```
Space     Checkout branch
n         New branch
d         Delete branch
r         Rebase branch
m         Merge branch into current
M         Merge current into selected
f         Fast-forward
Enter     View branch commits
```

### Stash Panel (4)
```
Space     Apply stash
g         Pop stash (apply and delete)
d         Drop stash
```

### Global Keys (work anywhere)
```
?         Help (shows all keybindings)
x         Open command menu
R         Refresh
P         Push
p         Pull
+         Next screen mode
_         Previous screen mode
@         Open command log
:         Execute custom command
q         Quit
```

---

## 2. Git Delta - Beautiful Diffs

Delta is automatic! It enhances all git diff commands.

### Using Delta

```bash
# Just use normal git commands:
git diff                    # See changes (with delta's beautiful view)
git diff --staged          # See staged changes
git show abc123            # View commit
git log -p                 # Log with patches
git diff main..feature     # Compare branches
```

### Delta Features You'll See

**Side-by-side view:**
```
Old version          │  New version
────────────────────────────────────
def old():           │  def new():
    return 1         │      return 2
                     │      print("added")
```

**Syntax highlighting:** Code is colored based on language
**Line numbers:** Both old and new line numbers shown
**Word-level diffs:** Changed words highlighted within lines

### Navigating Delta Output (in pager)

```
↑/↓         Scroll line by line
Space       Page down
b           Page up
/pattern    Search
n           Next search result
N           Previous search result
q           Quit
```

### Quick Git Diff Tips

```bash
git diff                        # Unstaged changes
git diff --cached               # Staged changes
git diff HEAD~1                 # Last commit
git diff HEAD~3..HEAD           # Last 3 commits
git diff main..your-branch      # Branch comparison
git diff --stat                 # Summary only
git show HEAD                   # Last commit details
```

---

## 3. Eza - Git Status in File Listings

Eza shows git status right in your `ls`/`ll` output.

### Using Eza

```bash
ll    # Long listing with git status
```

### Git Status Indicators

```
M     Modified (tracked file changed)
N     New (newly added to git)
D     Deleted
R     Renamed
??    Untracked (not in git)
!!    Ignored (.gitignore)
```

### Example Output

```bash
ll
# Output:
.rw-r--r--  1.2k sdurgbun 19 Jun 16:00 M  config.py
.rw-r--r--   890 sdurgbun 19 Jun 15:30 -- README.md
.rw-r--r--   450 sdurgbun 19 Jun 16:05 ?? new_file.py
drwxr-xr-x     - sdurgbun 19 Jun 14:00 -- src/
```

The `M` shows config.py is modified!
The `??` shows new_file.py is untracked!

---

## 4. Ripgrep - Search Git Repositories

Ripgrep automatically skips files in `.gitignore`.

### Basic Git Searching

```bash
# Search for code
rg "function_name"              # Find function anywhere
rg "TODO"                       # Find all TODOs
rg "import.*React"              # Regex search

# Search in specific file types
rg "api_key" -t py              # Only Python files
rg "export" -t sh               # Only shell scripts
rg "def test" -t py             # Python test functions

# Search with context
rg "error" -A 3 -B 3            # Show 3 lines before/after
rg "bug" -C 5                   # 5 lines context both sides

# List files only
rg -l "password"                # Just filenames, not content
```

### Git-Specific Searches

```bash
# Find commit references
rg "fix.*[0-9a-f]{7,}"          # Find commit SHAs in code

# Find branch mentions
rg "main|master|develop"

# Search in git history
git log -p | rg "pattern"       # Search all commit changes
```

---

## 5. Tmux Copycat - Find Commit SHAs

When you're in tmux and see commit SHAs in output, you can quickly find them.

### Finding Git SHAs in Tmux

```bash
# In tmux:
Ctrl-space + Alt-h              # Search for commit SHAs
# Then navigate with n/N
```

### Other Git-Related Searches in Tmux

```
Ctrl-space + Ctrl-f             # Search for file paths
Ctrl-space + Ctrl-g             # Search for git status files
Ctrl-space + /                  # Regex search
```

---

## Complete Git Workflow Examples

### Example 1: Feature Branch Workflow

```bash
# 1. Create feature branch
lg
# Press 3 (branches), n (new), type "feature/new-login", Enter

# 2. Make changes in your editor
vim src/login.py

# 3. Review changes
ll                              # See what files changed (eza)
cat src/login.py                # Preview with syntax (bat)
git diff                        # See detailed changes (delta)

# 4. Search for related code
rg "login" -t py                # Find other login code

# 5. Commit with lazygit
lg
# a (stage all), c (commit), type message, P (push)

# 6. Switch back to main
lg
# Press 3, navigate to main, Space (checkout)
```

### Example 2: Reviewing Pull Request

```bash
# 1. Fetch PR branch
git fetch origin pull/123/head:pr-123
git checkout pr-123

# 2. See what changed
ll                              # Quick git status view
git diff main..pr-123           # Full diff with delta

# 3. Search for specific changes
rg "function_name"              # Find where function is used

# 4. Use lazygit to explore commits
lg
# Press 2 (commits), navigate and view each commit
```

### Example 3: Fixing Mistakes

**Undo last commit (keep changes):**
```bash
lg
# Press 2 (commits)
# Navigate to commit before the one you want to undo
# Press 'g' → soft reset
```

**Amend last commit:**
```bash
# Make additional changes
lg
# Stage files with Space
# Press 'A' to amend (not 'c')
```

**Interactive rebase (clean up history):**
```bash
lg
# Press 2 (commits)
# Navigate to commit before ones to clean up
# Press 'e' (rebase)
# Use 's' to squash, 'r' to reword, 'd' to drop
```

---

## Pro Tips

1. **Lazygit + Delta = Perfect Pair**
   - Lazygit shows you the files
   - Delta makes the diffs beautiful
   - Together they're unbeatable

2. **Quick Status Check**
   ```bash
   ll    # See git status in file list
   lg    # Open for detailed operations
   ```

3. **Search Before You Code**
   ```bash
   rg "pattern"    # Find existing similar code
   ```

4. **Keyboard > Mouse**
   - Lazygit is all keyboard
   - Learn the shortcuts (press `?` for help)
   - Much faster than GitKraken/SourceTree

5. **Commit Often**
   ```bash
   lg
   a, c, type message, q
   # Takes 5 seconds!
   ```

6. **Use Stash Liberally**
   - Don't be afraid to stash
   - Easy to apply later
   - Press 's' in lazygit

---

## Cheat Sheet - Most Used Commands

```bash
# Daily workflow
lg                       # Open lazygit
ll                       # Check git status
git diff                 # Review changes (delta)
rg "pattern"             # Search code

# In lazygit
Space      Stage/checkout
a          Stage all
c          Commit
P          Push
p          Pull
3          Branches panel
?          Help
q          Quit

# Git commands (with delta)
git diff                 # Changes
git show HEAD            # Last commit
git log -p --oneline     # Compact history
```

---

## What's Next?

**Try this now:**
1. `cd` to any git repository
2. Run `lg`
3. Press `?` to see all shortcuts
4. Stage a file with `Space`
5. Commit with `c`
6. Close with `q`

**Advanced:**
- Set up custom lazygit config: `~/.config/lazygit/config.yml`
- Explore delta themes: `delta --show-themes`
- Learn interactive rebase in lazygit

Happy git-ing! 🚀
