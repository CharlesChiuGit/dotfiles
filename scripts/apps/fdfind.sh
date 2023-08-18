#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Fdfind Part                             #
######################################################################
if [[ -z $(command -v fd) ]]; then
    echo "Install Fdfind"
    cargo install fd-find --locked
else
    printf "${tty_blue}Fdfind${tty_reset} is already installed, skip it.\n"
fi
