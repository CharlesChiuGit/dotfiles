#!/usr/bin/zsh

# export FZF_DEFAULT_COMMAND='fd --type file --strip-cwd-prefix --hidden --follow'
#     --preview='pistol {}' --bind='E:execute(nvim {})' --preview-label='┓ ⟪Preview⟫ ┏' --preview-window=right,border-bold
export FZF_DEFAULT_OPTS="\
    --ansi --height 40% --layout=reverse --border --separator='╸' --header='E to edit' \
    --preview-label='┓ ⟪Preview⟫ ┏' --preview-window=border-bold --scrollbar '▌▐'\
    --color=border:#cba6f7,label:#cba6f7,separator:#a6e3a1 \
    --color=bg+:#313244,bg:,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
# export FZF_CTRL_T_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
# export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"
# export FZF_ALT_C_COMMAND='fd -H --type d . --color=never'
# export FZF_ALT_T_OPTS="$FZF_DEFAULT_OPTS"

# Use fd instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
# _fzf_compgen_path() {
#   fd --hidden --follow --exclude ".git" . "$1"
# }

# Use fd to generate the list for directory completion
# _fzf_compgen_dir() {
#   fd --type d --hidden --follow --exclude ".git" . "$1"
# }

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
# _fzf_comprun() {
#   local command=$1
#   shift

#   case "$command" in
#     cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
#     export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
#     *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
#   esac
# }
