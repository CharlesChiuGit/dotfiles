#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                             Gitui Part                             #
######################################################################
# URL: https://github.com/extrawurst/gitui
if [[ -z $(command -v gitui) ]]; then
	echo "Install Gitui"
	cargo install gitui
else
	printf "${tty_blue}Gitui${tty_reset} is already installed, skip it.\n"
fi
