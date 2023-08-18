#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                              Qfc Part                              #
######################################################################
QFC_DIR=$HOME/tools/qfc
QFC_LINK="https://github.com/pindexis/qfc.git"

if [[ ! -d $QFC_DIR ]]; then
    echo "Install qfc"
    echo "Creating qfc directory under tools directory"
    mkdir -p "$QFC_DIR"
    git clone --depth=1 "$QFC_LINK" "$QFC_DIR"

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
# Init qfc
[[ -s $HOME/tools/qfc/bin/qfc.sh ]] && source "$HOME/tools/qfc/bin/qfc.sh"
qfc_quick_command 'cd' '\C-b' 'cd $0'
qfc_quick_command 'nvim' '\C-p' 'nvim $0'
EOT
    fi

else
    printf "${tty_blue}Qfc${tty_reset} is already installed, skip it.\n"
fi
