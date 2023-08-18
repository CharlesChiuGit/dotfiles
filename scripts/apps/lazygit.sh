#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Lazygit Part                            #
######################################################################
if [[ -z $(command -v lazygit) ]]; then
    echo "Install lazygit"
    go install github.com/jesseduffield/lazygit@latest
else
    printf "${tty_blue}Lazygit${tty_reset} is already installed, skip it.\n"
fi
