#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                           Starship Part                            #
######################################################################
if [[ -z $(command -v starship) ]]; then
    echo "Install starship"
    cargo install starship --locked
else
    printf "${tty_blue}Starship${tty_reset} is already installed, skip it.\n"
fi
