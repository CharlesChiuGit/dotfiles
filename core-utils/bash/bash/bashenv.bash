#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(2)
HISTSIZE=1001
HISTFILESIZE=2001

# XDG PATH
export XDG_CONFIG_HOME="$HOME/.config"

# Program languages PATH
[ -f ~/.cargo/env ] && source "$HOME/.cargo/env"

# Utility tools PATH
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/tools/btop/bin"
export PATH="$PATH:$HOME/tools/cpufetch"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow'
export FZF_DEFAULT_OPTS='--ansi --height 40% --layout=reverse --border=double --border-label="╣ FZF ╠" --header="E to edit" --preview="pistol {}" --bind="E:execute(nvim {})" --preview-label="┓ ⟪Preview⟫ ┏" --preview-window=right,border-bold --color=border:#7ba46c,label:#7ba46c'
export FZF_CTRL_T_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"
export FZF_ALT_C_COMMAND='fd -H --type d . --color=never'
export FZF_ALT_C_OPTS="$FZF_DEFAULT_OPTS"
export PATH="$PATH:$HOME/tools/fzf/bin"
export PATH="$PATH:$HOME/tools/fzy"
export PATH="$PATH:$HOME/tools/lf"
export PATH="$PATH:$HOME/tools/lnav"
export PATH="$PATH:$HOME/tools/Logseq-linux-x64"
export PATH="$PATH:$HOME/tools/nvim/bin"
export PATH="$PATH:$HOME/tools/qfc/bin"
export PATH="$PATH:$HOME/tools/stow/bin"
export PATH="$PATH:$HOME/tools/tmux"
export PATH="$PATH:$HOME/tools/treesitter"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
export PATH="$PATH:$HOME/tools/ugrep/bin"
export PATH="$PATH:$HOME/tools/wezterm/usr/bin"
[ -f ~/.config/lf/icon.sh ] && source "$HOME/.config/lf/icon.sh"
export PISTOL_CHROMA_FORMATTER=terminal16m
export PISTOL_CHROMA_STYLE=monokai
export PATH="$PATH:$HOME/tools/logiops/build"
export PATH="$PATH:$HOME/tools/cider2/opt/cider2"

## Batcat for man & help
_distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }' | tr -d '"')
if [ "$_distro" = "void" ]; then
	export MANPAGER="batman"
else
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# usage: `help git`, `help git commit`, `help bat -h`
alias bathelp='bat --plain --language=help'
help() (
	set -o pipefail
	"$@" --help 2>&1 | bathelp
)

## neovim support
export EDITOR='nvim'
# export LC_ALL="en_US.UTF-8"
# export LANG="en_US.UTF-8"

## Truecolor support
# NOTE: https://github.com/termstandard/colors
# Don't change $TERM in your zshrc/bashrc!
# Setting $TERM in zshrc/bashrc add confusions when your terminal emulators cannot actually supoorts it.
case $TERM in screen-256color | tmux-256color | xterm-256color)
	# COLORTERM opts:no|yes|truecolor
	export COLORTERM=truecolor
	;;
vte*) ;;
esac

## Init zoxide
# [ -x ~/tools/zoxide/zoxide ] && eval "$(zoxide init bash)" || echo "zoxide not found!"
eval "$(zoxide init bash)" || echo "zoxide not found!"
export _ZO_EXCLUDE_DIRS="$HOME/.local"

# Init Starship
# [ -x ~/tools/starship/starship ] && eval "$(starship init bash)" || echo "starship not found!"]
eval "$(starship init bash)" || echo "starship not found!"]

# Init copilot-cli
eval "$(github-copilot-cli alias -- "$0")"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [ -f "$HOME/tools/anaconda/etc/profile.d/conda.sh" ]; then
	source "$HOME/tools/anaconda/etc/profile.d/conda.sh"
else
	export PATH="$HOME/tools/anaconda/bin:$PATH"
fi
# <<< conda initialize <<<

# Fcitx5 env
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export QT5_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GLFW_IM_MODULE=ibus

# Cuda env
export PATH=/usr/local/cuda-12/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-12/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# asdf version manager
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/plugins/java/set-java-home.bash"
