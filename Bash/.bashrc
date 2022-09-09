#!/usr/bin/env bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
*)
  ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Custom bash functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Program languages PATH
export PATH="$PATH:$HOME/tools/anaconda/bin"
export PATH="$PATH:$HOME/tools/nodejs/bin"
export PATH="$PATH:$HOME/.plenv/bin"
## Init plenv
if which plenv > /dev/null; then
  eval "$(plenv init -)"
fi
eval export PATH="/home/ubuntu/.plenv/shims:${PATH}"
export PLENV_SHELL=bash
source '/home/ubuntu/.plenv/libexec/../completions/plenv.bash'

plenv() {
  local command

  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "`plenv "sh-$command" "$@"`";;
  *)
    command plenv "$command" "$@";;
  esac
}

export PATH="$PATH:$HOME/.rbenv/bin"
## Init rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init - bash)"
fi

[[ -s "$PATH:$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
export PATH="$PATH:$HOME/tools/jdk/bin"
export PATH="$PATH:$HOME/tools/julia/bin"
export PATH="$PATH:$HOME/tools/lua/src"
export PATH="$PATH:$HOME/tools/luajit/src"
export PATH="$PATH:$HOME/tools/luarocks"
export PATH="$PATH:$HOME/tools/php/bin"
export RUSTUP_HOME=$PATH:$HOME/tools/rustup
export CARGO_HOME=$PATH:$HOME/tools/cargo
. "$HOME/tools/cargo/env"

# Utility tools PATH
export PATH=$PATH:$HOME/tools/batcat
export PATH=$PATH:$HOME/tools/fdfind
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export PATH=$PATH:$HOME/tools/fzf
export PATH=$PATH:$HOME/tools/fzy
export PATH=$PATH:$HOME/tools/git-delta
export PATH=$PATH:$HOME/tools/glow
export PATH=$PATH:$HOME/tools/nvim
export PATH=$PATH:$HOME/tools/lazygit
export PATH=$PATH:$HOME/tools/lsd
export PATH=$PATH:$HOME/tools/ripgrep
export PATH=$PATH:$HOME/tools/tmux
export PATH=$PATH:$HOME/tools/treesitter
export PATH=$PATH:$HOME/tools/zoxide
## neovim support
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
## Init zoxide
if which zoxide > /dev/null; then
  eval "$(zoxide init bash)"
fi
# Init thefuck
if which thefuck > /dev/null; then
  # alias to fuck
  eval "$(thefuck --alias fuck)"
fi
# Init Starship
if which starship > /dev/null; then
  eval "$(starship init bash)"
fi
