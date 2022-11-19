#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                             Ctpv Part                              #
######################################################################
CTPV_DIR=$HOME/tools/ctpv
CTPV_LINK="https://github.com/NikitaIvanovV/ctpv.git"
if [[ -z $(command -v ctpv) ]]; then
    echo "Install Ctpv"

    if [[ ! -d $CTPV_DIR ]]; then
        echo "Creating ctpv directory under tools directory"
        mkdir -p "$CTPV_DIR"
        echo "git clone to $HOME/tools/ctpv directory"
        git clone --depth=1 "$CTPV_LINK" "$CTPV_DIR"
        cd "$CTPV_DIR"
        # sudo make install # NOTE: need sudo for this
        make
        cd ~/dotfiles/install_scripts/
    fi
    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
export PATH="$PATH:$HOME/tools/ctpv"
EOT
    fi

else
    printf "${tty_blue}Ctpv${tty_reset} is already installed, skip it.\n"
fi
