#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2059,SC2154
# INFO: https://dywang.csie.cyut.edu.tw/dywang/linuxProgram/node61.html
set -e
set -o pipefail

USERNAME="Charles Chiu"
EMAIL="charleschiu2012@gmail.com"

# Import var & func from `util.sh`
source ./util.sh

cat <<EOS

- Project Homepage:
    ${tty_green}https://github.com/CharlesChiuGit/dotfiles${tty_reset}
- File an issue if you encounter any problems.
    ${tty_green}https://github.com/CharlesChiuGit/dotfiles/issues${tty_reset}

EOS

# Fail fast with a concise message when not using bash
# Single brackets are needed here for POSIX compatibility
# hellcheck disable=SC2292
if [ -z "${BASH_VERSION:-}" ]; then
    abort "Bash is required to interpret this script."
fi

if ! command -v git >/dev/null; then
    abort "$(
		cat <<EOABORT
You must install Git before executing this script. See:
  ${tty_green}https://git-scm.com/${tty_reset}
EOABORT
    )"
fi

# Whether to add the path of the installed executables to system $PATH
ADD_TO_SYSTEM_PATH=false

# Select bash/zsh
USE_BASH_SHELL=false
USE_ZSH_SHELL=true

if [[ $ADD_TO_SYSTEM_PATH = true ]]; then

    if [[ $USE_BASH_SHELL = true ]]; then
        RC_FILE="$HOME/.bashrc"
    elif [[ $USE_ZSH_SHELL = true ]]; then
        RC_FILE="$HOME/.zshrc"
    else
        echo "Please select a shell"
        exit 1
    fi

    printf "Chosen rc file: ${tty_blue}%s${tty_reset}\n" "$RC_FILE"
fi

CheckDir() {
    if [[ ! -d $HOME/packages/ ]]; then
        mkdir -p "$HOME/packages/"
        echo "Created $HOME/packages/"
    fi

    if [[ ! -d $HOME/tools/ ]]; then
        mkdir -p "$HOME/tools/"
        echo "Created $HOME/tools/"
    fi
}
printf "All downloaded files will be placed in ${tty_blue}%s/packages${tty_reset}.\n" "$HOME"
printf "All installed apps will be placed in ${tty_blue}%s/tools${tty_reset}.\n\n" "$HOME"

MAN_PATH=$HOME/dotfiles/Local/.local/share/man/man1
LOCAL_MAN=$HOME/.local/share/man/man1
printf "All man docs will be placed in ${tty_blue}%s${tty_reset}.\n" "$MAN_PATH"
printf "Use ${tty_yellow}\"cd ~/dotfiles && stow Local\"${tty_reset} to link it to ${tty_blue}%s${tty_reset}.\n\n" "$LOCAL_MAN"

wait_for_user
printf "\n${tty_yellow}====================Script starts====================${tty_reset}\n\n"

# use the `--source-only` flag to import only the vars and the funcs without running the actucal script.
if [ "${1}" != "--source-only" ]; then
    CheckDir "${@}"
fi
