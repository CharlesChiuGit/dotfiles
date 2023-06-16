#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                             Gping Part                             #
######################################################################
# URL: https://github.com/orf/gping
if [[ -z $(command -v gping) ]]; then
	echo "Install Gping"
	cargo install gping
else
	printf "${tty_blue}Gping${tty_reset} is already installed, skip it.\n"
fi
