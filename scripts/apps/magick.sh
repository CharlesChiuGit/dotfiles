#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                          ImageMagick Part                          #
######################################################################
MAGICK_DIR=$HOME/tools/magick
MAGICK_LINK="https://github.com/ImageMagick/ImageMagick"
MAGICK_MAN="$MAN_PATH/magick"
if [[ -z $(command -v magick) ]]; then
    echo "Install ImageMagick"

    if [[ ! -d $MAGICK_DIR ]]; then
        echo "Creating magick directory under tools directory"
        mkdir -p "$MAGICK_DIR"
        echo "git clone to $HOME/tools/magick directory"
        git clone --depth=1 "$MAGICK_LINK" "$MAGICK_DIR"
        cd "$MAGICK_DIR"
        ./configure --prefix="$MAGICK_DIR" --with-modules
        make
        make install
        cd ~/dotfiles/install_scripts/
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
export PATH="$PATH:$HOME/tools/magick/bin"
export MAGICK_HOME="$HOME/tools/magick"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$MAGICK_HOME/lib"
EOT
    fi
else
    printf "${tty_blue}ImageMagick${tty_reset} is already installed, skip it.\n"
fi
