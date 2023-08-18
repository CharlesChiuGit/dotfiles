#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                           Update Btop++                            #
######################################################################
printf "Fetch ${tty_blue}Btop++${tty_reset} latest release...\n"
remote_version=$(get_latest_release "aristocratos/btop")
# remote_version="v1.2.13"
remote_version_c=$(echo "$remote_version" | sed -E 's/v([0-9]+.[0-9]+.[0-9]+)/\1/')
echo "Remote version: ${remote_version_c}"

local_version=$(btop --version | awk '{print $3}')
echo "Local version: ${local_version}"

status=$(is_latest "$remote_version_c" "$local_version")
if [ "$status" = false ]; then
    printf "Update ${tty_blue}Btop++...${tty_reset}\n"
    BTOP_SRC_NAME=$HOME/packages/btop.tbz
    rm -rf "${BTOP_SRC_NAME}"
    url="https://github.com/aristocratos/btop/releases/download/${remote_version}/btop-x86_64-linux-musl.tbz"
    wget "$url" -O "${BTOP_SRC_NAME}"
    echo "Extracting to $HOME/tools/btop directory"
    tar xjvf "$BTOP_SRC_NAME" -C "$HOME/tools"

    printf "${tty_blue}Btop++${tty_reset} updated to ${tty_green}${remote_version}${tty_reset}.\n"
else
    printf "${tty_blue}Btop++${tty_reset} is up-to-date.\n"
fi
