#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                             Dust Part                              #
######################################################################
# URL: https://github.com/bootandy/dust
if [[ -z $(command -v dust) ]]; then
	echo "Install Dust"
	cargo install du-dust
else
	printf "${tty_blue}Dust${tty_reset} is already installed, skip it.\n"
fi
