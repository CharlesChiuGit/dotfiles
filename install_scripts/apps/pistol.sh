#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Pistol Part                             #
######################################################################
PISTOL_LINK="https://github.com/junegunn/fzf.git"
if [[ -z $(command -v pistol) ]]; then
    cd ~/tools
    git clone "$PISTOL_LINK" --depth=1
    cd ~/tools/pistol
    go install github.com/doronbehar/pistol/cmd/pistol@latest
    cd ~/dotfiles/install_scripts/
else
    printf "${tty_blue}Pistol${tty_reset} is already installed, skip it.\n"
fi
