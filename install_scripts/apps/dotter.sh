#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Dotter Part                             #
######################################################################
if [[ -z $(command -v dotter) ]]; then
	echo "Install Dotter"
	cargo install dotter
else
	printf "${tty_blue}Dotter${tty_reset} is already installed, skip it.\n"
fi
