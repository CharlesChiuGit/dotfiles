#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            dt-cli part                             #
######################################################################
if [[ -z $(command -v dt-cli) ]]; then
	echo "Install dt-cli"
	cargo install --git https://github.com/blurgyy/dt.git dt-cli
else
	printf "${tty_blue}dt-cli${tty_reset} is already installed, skip it.\n"
fi
