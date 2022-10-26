#!/bin/bash

sudo apt remove camke -y && rm -f /usr/bin/cmake

wget -c https://github.com/Kitware/CMake/releases/download/v3.23.4/cmake-3.23.4-linux-x86_64.tar.gz
tar xvf cmake-3.23.4-linux-x86_64.tar.gz
cd "$(pwd)/cmake-3.23.4-linux-x86_64" || exit
./bootstrap
gmake
gmake install
sudo ln -s /usr/local/bin/cmake /usr/bin/
cmake --version
