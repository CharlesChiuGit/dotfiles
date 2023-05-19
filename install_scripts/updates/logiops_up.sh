#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                           Update LogiOps                           #
######################################################################
printf "Fetch ${tty_blue}LogiOps${tty_reset} latest release...\n"
remote_version=$(get_latest_release "PixlOne/logiops")
# remote_version="1.0"
remote_version_c=$(echo "$remote_version" | sed -E 's/v([0-9]+.[0-9]+)/\1/')
echo "Remote version: ${remote_version_c}"

local_version=$(logid --version | sed -E 's/v([0-9]+.[0-9]+)/\1/')
echo "Local version: ${local_version}"

status=$(is_latest "$remote_version_c" "$local_version")
if [ "$status" = false ]; then
	printf "Update ${tty_blue}LogiOps...${tty_reset}\n"
	LGO_DIR=$HOME/tools/logiops
	LGO_SRC_NAME=$HOME/packages/logiops.tar.gz
	rm -rf "${LGO_SRC_NAME}"
	rm -rf "${LGO_DIR}"
	mkdir -p "${LGO_DIR}"
	url="https://github.com/PixlOne/logiops/releases/download/${remote_version}/logiops-${remote_version}.tar.gz"
	wget "$url" -O "${LGO_SRC_NAME}"
	echo "Extracting to $HOME/tools/logiops directory"
	tar zxvf "$LGO_SRC_NAME" -C "$LGO_DIR" --strip-components 1
	cd "$LGO_DIR"
	mkdir build
	cd build
	cmake cmake -DCMAKE_BUILD_TYPE=Release ..
	make
	sudo make install
	sudo systemctl enable --now logid
	cd ~/dotfiles/install_scripts/

	printf "${tty_blue}LogiOps${tty_reset} updated to ${tty_green}${remote_version}${tty_reset}.\n"
else
	printf "${tty_blue}LogiOps${tty_reset} is up-to-date.\n"
fi
