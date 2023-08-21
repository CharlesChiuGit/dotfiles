#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                              Viu Part                              #
######################################################################
if [[ -z $(command -v viu) ]]; then
    echo "Install viu"
    cargo install viu
else
    printf "${tty_blue}Viu${tty_reset} is already installed, skip it.\n"
fi
