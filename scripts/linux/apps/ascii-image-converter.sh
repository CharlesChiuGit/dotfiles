#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                     Ascii-image-converter Part                     #
######################################################################
if [[ -z $(command -v ascii-image-converter) ]]; then
    echo "Install ascii-image-converter"
    go install github.com/TheZoraiz/ascii-image-converter@latest
else
    printf "${tty_blue}Ascii-image-converter${tty_reset} is already installed, skip it.\n"
fi
