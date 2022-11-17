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

path=(~/.cargo/bin $path)
[ -f ~/.cargo/env ] && source "$HOME/.cargo/env"
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
path=(~/tools/stow/bin $path)
path=(~/tools/xplr $path)
path=(~/tools/dua-cli $path)
path=(~/tools/viu $path)
path=(~/tools/magick/bin $path)
export MAGICK_HOME="$HOME/tools/magick"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$MAGICK_HOME/lib"
path=(~/tools/chafa/bin $path)
path=(~/tools/ctpv $path)
path=(~/tools/lf $path)
[ -f ~/.config/lf/icon.sh ] && source "$HOME/.config/lf/icon.sh"
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

# Init zoxide
# [ -x ~/tools/zoxide/zoxide ] && eval "$(zoxide init zsh)" || echo "zoxide not found!"
eval "$(zoxide init zsh)" || echo "zoxide not found!"

# Init Starship
# [ -x ~/tools/starship/starship ] && eval "$(starship init zsh)" || echo "starship not found!"]
eval "$(starship init zsh)" || echo "starship not found!"]

# Init shelden
# [ -x  ~/tools/sheldon/sheldon ] && eval "$(sheldon source)" || echo "sheldon not found!"
eval "$(sheldon source)" || echo "sheldon not found!"
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
