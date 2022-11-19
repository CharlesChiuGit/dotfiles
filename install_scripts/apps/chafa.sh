#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                             Chafa Part                             #
######################################################################
# NOTE: sudo apt install libfreetype6-dev libjpeg-dev librsvg2-dev libtiff5-dev libwebp-dev libmagickwand-dev libtool gtk-doc-tools
CHAFA_DIR=$HOME/tools/chafa
CHAFA_LINK="https://github.com/hpjansson/chafa.git"
if [[ -z $(command -v chafa) ]]; then
    echo "Install Chafa"

    if [[ ! -d $CHAFA_DIR ]]; then
        echo "Creating chafa directory under tools directory"
        mkdir -p "$CHAFA_DIR"
        echo "git clone to $HOME/tools/chafa directory"
        git clone --depth=1 "$CHAFA_LINK" "$CHAFA_DIR"
        cd "$CHAFA_DIR"
        ./autogen.sh --prefix="$CHAFA_DIR"
        make
        make install
        cd ~/dotfiles/install_scripts/
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
export PATH="$PATH:$HOME/tools/chafa/bin"
EOT
    fi
else
    printf "${tty_blue}Chafa${tty_reset} is already installed, skip it.\n"
fi
