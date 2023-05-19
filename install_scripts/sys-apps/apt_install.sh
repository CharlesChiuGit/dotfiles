#!/usr/bin/env bash

# NOTE: use sudo sh script.sh to run scripts with sudo privileges.

sudo apt install nala -y

# Essential packages
sudo nala install ssh vim htop git curl clang biber tree ninja-build \
	make cmake build-essential software-properties-common mercurial binutils bison re2c \
	python3-apt python3-pip python3-dev python3-setuptools python3.10-venv \
	pandoc highlight gzip tar plocate pkg-config bzip2 openssl unzip \
	libxml2-dev libevent-dev libbz2-dev libcurl4-openssl-dev libpng-dev libssl-dev \
	libjpeg-dev libonig-dev libtidy-dev libxslt1-dev libzip-dev libstdc++6 \
	autoconf libyaml-dev libreadline-dev zlib1g-dev libncurses5-dev \
	libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev sqlite3 libsqlite3-dev \
	libfreetype6-dev librsvg2-dev libtiff5-dev libwebp-dev libtool gtk-doc-tools \
	libimage-exiftool-perl atool libmagic-dev \
	libx11-dev libxmu-headers libxt-dev libxmu-dev -y

# Cool stuff
sudo nala install neofetch hollywood cmatrix jp2a speedtest-cli toilet -y

# Ranger utils support
sudo nala install caca-utils ffmpeg librsvg2-bin atool unrar p7zip-full p7zip-rar -y

# system pip3 install
sudo pip3 install pynvim gdown ntfy[emoji] asciinema

# WSL: install kitty
# sudo apt install libgles2-mesa libgles2-mesa-dev -y

# Alacritty dependencies
sudo nala install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y

# ugrep dependencies
sudo nala install libpcre2-dev libz-dev libbz2-dev liblzma-dev liblz4-dev libzstd-dev -y

# lldb: c/cpp/rust debugger
sudo nala install lldb -y

# silicon
sudo nala install expat -y
sudo nala install libxml2-dev -y
sudo nala install pkg-config libasound2-dev libssl-dev cmake libfreetype6-dev libexpat1-dev libxcb-composite0-dev libharfbuzz-dev -y

# fcitx5
sudo nala install fcitx5 -y
sudo nala install fcitx5-frontend-gtk2 fcitx5-frontend-gtk3 fcitx5-frontend-gtk4 -y
sudo nala install fcitx5-config-qt fcitx5-frontend-qt5 -y
## chinese input method
sudo nala install fcitx5-chinese-addons fcitx5-chewing
## fcitx5-mcbopomofo is a better one if fcitx5-chewing is having issues.
## https://github.com/openvanilla/fcitx5-mcbopomofo

# logiops
sudo nala install build-essential cmake pkg-config libevdev-dev libudev-dev libconfig++-dev libglib2.0-dev -y
