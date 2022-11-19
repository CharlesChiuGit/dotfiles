#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

source ./config.sh

source ./langs/conda.sh
source ./langs/golang.sh
source ./langs/java.sh
source ./langs/julia.sh
source ./langs/lua.sh
source ./langs/nodejs.sh
source ./langs/perl.sh
# source ./langs/php.sh
source ./langs/ruby.sh
source ./langs/rust.sh

printf "\n${tty_yellow}====================Script ends====================${tty_reset}\n\n"
printf "Remember ${tty_yellow}\"source ~/.bashrc or source ~/.zshrc\"${tty_reset} to make \$PATH valid.\n"
