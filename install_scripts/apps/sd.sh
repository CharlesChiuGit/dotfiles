#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                              Sd Part                               #
######################################################################
# URL: https://github.com/chmln/sd
if [[ -z $(command -v sd) ]]; then
	echo "Install Sd"
	cargo install sd
else
	printf "${tty_blue}Sd${tty_reset} is already installed, skip it.\n"
fi
