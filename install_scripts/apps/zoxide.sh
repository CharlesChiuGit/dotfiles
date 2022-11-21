#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Zoxide Part                             #
######################################################################
if [[ -z $(command -v zoxide) ]]; then
    echo "Install Zoxide"
    cargo install zoxide --locked
else
    printf "${tty_blue}Zoxide${tty_reset} is already installed, skip it.\n"
fi
