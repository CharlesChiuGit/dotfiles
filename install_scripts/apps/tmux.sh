#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                             Tmux Part                              #
######################################################################
# NOTE: sudo apt install libevent-dev
TMUX_DIR=$HOME/tools/tmux
TMUX_SRC_NAME=$HOME/packages/tmux.tar.gz
TMUX_LINK="https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz"
if [[ ! -f $TMUX_DIR/tmux ]]; then
    echo "Install tmux"
    if [[ ! -f $TMUX_SRC_NAME ]]; then
        echo "Downloading tmux and renaming"
        wget "$TMUX_LINK" -O "$TMUX_SRC_NAME"
    fi

    if [[ ! -d $TMUX_DIR ]]; then
        echo "Creating tmux directory under tools directory"
        mkdir -p "$TMUX_DIR"
        echo "Extracting to $HOME/tools/tmux directory"
        tar zxvf "$TMUX_SRC_NAME" -C "$TMUX_DIR" --strip-components 1
        cd "$TMUX_DIR"
        ./configure --prefix="$TMUX_DIR"
        make
        make install
        cd ~/dotfiles/install_scripts/
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
alias tmux='TERM=tmux-256color ~/tools/tmux/tmux -f ~/.config/tmux/tmux.conf'
export PATH="$PATH:$HOME/tools/tmux"
EOT
    fi

    echo "Installing tpm"
    if [[ ! -d ~/.tmux/plugins/tpm ]]; then
        git clone --depth=1 https://github.com/tmux-plugins/tpm \
            ~/.tmux/plugins/tpm
        # NOTE: `prefix` + `I` to install plugins via tpm.
    fi

else
    printf "${tty_blue}Tmux${tty_reset} is already installed, skip it.\n"
fi
