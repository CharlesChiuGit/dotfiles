#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                             Update fzf                             #
######################################################################
FZF_DIR=$HOME/tools/fzf

printf "Fetch ${tty_blue}Fzf${tty_reset} commits...\n"

cd "$FZF_DIR"
git fetch
status=$(check_git_update "")

if [[ $status = true ]]; then
    printf "Update ${tty_blue}Fzf${tty_reset}.\n"
    git pull
    ./install --bin --xdg --no-key-bindings --no-completion --no-update-rc --no-bash --no-zsh --no-fish
elif [[ $status = false ]]; then
    printf "${tty_blue}Fzf${tty_reset} is up-to-date!\n"
fi

cd ~/dotfiles/install_scripts/
