#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Trashy Part                             #
######################################################################
# Url: https://github.com/oberblastmeister/trashy
if [[ -z $(command -v trash) ]]; then
    echo "Install Trashy"
    cargo install trashy
else
    printf "${tty_blue}Trashy${tty_reset} is already installed, skip it.\n"
fi
