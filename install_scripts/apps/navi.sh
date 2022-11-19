#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                             Navi Part                              #
######################################################################
if [[ -z $(command -v navi) ]]; then
    echo "Install Navi"
    cargo install navi --locked
else
    printf "${tty_blue}Navi${tty_reset} is already installed, skip it.\n"
fi
