#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                              Xh Part                               #
######################################################################

if [[ -z $(command -v xh) ]]; then
    echo "Install xh"
    cargo install xh
else
    printf "${tty_blue}Xh${tty_reset} is already installed, skip it.\n"
fi
