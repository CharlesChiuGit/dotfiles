#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                             Update Lf                              #
######################################################################
printf "Fetch ${tty_blue}Lf${tty_reset} latest release...\n"
remote_version=$(get_latest_release "gokcehan/lf")
remote_version_c=$(echo "$remote_version" | sed -E 's/r([0-9]+[0-9])/\1/')
echo "Remote version: ${remote_version_c}"

local_version=$(lf -version | sed -E 's/r([0-9]+[0-9])/\1/')
echo "Local version: ${local_version}"

status=$(is_latest "$remote_version_c" "$local_version")
if [ "$status" = false ]; then
	printf "Update ${tty_blue}Lf...${tty_reset}\n"
	LF_DIR=$HOME/tools/lf
	LF_SRC_NAME=$HOME/packages/lf.tar.gz
	rm -rf "${LF_SRC_NAME}"
	rm -rf "${LF_DIR}"
	mkdir -p "${LF_DIR}"
	url="https://github.com/gokcehan/lf/releases/download/${remote_version}/lf-linux-amd64.tar.gz"
	wget "$url" -O "${LF_SRC_NAME}"
	echo "Extracting to $HOME/tools/lf directory"
	tar zxvf "$LF_SRC_NAME" -C "$LF_DIR" --strip-components 1

	printf "${tty_blue}Lf${tty_reset} updated to ${tty_green}${remote_version}${tty_reset}.\n"
else
	printf "${tty_blue}Lf${tty_reset} is up-to-date.\n"
fi

cd ~/dotfiles/install_scripts/
