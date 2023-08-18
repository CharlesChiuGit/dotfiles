#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                             Update jq                              #
######################################################################
JQ_DIR=$HOME/tools/jq

printf "Fetch ${tty_blue}Jq${tty_reset} commits...\n"

cd "$JQ_DIR"
git fetch
status=$(check_git_update "")

if [[ $status = true ]]; then
    printf "Update ${tty_blue}Jq${tty_reset}\n"
    git pull
    git submodule update --init # if building from git to get oniguruma
    autoreconf -fi              # if building from git
    ./configure --with-oniguruma=builtin --disable-maintainer-mode
    make -j8
    make check
elif [[ $status = false ]]; then
    printf "${tty_blue}Jq${tty_reset} is up-to-date!\n"
fi

cd ~/dotfiles/install_scripts/
