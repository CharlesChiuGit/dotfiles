#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                         Rust/Cargo Install                         #
######################################################################
# Use rustup
if [[ -z "$(command -v cargo)" ]]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
[ -f ~/.cargo/env ] && source "$HOME/.cargo/env"
EOT
    fi
else
    printf "${tty_blue}Rust${tty_reset} is already installed, skip it.\n"
    printf "\t${tty_blue}Cargo${tty_reset} is already installed, skip it.\n"
fi
