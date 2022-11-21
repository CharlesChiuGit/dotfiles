#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Update Ugrep                            #
######################################################################
UGREP_DIR=$HOME/tools/ugrep

printf "Fetch ${tty_blue}Ugrep${tty_reset} commits...\n"

cd "$UGREP_DIR"
git fetch
status=$(check_git_update "")

if [[ $status = true ]]; then
    printf "Update ${tty_blue}Ugrep${tty_reset}.\n"
    git pull
    ./build.sh --enable-hidden --enable-pretty
elif [[ $status = false ]]; then
    printf "${tty_blue}Ugrep${tty_reset} is up-to-date!\n"
fi

cd ~/dotfiles/install_scripts/
