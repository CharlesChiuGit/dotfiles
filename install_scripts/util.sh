#!/usr/bin/env bash
# shellcheck disable=SC2034

abort() {
    printf "%s\n" "$@" >&2
    exit 1
}

# string formatters
if [[ -t 1 ]]; then
    tty_escape() { printf "\033[%sm" "$1"; }
else
    tty_escape() { :; }
fi

tty_mkbold() { tty_escape "1;$1"; }
tty_underline="$(tty_escape "4;39")"
tty_yellow="$(tty_escape "0;33")"
tty_red="$(tty_mkbold 31)"
tty_green="$(tty_mkbold 32)"
tty_blue="$(tty_mkbold 34)"
tty_magenta="$(tty_mkbold 35)"
tty_cyan="$(tty_mkbold 36)"
tty_bold="$(tty_mkbold 39)"
tty_reset="$(tty_escape 0)"

# printf "${tty_bold}${tty_underline}Example${tty_reset}\n"
# printf "${tty_yellow}Example${tty_reset}\n"
# printf "${tty_blue}Example${tty_reset}\n"
# printf "${tty_red}Example${tty_reset}\n"

shell_join() {
    local arg
    printf "%s" "$1"
    shift
    for arg in "$@"; do
        printf " "
        printf "%s" "${arg// /\ }"
    done
}

execute() {
    if ! "$@"; then
        abort "$(printf "Failed during: %s" "$(shell_join "$@")")"
    fi
}

chomp() {
    printf "%s" "${1/"$'\n'"/}"
}

prompt() {
    printf "${tty_blue}==>${tty_bold} %s${tty_reset}\n" "$(shell_join "$@")"
}

warn() {
    printf "${tty_yellow}Warning${tty_reset}: %s\n" "$(chomp "$1")"
}

getc() {
    local save_state
    save_state="$(/bin/stty -g)"
    /bin/stty raw -echo
    IFS='' read -r -n 1 -d '' "$@"
    /bin/stty "${save_state}"
}

ring_bell() {
    # Use the shell's audible bell.
    if [[ -t 1 ]]; then
        printf "\a"
    fi
}

wait_for_user() {
    local c
    echo
    echo "Press ${tty_bold}RETURN${tty_reset}/${tty_bold}ENTER${tty_reset} to continue or any other key to abort..."
    getc c
    # we test for \r and \n because some stuff does \r instead
    if ! [[ "${c}" == $'\r' || "${c}" == $'\n' ]]; then
        echo "${tty_red}Aborted.${tty_reset}"
        exit 1
    fi
}

######################################################################
#                          Git repo update                           #
######################################################################
# HACK: https://stackoverflow.com/a/3278427/9268330
check_git_update() {
    UPSTREAM=${1:-'@{u}'} # optionally to pass an upstream branch explicitly. if none, use origin/main
    LOCAL=$(git rev-parse @)
    REMOTE=$(git rev-parse "$UPSTREAM")
    BASE=$(git merge-base @ "$UPSTREAM")

    if [ "$LOCAL" = "$REMOTE" ]; then
        # printf "Up-to-date\n"
        echo false
    elif [ "$LOCAL" = "$BASE" ]; then
        # printf "Need to pull\n"
        echo true
    elif [ "$REMOTE" = "$BASE" ]; then
        # printf "Need to push\n"
        echo false
    else
        # printf "Diverged\n"
        echo false
    fi
}

######################################################################
#                       Github release update                        #
######################################################################
# HACK: https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
get_latest_release() {
    curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                             # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                     # Pluck JSON value
}

# HACK: https://stackoverflow.com/a/37939589/9268330
cat_ver() {
    echo "$@" | awk -F. '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'
}

is_latest() {
    if [ "$(cat_ver "${1}")" -eq "$(cat_ver "${2}")" ]; then
        # printf "${tty_green}Up to date${tty_reset}.\n"
        echo true
    elif [ "$(cat_ver "${1}")" -gt "$(cat_ver "${2}")" ]; then
        # printf "${tty_cyan}Outdated${tty_reset}.\n"
        echo false
    else
        abort "${tty_red}Something is wrong. Please check the scripts or the original repo.${tty_reset}"
    fi
}
