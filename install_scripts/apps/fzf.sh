#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                              Fzf Part                              #
######################################################################
FZF_DIR=$HOME/tools/fzf
FZF_LINK="https://github.com/junegunn/fzf.git"
if [[ -z $(command -v fzf) ]]; then
    echo "Install fzf"

    if [[ ! -d $FZF_DIR ]]; then
        echo "Creating fzf directory under tools directory"
        mkdir -p "$FZF_DIR"
        echo "git clone to $HOME/tools/fzf directory"
        cd "$HOME/tools"
        git clone "$FZF_LINK" --depth=1
        cd "$FZF_DIR"
        ./install --bin --xdg --no-key-bindings --no-completion --no-update-rc --no-bash --no-zsh --no-fish
        cd ~/dotfiles/install_scripts/
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
export FZF_DEFAULT_OPTS='--ansi --height 40% --layout=reverse --border=double --border-label="╣ FZF ╠" --preview-label="┓ ⟪Preview⟫ ┏" --preview-window=right,border-bold --color=border:#7ba46c,label:#7ba46c'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"
export FZF_ALT_C_COMMAND='fd -H --type d . --color=never'
export FZF_ALT_C_OPTS="$FZF_DEFAULT_OPTS"
export PATH="$PATH:$HOME/tools/fzf/bin"
EOT
    fi
else
    printf "${tty_blue}Fzf${tty_reset} is already installed, skip it.\n"
fi
