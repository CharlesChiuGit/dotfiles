#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Bottom Part                             #
######################################################################
# URL: https://github.com/ClementTsang/bottom
if [[ -z $(command -v btm) ]]; then
	echo "Install Bottom"
	cargo install --locked bottom
else
	printf "${tty_blue}Bottom${tty_reset} is already installed, skip it.\n"
fi
