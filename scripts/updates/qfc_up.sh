#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                             Update Qfc                             #
######################################################################
QFC_DIR=$HOME/tools/qfc

printf "Fetch ${tty_blue}Qfc${tty_reset} commits...\n"

cd "$QFC_DIR"
git fetch
status=$(check_git_update "")

if [[ $status = true ]]; then
    printf "Update ${tty_blue}Qfc${tty_reset}.\n"
    git pull
elif [[ $status = false ]]; then
    printf "${tty_blue}Qfc${tty_reset} is up-to-date!\n"
fi

cd ~/dotfiles/install_scripts/
