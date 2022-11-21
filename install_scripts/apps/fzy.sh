#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                              Fzy Part                              #
######################################################################
FZY_DIR=$HOME/tools/fzy
FZY_SRC_NAME=$HOME/packages/fzy.tar.gz
FZY_LINK="https://github.com/jhawthorn/fzy/releases/download/1.0/fzy-1.0.tar.gz"
if [[ -z $(command -v fzy) ]] && [[ ! -f $FZY_DIR/fzy ]]; then
    echo "Install fzy"
    if [[ ! -f $FZY_SRC_NAME ]]; then
        echo "Downloading fzy and renaming"
        wget $FZY_LINK -O "$FZY_SRC_NAME"
    fi

    if [[ ! -d $FZY_DIR ]]; then
        echo "Creating fzy directory under tools directory"
        mkdir -p "$FZY_DIR"
        echo "Extracting to $HOME/tools/fzy directory"
        tar zxvf "$FZY_SRC_NAME" -C "$FZY_DIR" --strip-components 1
        make -C "$FZY_DIR"
        cd ~/dotfiles/install_scripts/
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
export PATH="$PATH:$HOME/tools/fzy"
EOT
    fi
else
    printf "${tty_blue}Fzy${tty_reset} is already installed, skip it.\n"
fi
