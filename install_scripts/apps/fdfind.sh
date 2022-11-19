#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Fdfind Part                             #
######################################################################
# FDFIND_DIR=$HOME/tools/fdfind
# FDFIND_SRC_NAME=$HOME/packages/fdfind.tar.gz
# FDFIND_LINK="https://github.com/sharkdp/fd/releases/download/v8.5.3/fd-v8.5.3-x86_64-unknown-linux-musl.tar.gz"
# if [[ -z $(command -v fd) ]] && [[ ! -f $FDFIND_DIR/fd ]]; then
#     echo "Install fdfind"
#     if [[ ! -f $FDFIND_SRC_NAME ]]; then
#         echo "Downloading fdfind and renaming"
#         wget $FDFIND_LINK -O "$FDFIND_SRC_NAME"
#     fi

#     if [[ ! -d $FDFIND_DIR ]]; then
#         echo "Creating fdfind directory under tools directory"
#         mkdir -p "$FDFIND_DIR"
#         echo "Extracting to $HOME/tools/fdfind directory"
#         tar zxvf "$FDFIND_SRC_NAME" -C "$FDFIND_DIR" --strip-components 1
#     fi

#     if [[ $ADD_TO_SYSTEM_PATH = true ]] && [[ $USE_BASH_SHELL = true ]]; then
#         echo "export PATH=\"$FDFIND_DIR:\$PATH\"" >>"$HOME/.bashrc"
#         export PATH="$FDFIND_DIR:$PATH"
#     fi

#     # set up manpath
#     if [[ -f $MAN_PATH/fd.1 ]]; then
#         rm "$MAN_PATH/fd.1"
#         cp "$HOME/tools/fdfind/fd.1" "$MAN_PATH"
#     else
#         cp "$HOME/tools/fdfind/fd.1" "$MAN_PATH"
#     fi

# else
#     printf "${tty_blue}Fdfind${tty_reset} is already installed, skip it.\n"
# fi

if [[ -z $(command -v fd) ]]; then
    echo "Install Fdfind"
    cargo install fd-find --locked
else
    printf "${tty_blue}Fdfind${tty_reset} is already installed, skip it.\n"
fi
