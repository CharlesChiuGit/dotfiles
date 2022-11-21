#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Batcat Part                             #
######################################################################
if [[ -z $(command -v bat) ]]; then
    echo "Install batcat"
    cargo install bat --locked
else
    printf "${tty_blue}Batcat${tty_reset} is already installed, skip it.\n"
fi
