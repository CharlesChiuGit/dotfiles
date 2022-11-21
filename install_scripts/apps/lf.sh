#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                              Lf Part                               #
######################################################################
if [[ -z $(command -v lf) ]]; then
    echo "Install lf"
    env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
[ -f ~/.config/lf/icon.sh ] && source "$HOME/.config/lf/icon.sh"
EOT
    fi
else
    printf "${tty_blue}Lf${tty_reset} is already installed, skip it.\n"
fi
