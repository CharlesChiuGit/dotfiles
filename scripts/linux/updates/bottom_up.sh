#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                           Update Bottom                            #
######################################################################
printf "Fetch ${tty_blue}Bottom${tty_reset} latest release...\n"
remote_version=$(get_latest_release "ClementTsang/bottom")
# remote_version="v0.22.3"
remote_version_c=$(echo "$remote_version" | sed -E 's/v([0-9]+.[0-9]+.[0-9]+)/\1/')
echo "Remote version: ${remote_version_c}"

local_version=$(btm --version | awk '{print $2}')
echo "Local version: ${local_version}"

status=$(is_latest "$remote_version_c" "$local_version")
if [ "$status" = false ]; then
	printf "Update ${tty_blue}Bottom...${tty_reset}\n"
	cargo install bottom --locked
	printf "${tty_blue}Bottom${tty_reset} updated to ${tty_green}${remote_version}${tty_reset}.\n"
else
	printf "${tty_blue}Bottom${tty_reset} is up-to-date.\n"
fi
