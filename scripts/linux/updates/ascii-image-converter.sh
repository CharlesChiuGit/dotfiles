#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                    Update Ascii-image-converter                    #
######################################################################
printf "Update ${tty_blue}Ascii-image-converter...${tty_reset}\n"
rm -rf ~/go/bin/ascii-image-converter
go install github.com/TheZoraiz/ascii-image-converter@latest
printf "${tty_blue}Ascii-image-converter${tty_reset} updated to ${tty_green}latest${tty_reset}.\n"
