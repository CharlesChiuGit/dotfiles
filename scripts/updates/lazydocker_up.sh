#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                         Update Lazydocker                          #
######################################################################
printf "Update ${tty_blue}Lazydocker...${tty_reset}\n"
rm -rf ~/go/bin/lazydocker
go install github.com/jesseduffield/lazydocker@latest
printf "${tty_blue}Lazydocker${tty_reset} updated to ${tty_green}latest${tty_reset}.\n"
