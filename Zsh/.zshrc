#!/usr/bin/zsh
# # Lines configured by zsh-newuser-install
# HISTFILE=~/.histfile
# HISTSIZE=1000
# SAVEHIST=1000
# setopt extendedglob nomatch notify
# unsetopt autocd beep
# bindkey -v
# # End of lines configured by zsh-newuser-install
# # The following lines were added by compinstall
# zstyle :compinstall filename "$HOME/.zshrc"

# autoload -Uz compinit
# compinit
# # End of lines added by compinstall

[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh
[[ -f ~/.zsh/wsl2fix.zsh ]] && source ~/.zsh/wsl2fix.zsh

# Init zoxide
if which zoxide >/dev/null; then
    eval "$(zoxide init zsh)"
fi

# Init Starship
if which zoxide >/dev/null; then
    eval "$(starship init zsh)"
fi

# Init shelden
if which sheldon >/dev/null; then
    eval "$(sheldon source)"
fi
bindkey '^[[a' history-substring-search-up
bindkey '^[[b' history-substring-search-down
bindkey ',' autosuggest-accept

# Init qfc
[[ -s $HOME/tools/qfc/bin/qfc.sh ]] && source "$HOME/tools/qfc/bin/qfc.sh"
qfc_quick_command 'cd' '\C-b' 'cd $0'
qfc_quick_command 'nvim' '\C-p' 'nvim $0'

# >>> conda initialize >>>
if [ -f $HOME/tools/anaconda/etc/profile.d/conda.sh ]; then
    . "$HOME/tools/anaconda/etc/profile.d/conda.sh"
else
    export PATH="$HOME/tools/anaconda/bin:$PATH"
fi
# <<< conda initialize <<<
