#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Zellig Part                             #
######################################################################
# URL: https://github.com/zellij-org/zellij
if [[ -z $(command -v zellij) ]]; then
	echo "Install Zellij"
	cargo install --locked zellij
else
	printf "${tty_blue}Zellij${tty_reset} is already installed, skip it.\n"
fi
