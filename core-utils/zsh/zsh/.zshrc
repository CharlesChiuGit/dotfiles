# Lines configured by zsh-newuser-install
if [ ! -d ~/.local/state/sh_history ] ; then
  mkdir ~/.local/state/sh_history
fi
export HISTFILE=~/.local/state/sh_history/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch notify nobeep autocd
setopt hist_ignore_dups hist_ignore_all_dups hist_expire_dups_first hist_find_no_dups hist_reduce_blanks hist_save_no_dups
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"
fpath[1,0]=~/.config/zsh/completion/ # local comp files
autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
# End of lines added by compinstall

# rcfiles
rcfiles=(
    "$XDG_CONFIG_HOME"/zsh/aliasrc
    "$XDG_CONFIG_HOME"/zsh/fzf.zsh
    "$XDG_CONFIG_HOME"/zsh/fzf-tab.zsh
)
for rcfile in $rcfiles; do
    if [ -f "$rcfile" ]; then
        source "$rcfile"
    fi
done

# Init rtx-vm
eval "$(rtx activate zsh)"

# Init zoxide
eval "$(zoxide init zsh)"
export _ZO_EXCLUDE_DIRS="$HOME/.local"

# Init Starship
eval "$(starship init zsh)"

# Init shelden
eval "$(sheldon source)"
bindkey '^[[a' history-substring-search-up
bindkey '^[[b' history-substring-search-down
bindkey ',' autosuggest-accept

# Keybinds
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[2~"  vi-insert
bindkey  "^[[3~"  delete-char
