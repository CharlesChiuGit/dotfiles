#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

source ./config.sh

source ./updates/ascii-image-converter.sh
source ./updates/batcat_up.sh
source ./updates/btop_up.sh
source ./updates/cpufetch_up.sh
source ./updates/delta_up.sh
source ./updates/dua_up.sh
source ./updates/exa_up.sh
source ./updates/fdfind_up.sh
source ./updates/fzf_up.sh
source ./updates/fzy_up.sh
source ./updates/glow_up.sh
source ./updates/jq_up.sh
source ./updates/lazygit_up.sh
source ./updates/lf_up.sh
source ./updates/lnav_up.sh
source ./updates/navi_up.sh
# source ./updates/nvim_up.sh
source ./updates/pistol_up.sh
source ./updates/qfc_up.sh
source ./updates/ripgrep_up.sh
source ./updates/sheldon_up.sh
source ./updates/silicon_up.sh
source ./updates/starship_up.sh
source ./updates/tmux_up.sh
source ./updates/trashy_up.sh
source ./updates/treesitter_up.sh
source ./updates/ugrep_up.sh
source ./updates/viu_up.sh
source ./updates/zoxide_up.sh

printf "\n${tty_yellow}====================Script ends====================${tty_reset}\n\n"
printf "${tty_yellow}Update finished${tty_reset}.\n"
