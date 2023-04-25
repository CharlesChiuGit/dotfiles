#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Wexterm Part                            #
######################################################################
WEZ_DIR=$HOME/tools/wezterm
if [[ -z $(command -v wezterm) ]]; then
	echo "Install wezterm"
	echo "git clone Wezterm repo"
	if [[ ! -d "$HOME/tools/wezterm" ]]; then
		cd "$HOME/tools"
		git clone --depth=1 --branch=main --recursive https://github.com/wez/wezterm.git
	fi

	cd "$WEZ_DIR"
	git submodule update --init --recursive
	./get-deps
	cargo build --release
	cargo run --release --bin wezterm -- start

	cd ~/dotfiles/install_scripts/

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
		cat <<EOT >>"$RC_FILE"
export PATH="$PATH:$HOME/tools/wezterm/usr/bin"
EOT
	fi
else
	printf "${tty_blue}Wezterm${tty_reset} is already installed, skip it.\n"
fi
