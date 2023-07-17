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

fpath[1,0]=~/.zsh/completion/ # local comp files
autoload -Uz compinit && compinit
# End of lines added by compinstall

# XDG PATH
export XDG_CONFIG_HOME="$HOME/.config"

# Program languages PATH
path=(~/tools/perl/bin $path)
export PERL_CPANM_HOME="$HOME/tools/cpanm"
[ -f ~/.cargo/env ] && source "$HOME/.cargo/env"

# Utility tools PATH
path=(~/.local/bin $path)
path=(~/tools/btop/bin $path)
path=(~/tools/cpufetch $path)
path=(~/tools/fzf/bin $path)
path=(~/tools/fzy $path)
path=(~/tools/lf $path)
path=(~/tools/lnav $path)
path=(~/tools/Logseq-linux-x64 $path)
path=(~/tools/nvim/bin $path)
path=(~/tools/qfc/bin $path)
path=(~/tools/stow/bin $path)
path=(~/tools/tmux $path)
path=(~/tools/treesitter $path)
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
path=(~/tools/ugrep/bin $path)
[ -f ~/.config/lf/icon.sh ] && source "$HOME/.config/lf/icon.sh"
export PISTOL_CHROMA_FORMATTER=terminal16m
export PISTOL_CHROMA_STYLE=monokai
path=(~/tools/wezterm/target/release $path)
path=(~/tools/logiops/build $path)
path=(~/tools/cider2/opt/cider2 $path)
path=(~/.asdf/installs/golang/1.20.5/packages/bin $path)

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

# Init zoxide
# [ -x ~/tools/zoxide/zoxide ] && eval "$(zoxide init zsh)" || echo "zoxide not found!"
eval "$(zoxide init zsh)" || echo "zoxide not found!"
export _ZO_EXCLUDE_DIRS="$HOME/.local"

# Init Starship
# [ -x ~/tools/starship/starship ] && eval "$(starship init zsh)" || echo "starship not found!"]
eval "$(starship init zsh)" || echo "starship not found!"]

# Init shelden
# [ -x  ~/tools/sheldon/sheldon ] && eval "$(sheldon source)" || echo "sheldon not found!"
eval "$(sheldon source)" || echo "sheldon not found!"
bindkey '^[[a' history-substring-search-up
bindkey '^[[b' history-substring-search-down
bindkey ',' autosuggest-accept

# # Init qfc
# [[ -s $HOME/tools/qfc/bin/qfc.sh ]] && source "$HOME/tools/qfc/bin/qfc.sh"
# qfc_quick_command 'cd' '\C-b' "cd $0"
# qfc_quick_command 'nvim' '\C-p' "nvim $0"

# Init copilot-cli
# eval "$(github-copilot-cli alias -- "$0")"

# >>> conda initialize >>>
if [ -f $HOME/tools/anaconda/etc/profile.d/conda.sh ]; then
    source "$HOME/tools/anaconda/etc/profile.d/conda.sh"
else
    path=(~/tools/anaconda/bin $path)
fi
# <<< conda initialize <<<

# Fcitx5 env
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export QT5_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GLFW_IM_MODULE=ibus

# Custom env and aliases
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/asdf.sh ]] && source ~/.zsh/asdf.sh
[[ -f ~/.zsh/keybind.zsh ]] && source ~/.zsh/keybind.zsh
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh
[[ -f ~/.zsh/fzf.zsh ]] && source ~/.zsh/fzf.zsh
[[ -f ~/.zsh/fzf-tab.zsh ]] && source ~/.zsh/fzf-tab.zsh
[[ -f ~/.zsh/wsl2fix.zsh ]] && source ~/.zsh/wsl2fix.zsh
# [[ -f ~/.bash/wayland.zsh ]] && source ~/.zsh/wayland.zsh

# asdf version manager
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/plugins/golang/set-env.zsh"
. "$HOME/.asdf/plugins/java/set-java-home.zsh"
