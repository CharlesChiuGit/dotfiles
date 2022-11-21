#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Update Glow                             #
######################################################################
printf "Update ${tty_blue}Glow...${tty_reset}\n"
rm -rf ~/go/bin/glow
go install github.com/charmbracelet/glow@latest
printf "${tty_blue}Glow${tty_reset} updated to ${tty_green}latest${tty_reset}.\n"
