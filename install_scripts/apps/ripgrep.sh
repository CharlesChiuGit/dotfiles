#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Ripgrep Part                            #
######################################################################
if [[ -z $(command -v rg) ]]; then
    echo "Install Ripgrep"
    cargo install ripgrep
else
    printf "${tty_blue}Ripgrep${tty_reset} is already installed, skip it.\n"
fi
