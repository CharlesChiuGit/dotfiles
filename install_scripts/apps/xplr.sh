#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                             Xplr Part                              #
######################################################################
if [[ -z $(command -v xplr) ]]; then
    echo "Install xplr"
    cargo install xplr --locked
else
    printf "${tty_blue}Xplr${tty_reset} is already installed, skip it.\n"
fi
