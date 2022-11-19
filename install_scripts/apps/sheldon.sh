#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Sheldon Part                            #
######################################################################
if [[ -z $(command -v sheldon) ]]; then
    echo "Install Sheldon"
    cargo install sheldon --locked
else
    printf "${tty_blue}Sheldon${tty_reset} is already installed, skip it.\n"
fi
