# ENVs
typeset -U PATH path # make sure $PATH is unique
path=("$HOME/.local/bin" "$path[@]")
export PATH
{{{ zsh.homebrew_path }}}
export XDG_CONFIG_HOME="$HOME/.config" # analogous to /etc
export XDG_CACHE_HOME="$HOME/.cache" # analogous to /var/cache
export XDG_DATA_HOME="$HOME/.local/share" # analogous to /usr/share
export XDG_STATE_HOME="$HOME/.local/state" # analogous to /var/lib
export XDG_RUNTIME_DIR="{{{ zsh.xdg_runtime_dir }}}"
export HISTFILE="$XDG_STATE_HOME/sh_history/histfile"
export ZDOTDIR="$HOME"/.config/zsh
export LESSHISTFILE="$XDG_DATA_HOME/less/lesshst"
export LESSKEY="$XDG_DATA_HOME/less/lesskey"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export DVDCSS_CACHE="$XDG_CACHE_HOME/dvdcss"
export NODE_REPL_HISTORY=""
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PNPM_HOME="{{{ zsh.pnpm_path }}}"
export EDITOR='nvim'

add_path() {
    case ":${PATH}:" in
        *:"$*":*)
            ;;
    *)
        export PATH="$*:$PATH"
            ;;
    esac
}

autoload -Uz add_path
add_path "$CARGO_HOME/bin"
add_path "$PNPM_HOME"

