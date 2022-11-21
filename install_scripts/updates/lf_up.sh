#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                             Update Lf                              #
######################################################################
printf "Update ${tty_blue}Lf...${tty_reset}\n"
rm -rf ~/go/bin/lf
env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest
printf "${tty_blue}Lf${tty_reset} updated to ${tty_green}latest${tty_reset}.\n"
