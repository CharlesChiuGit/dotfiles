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

# Custom env and aliases
[[ -f ~/.bash/aliases.bash ]] && source "$HOME/.bash/aliases.bash"
[[ -f ~/.bash/bashenv.bash ]] && source "$HOME/.bash/bashenv.bash"
[[ -f ~/.bash/starship.bash ]] && source "$HOME/.bash/starship.bash"
