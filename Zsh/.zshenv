#!/usr/bin/zsh

path=(~/.cargo/bin $path)
. "$HOME/.cargo/env"
path=(~/tools/nodejs/bin $path)
path=(~/tools/perl/bin $path)
export PERL_CPANM_HOME="$HOME/tools/cpanm"
path=(~/tools/ruby/bin $path)
path=(~/tools/golang/bin $path)
path=(~/go/bin $path)
path=(~/tools/jdk/bin $path)
path=(~/tools/julia/bin $path)
path=(~/tools/lua/src $path)
path=(~/tools/luajit/src $path)
path=(~/tools/luarocks $path)

path=(~/.local/bin $path)
path=(~/tools/starship $path)
path=(~/tools/sheldon $path)
path=(~/tools/ripgrep $path)
path=(~/tools/btop/bin $path)
path=(~/tools/batcat $path)
path=(~/tools/cpufetch $path)
path=(~/tools/fdfind $path)
path=(~/tools/fzf/bin $path)
export FZF_DEFAULT_OPTS='--ansi --height 40% --layout=reverse --border=double --border-label="╣ FZF ╠" --preview-label="┓ ⟪Preview⟫ ┏" --preview-window=right,border-bold --color=border:#7ba46c,label:#7ba46c'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
path=(~/tools/fzy $path)
path=(~/tools/git-delta $path)
path=(~/tools/glow $path)
path=(~/tools/lazygit $path)
path=(~/tools/ripgrep $path)
path=(~/tools/treesitter $path)
path=(~/tools/zoxide $path)
path=(~/tools/tmux $path)
export TERM='screen-256color'
path=(~/tools/stow/bin $path)
path=(~/tools/xplr $path)
path=(~/tools/dua-cli $path)
path=(~/tools/viu $path)
path=(~/tools/chafa $path)
path=(~/tools/ctpv $path)
path=(~/tools/lf $path)
if [ -f ~/.config/lf/icon.sh ]; then
    source "$HOME/.config/lf/icon.sh"
fi
path=(~/tools/lnav $path)
path=(~/tools/pistol $path)
path=(~/tools/ugrep/bin $path)
path=(~/tools/navi $path)
path=(~/tools/qfc/bin $path)
path=(~/tools/nvim/bin $path)
export EDITOR='nvim'

## neovim support
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
