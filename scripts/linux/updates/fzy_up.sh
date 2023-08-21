#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                             Update fzy                             #
######################################################################
printf "Fetch ${tty_blue}Fzy${tty_reset} latest release...\n"
remote_version=$(get_latest_release "jhawthorn/fzy")
# remote_version="1.0"
remote_version_c=$(echo "$remote_version" | sed -E 's/v([0-9]+.[0-9]+)/\1/')
echo "Remote version: ${remote_version_c}"

local_version=$(fzy --version | awk '{print $2}')
echo "Local version: ${local_version}"

status=$(is_latest "$remote_version_c" "$local_version")
if [ "$status" = false ]; then
    printf "Update ${tty_blue}Fzy...${tty_reset}\n"
    FZY_DIR=$HOME/tools/fzy
    FZY_SRC_NAME=$HOME/packages/fzy.tar.gz
    rm -rf "${FZY_SRC_NAME}"
    rm -rf "${FZY_DIR}"
    mkdir -p "${FZY_DIR}"
    url="https://github.com/jhawthorn/fzy/releases/download/${remote_version}/fzy-${remote_version}.tar.gz"
    wget "$url" -O "${FZY_SRC_NAME}"
    echo "Extracting to $HOME/tools/fzy directory"
    tar zxvf "$FZY_SRC_NAME" -C "$FZY_DIR" --strip-components 1
    make -C "$FZY_DIR"

    printf "${tty_blue}Fzy${tty_reset} updated to ${tty_green}${remote_version}${tty_reset}.\n"
else
    printf "${tty_blue}Fzy${tty_reset} is up-to-date.\n"
fi
