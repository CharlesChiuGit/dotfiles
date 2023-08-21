#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                        PHP/Composer Install                        #
######################################################################
NOTE: sudo apt install build-essential autoconf bison re2c libxml2-dev libsqlite3-dev
PHP_DIR=$HOME/tools/php
PHP_LINK="https://github.com/php/php-src.git"
if [[ -z "$(command -v php)" ]]; then
    echo "Install PHP"

    if [[ ! -d "$PHP_DIR" ]]; then
        echo "Creating php directory under tools directory"
        mkdir -p "$PHP_DIR"
        echo "git clone php repo"
        git clone --depth=1 "$PHP_LINK" "$PHP_DIR"
        cd "$PHP_DIR"
        ./buildconf
        ./configure --prefix="$PHP_DIR" --with-openssl --with-zlib
        make -j4
        make install
    fi

    # NOTE: sudo apt install zlib1g zlib1g-dev
    PHP=$PHP_DIR/bin/php
    EXPECTED_CHECKSUM="$($PHP -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
    "$PHP" -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    ACTUAL_CHECKSUM="$($PHP -r "echo hash_file('sha384', 'composer-setup.php');")"

    if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]; then
        echo >&2 'ERROR: Invalid installer checksum'
        rm composer-setup.php
        exit 1
    fi

    $PHP composer-setup.php --quiet
    rm composer-setup.php
    mv composer.phar "$PHP_DIR/bin/composer"

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
alias php='~/tools/php/bin/php'
export PATH="$PATH:$HOME/tools/php/bin"
EOT
    fi
else
    printf "${tty_blue}Php${tty_reset} is already installed, skip it.\n"
    printf "    ${tty_blue}Composer${tty_reset} is already installed, skip it.\n"
fi

cd ~/dotfiles/install_scripts/
