#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Ripgrep Part                            #
######################################################################
# RIPGREP_DIR=$HOME/tools/ripgrep
# RIPGREP_SRC_NAME=$HOME/packages/ripgrep.tar.gz
# RIPGREP_LINK="https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz"
# if [[ -z $(command -v rg) ]] && [[ ! -f $RIPGREP_DIR/rg ]]; then
#     echo "Install ripgrep"
#     if [[ ! -f $RIPGREP_SRC_NAME ]]; then
#         echo "Downloading ripgrep and renaming"
#         wget $RIPGREP_LINK -O "$RIPGREP_SRC_NAME"
#     fi

#     if [[ ! -d $RIPGREP_DIR ]]; then
#         echo "Creating ripgrep directory under tools directory"
#         mkdir -p "$RIPGREP_DIR"
#         echo "Extracting to $HOME/tools/ripgrep directory"
#         tar zxvf "$RIPGREP_SRC_NAME" -C "$RIPGREP_DIR" --strip-components 1
#     fi

#     if [[ $ADD_TO_SYSTEM_PATH = true ]] && [[ $USE_BASH_SHELL = true ]]; then
#         echo "export PATH=\"$RIPGREP_DIR:\$PATH\"" >>"$HOME/.bashrc"
#         export PATH="$RIPGREP_DIR:$PATH"
#     fi

#     # set up manpath
#     if [[ -f $MAN_PATH/rg.1 ]]; then
#         rm "$MAN_PATH/rg.1"
#         cp "$HOME/tools/ripgrep/doc/rg.1" "$MAN_PATH"
#     else
#         cp "$HOME/tools/ripgrep/doc/rg.1" "$MAN_PATH"
#     fi

#     # if [[ $USE_BASH_SHELL = true ]]; then
#     #     echo 'export MANPATH=$HOME/tools/ripgrep/doc/man:$MANPATH' >>"$HOME/.bashrc"
#     # else
#     #     echo 'export MANPATH=$HOME/tools/ripgrep/doc/man:$MANPATH' >>"$HOME/.zshrc"
#     #     echo 'export FPATH=$HOME/tools/ripgrep/complete:$FPATH' >>"$HOME/.zshrc"
#     # fi
# else
#     printf "${tty_blue}Ripgrep${tty_reset} is already installed, skip it.\n"
# fi

if [[ -z $(command -v rg) ]]; then
    echo "Install Ripgrep"
    cargo install ripgrep
else
    printf "${tty_blue}Ripgrep${tty_reset} is already installed, skip it.\n"
fi
