#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Batcat Part                             #
######################################################################
# BATCAT_DIR=$HOME/tools/batcat
# BATCAT_SRC_NAME=$HOME/packages/batcat.tar.gz
# BATCAT_LINK="https://github.com/sharkdp/bat/releases/download/v0.22.1/bat-v0.22.1-x86_64-unknown-linux-musl.tar.gz"
# if [[ -z $(command -v bat) ]] && [[ ! -f $BATCAT_DIR/bat ]]; then
#     echo "Install batcat"
#     if [[ ! -f $BATCAT_SRC_NAME ]]; then
#         echo "Downloading batcat and renaming"
#         wget $BATCAT_LINK -O "$BATCAT_SRC_NAME"
#     fi

#     if [[ ! -d $BATCAT_DIR ]]; then
#         echo "Creating batcat directory under tools directory"
#         mkdir -p "$BATCAT_DIR"
#         echo "Extracting to $HOME/tools/batcat directory"
#         tar zxvf "$BATCAT_SRC_NAME" -C "$BATCAT_DIR" --strip-components 1
#     fi

#     if [[ $ADD_TO_SYSTEM_PATH = true ]] && [[ $USE_BASH_SHELL = true ]]; then
#         echo "export PATH=\"$BATCAT_DIR:\$PATH\"" >>"$HOME/.bashrc"
#         export PATH="$BATCAT_DIR:$PATH"
#     fi

#     # set up manpath
#     if [[ -f $MAN_PATH/bat.1 ]]; then
#         rm "$MAN_PATH/bat.1"
#         cp "$HOME/tools/batcat/bat.1" "$MAN_PATH"
#     else
#         cp "$HOME/tools/batcat/bat.1" "$MAN_PATH"
#     fi

# else
#     printf "${tty_blue}Batcat${tty_reset} is already installed, skip it.\n"
# fi

if [[ -z $(command -v bat) ]]; then
    echo "Install batcat"
    cargo install bat --locked
else
    printf "${tty_blue}Batcat${tty_reset} is already installed, skip it.\n"
fi
