HISTSIZE=1000
SAVEHIST=1000
HISTTIMEFORMAT="[%F %T] "
setopt extendedglob nomatch notify nobeep autocd
setopt hist_ignore_dups hist_ignore_all_dups hist_expire_dups_first hist_find_no_dups hist_reduce_blanks hist_save_no_dups
setopt INC_APPEND_HISTORY

# Load and initialise completion system
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
fpath[1,0]=~/.config/zsh/completion/ # local comp files
autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
# End of lines added by compinstall

# Core Keybinds
bindkey -v
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[2~"  vi-insert
bindkey  "^[[3~"  delete-char

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-history-substring-search"
plug "zsh-users/zsh-syntax-highlighting"
plug "Aloxaf/fzf-tab"
plug "hlissner/zsh-autopair"
plug "zap-zsh/sudo"
plug "MichaelAquilina/zsh-you-should-use"

# use zap to source local files
plug "$XDG_CONFIG_HOME/zsh/aliasrc"
plug "$XDG_CONFIG_HOME/zsh/fzf.zsh"
plug "$XDG_CONFIG_HOME/zsh/fzf-tab.zsh"

# Plugin Keybinds
bindkey '^[[a' history-substring-search-up
bindkey '^[[b' history-substring-search-down
bindkey ',' autosuggest-accept

# Init mise
eval "$(mise activate zsh)"

# Init zoxide
eval "$(zoxide init zsh)"
export _ZO_DATA_DIR="$XDG_DATA_HOME"/zoxide
export _ZO_EXCLUDE_DIRS="$XDG_CACHE_HOME;$XDG_DATA_HOME;$XDG_STATE_HOME"

# Init Starship
eval "$(starship init zsh)"
