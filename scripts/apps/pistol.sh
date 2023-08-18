#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Pistol Part                             #
######################################################################
# INFO: needed packages: libmagic, file, file-devel
# Ubuntu: sudo apt install libmagic-dev file -y
if [[ -z $(command -v pistol) ]]; then
	echo "Install Pistol"
	go install github.com/doronbehar/pistol/cmd/pistol@latest
else
	printf "${tty_blue}Pistol${tty_reset} is already installed, skip it.\n"
fi
