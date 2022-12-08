#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

source ./config.sh

source ./apps/ascii-image-converter.sh
source ./apps/batcat.sh
source ./apps/btop.sh
# source ./apps/chafa.sh
source ./apps/cpufetch.sh
source ./apps/delta.sh
source ./apps/dua.sh
source ./apps/exa.sh
source ./apps/fdfind.sh
source ./apps/fzf.sh
source ./apps/fzy.sh
source ./apps/glow.sh
source ./apps/jq.sh
source ./apps/lazygit.sh
source ./apps/lf.sh
source ./apps/lnav.sh
# source ./apps/magick.sh
source ./apps/navi.sh
source ./apps/nvim.sh
source ./apps/pistol.sh
source ./apps/qfc.sh
source ./apps/ripgrep.sh
source ./apps/sheldon.sh
source ./apps/silicon.sh
source ./apps/starship.sh
source ./apps/stow.sh
source ./apps/termpix.sh
source ./apps/tmux.sh
source ./apps/trashy.sh
source ./apps/treesitter.sh
source ./apps/ugrep.sh
source ./apps/viu.sh
# source ./apps/xplr.sh
source ./apps/zoxide.sh

printf "\n${tty_yellow}====================Script ends====================${tty_reset}\n\n"
printf "Remember ${tty_yellow}\"source ~/.bashrc or source ~/.zshrc\"${tty_reset} to make \$PATH valid.\n"
