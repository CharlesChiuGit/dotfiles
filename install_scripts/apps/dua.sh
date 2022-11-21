#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Dua-cli Part                            #
######################################################################
if [[ -z $(command -v dua) ]]; then
    echo "Install Dua-cli"
    cargo install dua-cli --locked
else
    printf "${tty_blue}Dua-cli${tty_reset} is already installed, skip it.\n"
fi
