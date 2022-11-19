#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Dua-cli Part                            #
######################################################################
# DUA_DIR=$HOME/tools/dua-cli
# DUA_SRC_NAME=$HOME/packages/dua-cli.tar.gz
# DUA_LINK="https://github.com/Byron/dua-cli/releases/download/v2.18.0/dua-v2.18.0-x86_64-unknown-linux-musl.tar.gz"
# if [[ -z $(command -v dua) ]]; then
#     echo "Install dua-cli"
#     if [[ ! -f $DUA_SRC_NAME ]]; then
#         echo "Downloading xplr and renaming"
#         wget "$DUA_LINK" -O "$DUA_SRC_NAME"
#     fi

#     if [[ ! -d $DUA_DIR ]]; then
#         echo "Creating dua directory under tools directory"
#         mkdir -p "$DUA_DIR"
#         echo "Extracting to $HOME/tools/dua directory"
#         tar zxvf "$DUA_SRC_NAME" -C "$DUA_DIR" --strip-components 1

#     fi

#     if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
#         cat <<EOT >>"$RC_FILE"
# export PATH="$PATH:$HOME/tools/dua-cli"
# EOT
#     fi
# else
#     printf "${tty_blue}Dua-cli${tty_reset} is already installed, skip it.\n"
# fi

if [[ -z $(command -v dua) ]]; then
    echo "Install Dua-cli"
    cargo install dua-cli --locked
else
    printf "${tty_blue}Dua-cli${tty_reset} is already installed, skip it.\n"
fi
