#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Update Tmux                             #
######################################################################
printf "Fetch ${tty_blue}Tmux${tty_reset} latest release...\n"
remote_version=$(get_latest_release "tmux/tmux")
# remote_version="3.3a"
remote_version_c=$(echo "$remote_version" | sed -E 's/([0-9]+.[0-9]).$/\1/')
echo "Remote version: ${remote_version_c}"

local_version=$(tmux -V | awk '{print $2}' | sed -E 's/([0-9]+.[0-9]).$/\1/')
echo "Local version: ${local_version}"

status=$(is_latest "$remote_version_c" "$local_version")
if [ "$status" = false ]; then
    printf "Update ${tty_blue}Tmux...${tty_reset}\n"
    TMUX_DIR=$HOME/tools/tmux
    TMUX_SRC_NAME=$HOME/packages/tmux.tar.gz
    TMUX_LINK="https://github.com/tmux/tmux/releases/download/${remote_version}/tmux-${remote_version}.tar.gz"
    rm -rf "$TMUX_SRC_NAME"
    rm -rf "$TMUX_DIR"
    mkdir -p "$TMUX_DIR"
    wget "$TMUX_LINK" -O "$TMUX_SRC_NAME"
    tar zxvf "$TMUX_SRC_NAME" -C "$TMUX_DIR" --strip-components 1
    cd "$TMUX_DIR"
    ./configure --prefix="$TMUX_DIR"
    make
    make install

    printf "${tty_blue}Tmux${tty_reset} updated to ${tty_green}${remote_version}${tty_reset}.\n"
else
    printf "${tty_blue}Tmux${tty_reset} is up-to-date.\n"
fi

cd ~/dotfiles/install_scripts/
