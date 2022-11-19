#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                           Golang Install                           #
######################################################################
GO_DIR=$HOME/tools/golang
GO_SRC_NAME=$HOME/packages/golang.tar.gz
GO_LINK="https://go.dev/dl/go1.19.3.linux-amd64.tar.gz"
# if [[ -z "$(command -v go)" ]] && [[ ! -f "$GO_DIR/bin/go" ]]; then
if [[ ! -f "$GO_DIR/bin/go" ]]; then
    echo "Install Golang"
    if [[ ! -f $GO_SRC_NAME ]]; then
        echo "Downloading go and renaming"
        wget $GO_LINK -O "$GO_SRC_NAME"
    fi

    if [[ ! -d "$GO_DIR" ]]; then
        echo "Creating golang directory under tools directory"
        mkdir -p "$GO_DIR"
        echo "Extracting to $HOME/tools/golang directory"
        tar xvf "$GO_SRC_NAME" -C "$GO_DIR" --strip-components 1
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
alias go='~/tools/golang/bin/go'
export PATH="$PATH:$HOME/tools/golang/bin"
export PATH="$PATH:$HOME/go/bin"
EOT
    fi
else
    printf "${tty_blue}Golang${tty_reset} is already installed, skip it.\n"
fi
