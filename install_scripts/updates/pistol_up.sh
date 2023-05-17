#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                           Update pistol                            #
######################################################################
printf "Update ${tty_blue}Pistol...${tty_reset}\n"
rm -rf ~/go/bin/pistol
go install github.com/doronbehar/pistol/cmd/pistol@latest
printf "${tty_blue}pistol${tty_reset} updated to ${tty_green}latest${tty_reset}.\n"
