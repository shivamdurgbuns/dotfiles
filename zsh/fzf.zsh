# --- 1. Core FZF & Shell Integration ---
source <(fzf --zsh)

# --- 2. Hidden File Support (using fd) ---
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --strip-cwd-prefix --exclude .git'

# Fix for path completion (the ** trigger) to see hidden files
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# --- 3. Catppuccin Mocha Theme & Side Preview ---
# This adds a side preview window:
# - When searching files: Shows file content with 'bat' (or 'cat')
# - When searching dirs: Shows directory tree
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f8,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f8,hl+:#f38ba8 \
--multi --border --padding=1 --margin=1 --prompt=' ' --pointer='▶' --marker='' \
--bind 'ctrl-/:toggle-preview' \
--preview-window='right:60%:wrap' \
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | head -200)) || echo {}'"

# --- 4. Key Bindings ---
# Manually bind Option+C (standardized escape sequence)
bindkey '\ec' fzf-cd-widget
