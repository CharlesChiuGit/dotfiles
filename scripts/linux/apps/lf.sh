#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                              Lf Part                               #
######################################################################
LF_DIR=$HOME/tools/lf
LF_SRC_NAME=$HOME/packages/lf.tar.gz
LF_LINK="https://github.com/gokcehan/lf/releases/download/r30/lf-linux-amd64.tar.gz"
if [[ -z $(command -v lf) ]] && [[ ! -f $LF_DIR/ ]]; then
	echo "Install Lf"
	if [[ ! -f $LF_SRC_NAME ]]; then
		echo "Downloading Lf and renaming"
		wget $LF_LINK -O "$LF_SRC_NAME"
	fi

	if [[ ! -d $LF_DIR ]]; then
		echo "Creating Lf directory under tools directory"
		mkdir -p "$LF_DIR"
		echo "Extracting to $HOME/tools/lf directory"
		tar zxvf "$LF_SRC_NAME" -C "$LF_DIR"
		cd ~/dotfiles/scripts/linux
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
		cat <<EOT >>"$RC_FILE"
[ -f ~/.config/lf/icon.sh ] && source "$HOME/.config/lf/icon.sh"
EOT
	fi
else
	printf "${tty_blue}Lf${tty_reset} is already installed, skip it.\n"
fi
