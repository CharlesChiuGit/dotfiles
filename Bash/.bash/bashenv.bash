#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(2)
HISTSIZE=1001
HISTFILESIZE=2001

# Program languages PATH
export PATH="$PATH:$HOME/tools/golang/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/tools/java/bin"
export PATH="$PATH:$HOME/tools/julia/bin"
export PATH="$PATH:$HOME/tools/lua/src"
export PATH="$PATH:$HOME/tools/luajit/src"
export LUA_LIBRARY="$HOME/tools/luajit/src/libluajit.so"
export PATH="$PATH:$HOME/tools/luarocks"
export PATH="$PATH:$HOME/tools/nodejs/bin"
export PATH="$PATH:$HOME/tools/perl/bin"
export PERL_CPANM_HOME="$HOME/tools/cpanm"
export PATH="$PATH:$HOME/tools/php/bin"
export PATH="$PATH:$HOME/tools/ruby/bin"
[ -f ~/.cargo/env ] && source "$HOME/.cargo/env"

# Utility tools PATH
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/tools/btop/bin"
# export PATH="$PATH:$HOME/tools/chafa/bin"
export PATH="$PATH:$HOME/tools/cpufetch"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow'
export FZF_DEFAULT_OPTS='--ansi --height 40% --layout=reverse --border=double --border-label="╣ FZF ╠" --header="E to edit" --preview="pistol {}" --bind="E:execute(nvim {})" --preview-label="┓ ⟪Preview⟫ ┏" --preview-window=right,border-bold --color=border:#7ba46c,label:#7ba46c'
export FZF_CTRL_T_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"
export FZF_ALT_C_COMMAND='fd -H --type d . --color=never'
export FZF_ALT_C_OPTS="$FZF_DEFAULT_OPTS"
export PATH="$PATH:$HOME/tools/fzf/bin"
export PATH="$PATH:$HOME/tools/fzy"
export PATH="$PATH:$HOME/tools/lnav"
# export PATH="$PATH:$HOME/tools/magick/bin"
# export MAGICK_HOME="$HOME/tools/magick"
# export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$MAGICK_HOME/lib"
export PATH="$PATH:$HOME/tools/nvim/bin"
export PATH="$PATH:$HOME/tools/stow/bin"
export PATH="$PATH:$HOME/tools/tmux"
export PATH="$PATH:$HOME/tools/treesitter"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
export PATH="$PATH:$HOME/tools/ugrep/bin"
export PATH="$PATH:$HOME/tools/qfc/bin"
[ -f ~/.config/lf/icon.sh ] && source "$HOME/.config/lf/icon.sh"

## neovim support
export EDITOR='nvim'
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

## Init zoxide
# [ -x ~/tools/zoxide/zoxide ] && eval "$(zoxide init bash)" || echo "zoxide not found!"
eval "$(zoxide init bash)" || echo "zoxide not found!"

# Init Starship
# [ -x ~/tools/starship/starship ] && eval "$(starship init bash)" || echo "starship not found!"]
eval "$(starship init bash)" || echo "starship not found!"]

# Init qfc
[[ -s $HOME/tools/qfc/bin/qfc.sh ]] && source "$HOME/tools/qfc/bin/qfc.sh"
qfc_quick_command 'cd' '\C-b' "cd $0"
qfc_quick_command 'nvim' '\C-p' "nvim $0"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [ -f "$HOME/tools/anaconda/etc/profile.d/conda.sh" ]; then
	source "$HOME/tools/anaconda/etc/profile.d/conda.sh"
else
	export PATH="$HOME/tools/anaconda/bin:$PATH"
fi
# <<< conda initialize <<<
