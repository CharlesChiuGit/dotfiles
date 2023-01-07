#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                           Update pistol                            #
######################################################################
PISTOL_DIR=$HOME/tools/pistol/

printf "Fetch ${tty_blue}Pistol${tty_reset} commits...\n"

cd "$PISTOL_DIR"
git fetch
status=$(check_git_update "")

if [[ $status = true ]]; then
    printf "Update ${tty_blue}Pistol${tty_reset}.\n"
    cd ~/tools/pistol
    git pull
    go install github.com/doronbehar/pistol/cmd/pistol@latest
elif [[ $status = false ]]; then
    printf "${tty_blue}Pistol${tty_reset} is up-to-date!\n"
fi

cd ~/dotfiles/install_scripts/
