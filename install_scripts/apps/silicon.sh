#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Silicon Part                            #
######################################################################
if [[ -z $(command -v silicon) ]]; then
    echo "Install Silicon"
    cargo install --git https://github.com/aloxaf/silicon
else
    printf "${tty_blue}Silicon${tty_reset} is already installed, skip it.\n"
fi
