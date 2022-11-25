#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                          Ruby/Gem Install                          #
######################################################################
RUBY_DIR=$HOME/tools/ruby
RUBY_TAR_DIR=$HOME/tools/ruby/tarball
RUBY_SRC_NAME=$HOME/packages/ruby.tar.gz
RUBY_LINK="https://cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.2.tar.gz"
if [[ ! -f "$RUBY_DIR/bin/ruby" ]]; then
    echo "Install Ruby"
    if [[ ! -f $RUBY_SRC_NAME ]]; then
        echo "Downloading ruby and renaming"
        wget $RUBY_LINK -O "$RUBY_SRC_NAME"
    fi

    if [[ ! -d "$RUBY_DIR" ]]; then
        echo "Creating ruby directory under tools directory"
        mkdir -p "$RUBY_DIR"
        mkdir -p "$RUBY_TAR_DIR"
        echo "Extracting to $HOME/tools/ruby/tarball directory"
        tar xvf "$RUBY_SRC_NAME" -C "$RUBY_TAR_DIR" --strip-components 1
        cd "$RUBY_TAR_DIR"
        # NOTE: sudo apt install openssl libssl-dev
        ./configure --prefix="$RUBY_DIR" --with-openssl-dir=/etc/ssl
        make
        make install

    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
alias ruby='~/tools/ruby/bin/ruby'
export PATH="$PATH:$HOME/tools/ruby/bin"
EOT
    fi
else
    printf "${tty_blue}Ruby${tty_reset} is already installed, skip it.\n"
    printf "\t${tty_blue}Gem${tty_reset} is already installed, skip it.\n"
fi

cd ~/dotfiles/install_scripts/
