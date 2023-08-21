#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                              Jq Part                               #
######################################################################
JQ_DIR=$HOME/tools/jq
JQ_LINK="https://github.com/stedolan/jq.git"
if [[ -z $(command -v jq) ]]; then
    echo "Install jq"

    if [[ ! -d $JQ_DIR ]]; then
        echo "Creating jq directory under tools directory"
        mkdir -p "$JQ_DIR"
        echo "git clone to $HOME/tools/jq directory"
        cd "$HOME/tools"
        git clone "$JQ_LINK" --depth=1
        cd "$JQ_DIR"
        git submodule update --init # if building from git to get oniguruma
        autoreconf -fi              # if building from git
        ./configure --with-oniguruma=builtin --disable-maintainer-mode
        make -j8
        make check
        cd ~/dotfiles/install_scripts/
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
export PATH="$PATH:$HOME/tools/jq"
EOT
    fi
else
    printf "${tty_blue}Jq${tty_reset} is already installed, skip it.\n"
fi
