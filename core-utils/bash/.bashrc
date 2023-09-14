#!/usr/bin/env bash

# Custom env and aliases
[[ -f ~/.bash/bashenv.bash ]] && source "$HOME/.bash/bashenv.bash"
[[ -f ~/.bash/aliases.bash ]] && source "$HOME/.bash/aliases.bash"
[[ -f ~/.bash/starship.bash ]] && source "$HOME/.bash/starship.bash"
# [[ -f ~/.bash/wayland.bash ]] && source "$HOME/.bash/wayland.bash"

export BASH_COMPLETION_USER_FILE="$XDG_CONFIG_HOME"/bash/completion
