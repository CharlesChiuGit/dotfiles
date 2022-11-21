#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                            Update Lnav                             #
######################################################################
printf "Fetch ${tty_blue}Lnav${tty_reset} latest release...\n"
remote_version=$(get_latest_release "tstack/lnav")
# remote_version="v1.2.13"
remote_version_c=$(echo "$remote_version" | sed -E 's/v([0-9]+.[0-9]+.[0-9]+)/\1/')
echo "Remote version: ${remote_version_c}"

local_version=$(lnav --version | awk '{print $2}')
echo "Local version: ${local_version}"

status=$(is_latest "$remote_version_c" "$local_version")
if [ "$status" = false ]; then
    printf "Update ${tty_blue}Lnav...${tty_reset}\n"
    LNAV_DIR=$HOME/tools/lnav
    LNAV_SRC_NAME=$HOME/packages/lnav.zip
    LNAV_LINK="https://github.com/tstack/lnav/releases/download/${remote_version}/lnav-${remote_version_c}-x86_64-linux-musl.zip"
    rm -rf "${LNAV_SRC_NAME}"
    rm -rf "${LNAV_DIR}"
    mkdir -p "${LNAV_DIR}"
    wget "$LNAV_LINK" -O "$LNAV_SRC_NAME"
    echo "Extracting to $HOME/tools/lnav directory"
    unzip "$LNAV_SRC_NAME" -d "$LNAV_DIR"
    for f in "$LNAV_DIR"/lnav-*/*; do cp "$f" "$LNAV_DIR"; done
    rm -r "$LNAV_DIR"/lnav-*

    printf "${tty_blue}Lnav${tty_reset} updated to ${tty_green}${remote_version}${tty_reset}.\n"
else
    printf "${tty_blue}Lnav${tty_reset} is up-to-date.\n"
fi
