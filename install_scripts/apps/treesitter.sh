#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                          Tree-sitter Part                          #
######################################################################
TS_DIR=$HOME/tools/treesitter
TS_SRC_NAME=$HOME/packages/tree-sitter-linux-x64.gz
TS_LINK="https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.7/tree-sitter-linux-x64.gz"
if [[ -z $(command -v tree-sitter) ]] && [[ ! -f $TS_DIR/tree-sitter ]]; then
    echo "Install treesitter"
    if [[ ! -f $TS_SRC_NAME ]]; then
        echo "Downloading treesitter and renaming"
        wget "$TS_LINK" -P "$HOME/packages"
    fi

    if [[ ! -d $TS_DIR ]]; then
        echo "Creating tree-sitter directory under tools directory"
        mkdir -p "$TS_DIR"
        echo "Extracting to $HOME/tools/treesitter directory"
        gunzip "$TS_SRC_NAME"
        mv "$HOME/packages/tree-sitter-linux-x64" "$TS_DIR/tree-sitter"
        chmod u+x "$TS_DIR/tree-sitter"
    fi

    if [[ $ADD_TO_SYSTEM_PATH = true ]] && [[ $USE_BASH_SHELL = true ]]; then
        echo "export PATH=\"$TS_DIR:\$PATH\"" >>"$HOME/.bashrc"
        export PATH="$TS_DIR:$PATH"
    fi
    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
export PATH="$PATH:$HOME/tools/treesitter"
EOT
    fi

else
    printf "${tty_blue}Tree-sitter${tty_reset} is already installed, skip it.\n"
fi
