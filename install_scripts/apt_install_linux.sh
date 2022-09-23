#!/usr/bin/env bash

# NOTE: use sudo sh script.sh to run scripts with sudo privileges.

sudo apt install nala -y

# Essential packages
sudo nala install ssh vim htop git curl clang latexmk biber \
make cmake build-essential software-properties-common mercurial binutils bison re2c \
python3-apt python3-pip python3-dev python3-setuptools python3.10-venv \
pandoc highlight gzip tar plocate pkg-config bzip2 openssl unzip \
libxml2-dev libevent-dev libbz2-dev libcurl4-openssl-dev libpng-dev libssl-dev \
libjpeg-dev libonig-dev libtidy-dev libxslt-dev libzip-dev libstdc++6 \
autoconf libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev \
libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev libsqlite3-dev \
libfreetype6-dev librsvg2-dev libtiff5-dev libwebp-dev libtool gtk-doc-tools \
libimage-exiftool-perl atool libmagic-dev -y

# Cool stuff
# sudo nala install neofetch hollywood cmatrix jp2a speedtest-cli -y

# Ranger utils support
sudo nala install caca-utils imagemagick ffmpeg librsvg2-bin atool unrar p7zip-full p7zip-rar -y

# Snap install
sudo snap install cpufetch ascii-image-converter lolcat

# system pip3 install
sudo pip3 install pynvim yarp thefuck gdown ntfy[emoji] asciinema

# WSL: install kitty
# sudo apt install libgles2-mesa libgles2-mesa-dev -y
