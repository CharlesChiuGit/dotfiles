#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                             Ugrep Part                             #
######################################################################
UGREP_DIR=$HOME/tools/ugrep
UGREP_LINK="https://github.com/Genivia/ugrep.git"
if [[ -z $(command -v ugrep) ]]; then
    echo "Install ugrep"

    if [[ ! -d $UGREP_DIR ]]; then
        echo "Creating ugrep directory under tools directory"
        mkdir -p "$UGREP_DIR"
        echo "git clone to $HOME/tools/ugrep directory"
        git clone --depth=1 "$UGREP_LINK" "$UGREP_DIR"
        cd "$UGREP_DIR"
        # INFO: build options: https://github.com/Genivia/ugrep#other-platforms-step-3-build
        ./build.sh --enable-hidden --enable-pretty
        cd ~/dotfiles/install_scripts/
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
export PATH="$PATH:$HOME/tools/ugrep/bin"
EOT
    fi
else
    printf "${tty_blue}Ugrep${tty_reset} is already installed, skip it.\n"
fi
