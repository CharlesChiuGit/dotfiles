#!/bin/env bash

PLUGIN_DIR=$HOME/.config/xplr/plugins

if [[ ! -d $PLUGIN_DIR ]]; then
  mkdir -p "$HOME/.config/xplr/plugins"
fi

function clone_pull() {
    if [ ! -d "$PLUGIN_DIR/$1" ]; then
        git clone "$2" "$PLUGIN_DIR/$1" --depth 1
    else
        cd "$PLUGIN_DIR/$1" || exit
        git pull -f
    fi
}

clone_pull fzf https://github.com/sayanarijit/fzf.xplr
clone_pull dua-cli https://github.com/sayanarijit/dua-cli.xplr
clone_pull icons https://github.com/prncss-xyz/icons.xplr
clone_pull trash-cli https://github.com/sayanarijit/trash-cli.xplr
clone_pull zoxide https://github.com/sayanarijit/zoxide.xplr
# clone_pull xclip https://github.com/sayanarijit/xclip.xplr
clone_pull dual-pane https://github.com/sayanarijit/dual-pane.xplr
clone_pull map https://github.com/sayanarijit/map.xplr
clone_pull find https://github.com/sayanarijit/find.xplr
clone_pull command-mode https://github.com/sayanarijit/command-mode.xplr
