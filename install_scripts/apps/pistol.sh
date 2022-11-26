#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Pistol Part                             #
######################################################################
# INFO: needed packages: libmagic, file, file-devel
PISTOL_LINK="https://github.com/doronbehar/pistol.git"
if [[ -z $(command -v pistol) ]]; then
    echo "Install Pistol"
    cd ~/tools
    git clone "$PISTOL_LINK" --depth=1
    cd ~/tools/pistol
    go mod tidy
    make
    make install
    cd ~/dotfiles/install_scripts/
else
    printf "${tty_blue}Pistol${tty_reset} is already installed, skip it.\n"
fi
