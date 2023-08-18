#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                          Lazydocker Part                           #
######################################################################
if [[ -z $(command -v lazydocker) ]]; then
	echo "Install lazydocker"
	go install github.com/jesseduffield/lazydocker@latest
else
	printf "${tty_blue}Lazydocker${tty_reset} is already installed, skip it.\n"
fi
