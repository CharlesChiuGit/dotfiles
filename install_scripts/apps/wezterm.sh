#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Wexterm Part                            #
######################################################################
WEZ_DIR=$HOME/tools
WEZ_SRC_NAME=$HOME/packages/wezterm_ubuntu2204.tar.xz
WEZ_LINK="https://github.com/wez/wezterm/releases/download/20221119-145034-49b9839f/wezterm-20221119-145034-49b9839f.Ubuntu22.04.tar.xz"
if [[ -z $(command -v wezterm) ]]; then
    echo "Install wezterm"
    if [[ ! -f $WEZ_SRC_NAME ]]; then
        echo "Downloading Wezterm"
        wget "$WEZ_LINK" -O "$WEZ_SRC_NAME"
    fi

    echo "Extracting Wezterm"
    tar Jxvf "$WEZ_SRC_NAME" -C "$WEZ_DIR"
    cd ~/dotfiles/install_scripts/

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
export PATH="$PATH:$HOME/tools/wezterm/usr/bin"
EOT
    fi
else
    printf "${tty_blue}Wezterm${tty_reset} is already installed, skip it.\n"
fi
