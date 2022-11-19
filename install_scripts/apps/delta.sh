#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                           Git-delta Part                           #
######################################################################
# Url: https://github.com/dandavison/delta
if [[ -z $(command -v delta) ]] && [[ ! -f $GITDELTA_DIR/delta ]]; then
    echo "Install Git-delta"
    cargo install git-delta
else
    printf "${tty_blue}Git-delta${tty_reset} is already installed, skip it.\n"
fi
