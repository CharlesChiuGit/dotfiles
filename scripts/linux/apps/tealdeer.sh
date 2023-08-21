#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                           Tealdeer Part                            #
######################################################################
# URL: https://github.com/dbrgn/tealdeer
if [[ -z $(command -v tldr) ]]; then
	echo "Install Tealdeer"
	cargo install tealdeer
else
	printf "${tty_blue}Tealdeer${tty_reset} is already installed, skip it.\n"
fi
