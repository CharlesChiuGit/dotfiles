#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                         Update Tree-sitter                         #
######################################################################
printf "Fetch ${tty_blue}Tree-sitter${tty_reset} latest release...\n"
remote_version=$(get_latest_release "tree-sitter/tree-sitter")
# remote_version="0.20.7"
remote_version_c=$(echo "$remote_version" | sed -E 's/v([0-9]+.[0-9]+.[0-9]+)/\1/')
echo "Remote version: ${remote_version_c}"

local_version=$(tree-sitter --version | awk '{print $2}')
echo "Local version: ${local_version}"

status=$(is_latest "$remote_version_c" "$local_version")
if [ "$status" = false ]; then
    printf "Update ${tty_blue}Tree-sitter...${tty_reset}\n"
    TS_DIR=$HOME/tools/treesitter
    TS_SRC_NAME=$HOME/packages/tree-sitter-linux-x64.gz
    TS_LINK="https://github.com/tree-sitter/tree-sitter/releases/download/${remote_version}/tree-sitter-linux-x64.gz"
    rm -rf "$TS_SRC_NAME"
    rm -rf "$TS_DIR"
    mkdir -p "$TS_DIR"
    wget "$TS_LINK" -P "$HOME/packages"
    echo "Extracting to $HOME/tools/treesitter directory"
    gunzip "$TS_SRC_NAME"
    mv "$HOME/packages/tree-sitter-linux-x64" "$TS_DIR/tree-sitter"
    chmod u+x "$TS_DIR/tree-sitter"

    printf "${tty_blue}Tree-sitter${tty_reset} updated to ${tty_green}${remote_version}${tty_reset}.\n"
else
    printf "${tty_blue}Tree-sitter${tty_reset} is up-to-date.\n"
fi
