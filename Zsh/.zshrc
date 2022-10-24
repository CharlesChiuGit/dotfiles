#!/usr/bin/zsh
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch notify
unsetopt autocd beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Custom zsh aliases
if [ -f ~/.zsh_aliases ]; then
    . "$HOME/.zsh_aliases"
fi

# Custom zsh functions
if [ -f ~/.zsh_functions ]; then
    . "$HOME/.zsh_functions"
fi

## Init zoxide
if which zoxide >/dev/null; then
	eval "$(zoxide init zsh)"
fi

# Init Starship
eval "$(starship init zsh)"

## Init shelden
eval "$(sheldon source)"
bindkey '^[[a' history-substring-search-up
bindkey '^[[b' history-substring-search-down
bindkey ',' autosuggest-accept

# >>> conda initialize >>>
if [ -f "$HOME/tools/anaconda/etc/profile.d/conda.sh" ]; then
    . "$HOME/tools/anaconda/etc/profile.d/conda.sh"
else
    export PATH="$HOME/tools/anaconda/bin:$PATH"
fi
# <<< conda initialize <<<
