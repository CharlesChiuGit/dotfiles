# ENVs
typeset -U PATH path # make sure $PATH is unique
path=("$HOME/.local/bin" "$path[@]")
export PATH
export XDG_CONFIG_HOME="$HOME/.config" # analogous to /etc
export XDG_CACHE_HOME="$HOME/.cache" # analogous to /var/cache
export XDG_DATA_HOME="$HOME/.local/share" # analogous to /usr/share
export XDG_STATE_HOME="$HOME/.local/state" # analogous to /var/lib
export XDG_RUNTIME_DIR="/run/user/$UID"
export HISTFILE="$XDG_STATE_HOME/sh_history/histfile"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export LESSHISTFILE="$XDG_DATA_HOME/less/lesshst"
export LESSKEY="$XDG_DATA_HOME/less/lesskey"
export DVDCSS_CACHE="$XDG_CACHE_HOME/dvdcss"
export NODE_REPL_HISTORY=""
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export ZDOTDIR="$HOME"/.config/zsh
export EDITOR='nvim'

# find out which distribution we are running on
LFILE="/etc/os-release"
MFILE="/System/Library/CoreServices/SystemVersion.plist"
if [[ -f $LFILE ]]; then
    _distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }' | tr -d '"')
elif [[ -f $MFILE ]]; then
    _distro="macos"
else
    echo "Unsupported distribution"
fi

if [ $_distro = "macos" ]; then 
    [ -d /opt/homebrew/bin/ ] && path=(/opt/homebrew/bin/ $path)
    export XDG_RUNTIME_DIR="~/Library/Caches/TemporaryItems"
fi
[ -f "$XDG_DATA_HOME"/cargo ] && source "$XDG_DATA_HOME"/cargo/env

# pnpm
if [ $_distro = "macos" ]; then
    export PNPM_HOME="$HOME/Library/pnpm"
else;
    export PNPM_HOME="$XDG_DATA_HOME/pnpm"
fi
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

## Truecolor support check
# NOTE: https://github.com/termstandard/colors
# Don't change $TERM in your zshrc/bashrc!
# Setting $TERM in zshrc/bashrc add confusions when your terminal emulators cannot actually supoorts it.
case $TERM in screen-256color | tmux-256color | xterm-256color)
        # COLORTERM opts:no|yes|truecolor
        export COLORTERM=truecolor
        ;;
    vte*) ;;
esac
