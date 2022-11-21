#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                           Update Lazygit                           #
######################################################################
printf "Update ${tty_blue}Lazygit...${tty_reset}\n"
rm -rf ~/go/bin/lazygit
go install github.com/jesseduffield/lazygit@latest
printf "${tty_blue}Lazygit${tty_reset} updated to ${tty_green}latest${tty_reset}.\n"
