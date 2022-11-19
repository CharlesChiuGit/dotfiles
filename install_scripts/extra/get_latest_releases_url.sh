#!/usr/bin/env bash
# INFO: https://dywang.csie.cyut.edu.tw/dywang/linuxProgram/node61.html
set -exu
# set -o pipefail

# Get platfrom, ie. x86_64
# tmp_PLATFORM=$(uname -i)
# PLATFORM=$(tr -d '_' <<< "$tmp_PLATFORM")
PLATFORM='64 x8664'
echo "$PLATFORM"

# Get os, ie. GNU/Linux
tmp_OS=$(uname -o)
OS=$(cut -d "/" -f 2 <<<"$tmp_OS")
echo "$OS"

# Get architecture
ARCH=$(dpkg --print-architecture)
echo "$ARCH"

# Set filter words
FILTER='!gnu !freebsd !sha256 !asc !darwin'

get_latest_release() {
    REPO="$1"
    SUFFIX="$2"
    LIBC="$3"
    if [[ ! "$SUFFIX" = '' ]] && [[ ! "$LIBC" = '' ]]; then
        curl -s "https://api.github.com/repos/$REPO/releases/latest" |
        grep "browser_download_url.*$SUFFIX" |
        fzf --query="$SUFFIX $PLATFORM $OS $ARCH $LIBC $FILTER" -i --no-multi --select-1 --exit-0 |
        cut -d '"' -f 4 \
            >>latest_releases_url.txt
    elif [[ ! "$SUFFIX" = '' ]] && [[ "$LIBC" = '' ]]; then
        curl -s "https://api.github.com/repos/$REPO/releases/latest" |
        grep "browser_download_url.*$SUFFIX" |
        fzf --query="$SUFFIX $PLATFORM $OS $ARCH $FILTER" -i --no-multi --select-1 --exit-0 |
        cut -d '"' -f 4 \
            >>latest_releases_url.txt
    elif [[ "$SUFFIX" = '' ]] && [[ "$LIBC" = '' ]]; then
        curl -s "https://api.github.com/repos/$REPO/releases/latest" |
        grep "browser_download_url" |
        fzf --query="$PLATFORM $OS $ARCH $FILTER" -i --no-multi --select-1 --exit-0 |
        cut -d '"' -f 4 \
            >>latest_releases_url.txt
    fi
}

# for repos have strange url after grep browser_download_url
get_latest_release_custom() {
    REPO="$1"
    SUFFIX="$2"
    PATTERN="$3"
    if [[ ! "$SUFFIX" = '' ]]; then
        curl -s "https://api.github.com/repos/$REPO/releases/latest" |
        grep "browser_download_url.*$SUFFIX" |
        fzf --query="$SUFFIX $PATTERN $FILTER" -i --no-multi --select-1 --exit-0 |
        cut -d '"' -f 4 \
            >>latest_releases_url.txt
    elif [[ "$SUFFIX" = '' ]]; then
        curl -s "https://api.github.com/repos/$REPO/releases/latest" |
        grep "browser_download_url" |
        fzf --query="$PATTERN $FILTER" -i --no-multi --select-1 --exit-0 |
        cut -d '"' -f 4 \
            >>latest_releases_url.txt
    fi
}

get_latest_release 'BurntSushi/ripgrep' 'tar.gz' 'musl'
get_latest_release 'Byron/dua-cli' 'tar.gz' 'musl'
get_latest_release 'Dr-Noob/cpufetch' '' ''
# get_latest_release 'Peltoche/lsd' 'tar.gz' 'musl'
get_latest_release 'ajeetdsouza/zoxide' 'tar.gz' 'musl'
get_latest_release 'aristocratos/btop' 'tbz' 'musl'
get_latest_release 'charmbracelet/glow' 'tar.gz' ''
get_latest_release 'dandavison/delta' 'tar.gz' 'musl'
get_latest_release 'denisidoro/navi' 'tar.gz' 'musl'
get_latest_release 'jesseduffield/lazygit' 'tar.gz' ''
get_latest_release 'sharkdp/bat' 'tar.gz' 'musl'
get_latest_release 'sharkdp/fd' 'tar.gz' 'musl'
get_latest_release 'starship/starship' 'tar.gz' 'musl'

get_latest_release_custom 'Canop/broot' 'zip' ''
get_latest_release_custom 'atanunq/viu' '' '!aarch64'
get_latest_release_custom 'gokcehan/lf' 'tar.gz' "linux 'amd64"
get_latest_release_custom 'jhawthorn/fzy' 'tar.gz' ''
get_latest_release_custom 'sayanarijit/xplr' 'tar.gz' 'linux musl'
get_latest_release_custom 'tmux/tmux' 'tar.gz' ''
get_latest_release_custom 'tree-sitter/tree-sitter' 'gz' 'linux x64'
get_latest_release_custom 'tstack/lnav' 'zip' 'musl'
