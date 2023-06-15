#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                              Xq Part                               #
######################################################################

if [[ -z $(command -v xq) ]]; then
	echo "Install xq"
	cargo install xq
else
	printf "${tty_blue}Xq${tty_reset} is already installed, skip it.\n"
fi
