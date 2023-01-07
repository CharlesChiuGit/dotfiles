#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                           Cpufetch Part                            #
######################################################################
CPUFETCH_DIR=$HOME/tools/cpufetch
CPUFETCH_LINK="https://github.com/Dr-Noob/cpufetch/releases/download/v1.03/cpufetch_x86-64_linux"
if [[ -z $(command -v cpufetch) ]]; then
    echo "Install cpufetch"

    if [[ ! -d $CPUFETCH_DIR ]]; then
        echo "Creating cpufetch directory under tools directory"
        mkdir -p "$CPUFETCH_DIR"
        echo "Download to $HOME/tools/cpufetch directory"
        wget "$CPUFETCH_LINK" -O "$CPUFETCH_DIR/cpufetch"
        chmod +x "$CPUFETCH_DIR/cpufetch"
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
export PATH="$PATH:$HOME/tools/cpufetch"
EOT
    fi
else
    printf "${tty_blue}Cpufetch${tty_reset} is already installed, skip it.\n"
fi
