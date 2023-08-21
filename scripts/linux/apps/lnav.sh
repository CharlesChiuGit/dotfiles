#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                             Lnav Part                              #
######################################################################
LNAV_DIR=$HOME/tools/lnav
LNAV_SRC_NAME=$HOME/packages/lnav.zip
LNAV_LINK="https://github.com/tstack/lnav/releases/download/v0.11.1/lnav-0.11.1-x86_64-linux-musl.zip"
if [[ -z $(command -v lnav) ]]; then
    echo "Install lnav"
    if [[ ! -f $LNAV_SRC_NAME ]]; then
        echo "Downloading lnav and renaming"
        wget "$LNAV_LINK" -O "$LNAV_SRC_NAME"
    fi

    if [[ ! -d $LNAV_DIR ]]; then
        echo "Creating lnav directory under tools directory"
        mkdir -p "$LNAV_DIR"
        unzip "$LNAV_SRC_NAME" -d "$LNAV_DIR"
        for f in "$LNAV_DIR"/lnav-*/*; do cp "$f" "$LNAV_DIR"; done
        rm -r "$LNAV_DIR"/lnav-*
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
export PATH="$PATH:$HOME/tools/lnav"
EOT
    fi

else
    printf "${tty_blue}Lnav${tty_reset} is already installed, skip it.\n"
fi
