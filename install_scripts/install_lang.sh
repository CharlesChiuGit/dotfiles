#!/usr/bin/sh
# shellcheck disable=SC2059,SC2154
set -e

. ./config.sh

# . ./langs/conda.sh
# . ./langs/golang.sh
# . ./langs/java.sh
# . ./langs/julia.sh
# . ./langs/lua.sh
# . ./langs/nodejs.sh
# . ./langs/perl.sh
# . ./langs/php.sh
# . ./langs/ruby.sh
. ./langs/rust.sh

printf "\n${tty_yellow}====================Script ends====================${tty_reset}\n\n"
printf "Remember ${tty_yellow}\"source ~/.bashrc or source ~/.zshrc\"${tty_reset} to make \$PATH valid.\n"
