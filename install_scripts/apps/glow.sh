#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                             Glow Part                              #
######################################################################
if [[ -z $(command -v glow) ]]; then
    go install github.com/charmbracelet/glow@latest

else
    printf "${tty_blue}Glow${tty_reset} is already installed, skip it.\n"
fi
