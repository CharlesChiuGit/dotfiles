#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail
######################################################################
#                          Update Cpufetch                           #
######################################################################
printf "Fetch ${tty_blue}Cpufetch${tty_reset} latest release...\n"
remote_version=$(get_latest_release "Dr-Noob/cpufetch")
# remote_version="v1.03"
remote_version_c=$(echo "$remote_version" | sed -E 's/v([0-9]+.[0-9]+)/\1/')
echo "Remote version: ${remote_version_c}"

local_version=$(cpufetch --version | awk '{print $2}' | sed -E 's/v([0-9]+.[0-9]+)/\1/')
echo "Local version: ${local_version}"

status=$(is_latest "$remote_version_c" "$local_version")
if [ "$status" = false ]; then
    printf "Update ${tty_blue}Cpufetch...${tty_reset}\n"
    CPUFETCH_DIR=$HOME/tools/cpufetch
    rm -rf "$CPUFETCH_DIR/cpufetch"
    CPUFETCH_LINK="https://github.com/Dr-Noob/cpufetch/releases/download/${remote_version}/cpufetch_x86-64_linux"
    wget "$CPUFETCH_LINK" -O "$CPUFETCH_DIR/cpufetch"
    chmod +x "$CPUFETCH_DIR/cpufetch"

    printf "${tty_blue}Cpufetch${tty_reset} updated to ${tty_green}${remote_version}${tty_reset}.\n"
else
    printf "${tty_blue}Cpufetch${tty_reset} is up-to-date.\n"
fi
