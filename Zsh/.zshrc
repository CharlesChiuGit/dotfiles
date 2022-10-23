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
if which starship >/dev/null; then
	eval "$(starship init zsh)"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/tools/anaconda/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/tools/anaconda/etc/profile.d/conda.sh" ]; then
        . "$HOME/tools/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/tools/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
