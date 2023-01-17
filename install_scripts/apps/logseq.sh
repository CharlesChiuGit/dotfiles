#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Logseq Part                             #
######################################################################
LS_DIR=$HOME/tools
LS_SRC_NAME=$HOME/packages/logseq.zip
LS_LINK="https://github.com/logseq/logseq/releases/download/0.8.16/Logseq-linux-x64-0.8.16.zip"
if [[ -z $(command -v Logseq) ]]; then
    echo "Install Logseq"
    if [[ ! -f $LS_SRC_NAME ]]; then
        echo "Downloading Logseq"
        wget "$LS_LINK" -O "$LS_SRC_NAME"
    fi

    echo "Extracting Logseq"
    unzip "$LS_SRC_NAME" -d "$LS_DIR"
    cd ~/dotfiles/install_scripts/

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
export PATH="$PATH:$HOME/tools/Logseq-linux-x64"
EOT
    fi
else
    printf "${tty_blue}Logseq${tty_reset} is already installed, skip it.\n"
fi
