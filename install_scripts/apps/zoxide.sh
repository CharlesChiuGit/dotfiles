#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Zoxide Part                             #
######################################################################
ZOXIDE_MAN=$MAN_PATH/zoxide
if [[ -z $(command -v zoxide) ]]; then
    echo "Install Zoxide"
    cargo install zoxide --locked

    # # set up manpath
    # # for f in "$HOME"/tools/zoxide/man/man1/*; do cp "$f" "$HOME/.local/share/man/man1"; done
    # if [[ -d $MAN_PATH/zoxide ]]; then
    #     rm "$MAN_PATH/zoxide/*"
    #     cp "$HOME/tools/zoxide/man/man1/*" "$ZOXIDE_MAN"
    # else
    #     mkdir "$ZOXIDE_MAN"
    #     cp "$HOME/tools/zoxide/man/man1/*" "$ZOXIDE_MAN"
    # fi
else
    printf "${tty_blue}Zoxide${tty_reset} is already installed, skip it.\n"
fi
