#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            LogiOps Part                            #
######################################################################
LGO_DIR=$HOME/tools/logiops
LGO_SRC_NAME=$HOME/packages/logiops.tar.gz
LGO_LINK="https://github.com/PixlOne/logiops/releases/download/v0.3.1/logiops-v0.3.1.tar.gz"
if [[ -z $(command -v logid) ]] && [[ ! -f $LGO_DIR/logiops ]]; then
	echo "Install LogiOps"
	if [[ ! -f $LGO_SRC_NAME ]]; then
		echo "Downloading LogiOps and renaming"
		wget "$LGO_LINK" -O "$LGO_SRC_NAME"
	fi

	if [[ ! -d $LGO_DIR ]]; then
		echo "Creating LogiOps directory under tools directory"
		mkdir -p "$LGO_DIR"
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
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
		cat <<EOT >>"$RC_FILE"
export PATH="$PATH:$HOME/tools/fzy"
EOT
	fi
else
	printf "${tty_blue}Fzy${tty_reset} is already installed, skip it.\n"
fi
