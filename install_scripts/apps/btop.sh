#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Btop++ Part                             #
######################################################################
BTOP_DIR=$HOME/tools/btop
BTOP_SRC_NAME=$HOME/packages/btop.tbz
BTOP_LINK="https://github.com/aristocratos/btop/releases/download/v1.2.13/btop-x86_64-linux-musl.tbz"
if [[ -z $(command -v btop) ]]; then
    echo "Install btop"
    if [[ ! -f $BTOP_SRC_NAME ]]; then
        echo "Downloading btop and renaming"
        wget $BTOP_LINK -O "$BTOP_SRC_NAME"
    fi

    if [[ ! -d $BTOP_DIR ]]; then
        # echo "Creating btop directory under tools directory"
        # mkdir -p "$BTOP_DIR"
        echo "Extracting to $HOME/tools/btop directory"
        tar xjvf "$BTOP_SRC_NAME" -C "$HOME/tools"
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
export PATH="$PATH:$HOME/tools/btop/bin"
EOT
    fi

else
    printf "${tty_blue}Btop++${tty_reset} is already installed, skip it.\n"
fi
