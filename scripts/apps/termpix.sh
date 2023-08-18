#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Termpix Part                            #
######################################################################
if [[ -z $(command -v termpix) ]]; then
    echo "Install Termpix"
    cargo install --git https://github.com/mmacedoeu/termpix
else
    printf "${tty_blue}Termpix${tty_reset} is already installed, skip it.\n"
fi
