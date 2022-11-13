#!/usr/bin/env bash
# shellcheck disable=SC1090,SC1091

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(2)
HISTSIZE=1001
HISTFILESIZE=2001

# make less more friendly for non-text input files, see lesspipe(2)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

[[ -f ~/.bash/aliases.bash ]] && source "$HOME/.bash/aliases.bash"
[[ -f ~/.bash/bashenv.bash ]] && source "$HOME/.bash/bashenv.bash"
[[ -f ~/.bash/starship.bash ]] && source "$HOME/.bash/starship.bash"

# Custom bash-completion
# if [ -d ~/.local/share/bash-completion ]; then
#     for f in ~/.local/share/bash-completion/*.bash; do source "$f"; done
# fi

## Init zoxide
# if which zoxide >/dev/null; then
#     eval "$(zoxide init bash)"
# fi
[[ -z $(command -v zoxide) ]] && eval "$(zoxide init bash)" || echo "zoxide not found!"
# Init Starship
# if which starship >/dev/null; then
#     eval "$(starship init bash)"
# fi
[[ -z $(command -v starship) ]] && eval "$(starship init bash)" || echo "starship not found!"]

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [ -f "$HOME/tools/anaconda/etc/profile.d/conda.sh" ]; then
	. "$HOME/tools/anaconda/etc/profile.d/conda.sh"
else
	export PATH="$HOME/tools/anaconda/bin:$PATH"
fi
# <<< conda initialize <<<
