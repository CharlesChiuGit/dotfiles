#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                              Exa Part                              #
######################################################################
if [[ -z $(command -v exa) ]]; then
    echo "Install Exa"
    cargo install --git https://github.com/ogham/exa
else
    printf "${tty_blue}Exa${tty_reset} is already installed, skip it.\n"
fi
