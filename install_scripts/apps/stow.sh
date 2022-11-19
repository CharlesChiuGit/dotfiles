#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                           GNU stow Part                            #
######################################################################
# NOTE: make sure perl is installed
# NOTE: also, cpanm install Test::Output Test::Output
STOW_DIR=$HOME/tools/stow
STOW_SRC_NAME=$HOME/packages/stow.tar.gz
STOW_LINK="https://ftp.gnu.org/gnu/stow/stow-2.3.1.tar.gz"
if [[ -z $(command -v stow) ]]; then
    echo "Install GNU stow"
    if [[ ! -f $STOW_SRC_NAME ]]; then
        echo "Downloading stow and renaming"
        wget $STOW_LINK -O "$STOW_SRC_NAME"
    fi

    if [[ ! -d $STOW_DIR ]]; then
        echo "Creating stow directory under tools directory"
        mkdir -p "$STOW_DIR"
        echo "Extracting to $HOME/tools/stow directory"
        tar zxvf "$STOW_SRC_NAME" -C "$STOW_DIR" --strip-components 1
        cd "$STOW_DIR"
        cpanm install Test::Output Test::Output
        echo "Assign perl location"
        # export PERL_PREFIX="$HOME/.plenv/versions/5.36.0"
        export PERL_PREFIX="$HOME/tools/perl"
        ./configure --prefix="$PERL_PREFIX"
        make
        make install
        cd ~/dotfiles/install_scripts/
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
export PATH="$PATH:$HOME/tools/stow/bin"
EOT
    fi
else
    printf "${tty_blue}GNU stow${tty_reset} is already installed, skip it.\n"
fi
