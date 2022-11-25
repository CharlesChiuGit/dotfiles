#!/usr/bin/env bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

######################################################################
#                    Lua/LuaJIT/Luarocks Install                     #
######################################################################
LUA_DIR=$HOME/tools/lua
LUA_SRC_NAME=$HOME/packages/lua.tar.gz
LUA_LINK="http://www.lua.org/ftp/lua-5.4.4.tar.gz"
if [[ ! -f "$LUA_DIR/src/lua" ]]; then
    echo "Install Lua"
    if [[ ! -f $LUA_SRC_NAME ]]; then
        echo "Downloading lua and renaming"
        wget $LUA_LINK -O "$LUA_SRC_NAME"
    fi

    if [[ ! -d "$LUA_DIR" ]]; then
        echo "Creating Lua directory under tools directory"
        mkdir -p "$LUA_DIR"
        echo "Extracting to $HOME/tools/lua directory"
        tar xvf "$LUA_SRC_NAME" -C "$LUA_DIR" --strip-components 1
        cd "$LUA_DIR"
        make all test
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
alias lua='~/tools/lua/src/lua'
export PATH="$PATH:$HOME/tools/lua/src"
EOT
    fi
else
    printf "${tty_blue}Lua${tty_reset} is already installed, skip it.\n"
fi

LUAJIT_DIR=$HOME/tools/luajit
LUAJIT_SRC_NAME=$HOME/packages/luajit.tar.gz
LUAJIT_LINK="https://luajit.org/download/LuaJIT-2.0.5.tar.gz"
if [[ ! -f "$LUAJIT_DIR/src/luajit" ]]; then
    echo "Install LuaJIT"
    if [[ ! -f $LUAJIT_SRC_NAME ]]; then
        echo "Downloading LuaJIT and renaming"
        wget $LUAJIT_LINK -O "$LUAJIT_SRC_NAME"
    fi

    if [[ ! -d "$LUAJIT_DIR" ]]; then
        echo "Creating LuaJIT directory under tools directory"
        mkdir -p "$LUAJIT_DIR"
        echo "Extracting to $HOME/tools/luajit directory"
        tar xvf "$LUAJIT_SRC_NAME" -C "$LUAJIT_DIR" --strip-components 1
        cd "$LUAJIT_DIR"
        make
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
alias luajit='~/tools/luajit/src/luajit'
export PATH="$PATH:$HOME/tools/luajit/src"
export LUA_LIBRARY="$HOME/tools/luajit/src/libluajit.so"
EOT
    fi
else
    printf "\t${tty_blue}LuaJIT${tty_reset} is already installed, skip it.\n"
fi

LUAROCKS_DIR=$HOME/tools/luarocks
LUAROCKS_SRC_NAME=$HOME/packages/luarocks.tar.gz
LUAROCKS_LINK="https://luarocks.org/releases/luarocks-3.9.1.tar.gz"
if [[ ! -f "$LUAROCKS_DIR/luarocks" ]]; then
    echo "Install luarocks"
    if [[ ! -f $LUAROCKS_SRC_NAME ]]; then
        echo "Downloading luarocks and renaming"
        wget $LUAROCKS_LINK -O "$LUAROCKS_SRC_NAME"
    fi

    if [[ ! -d "$LUAROCKS_DIR" ]]; then
        echo "Creating luarocks directory under tools directory"
        mkdir -p "$LUAROCKS_DIR"
        echo "Extracting to $HOME/tools/luarocks directory"
        tar xvf "$LUAROCKS_SRC_NAME" -C "$LUAROCKS_DIR" --strip-components 1
        cd "$LUAROCKS_DIR"
        export PATH="$PATH:$HOME/tools/lua/src"
        ./configure --prefix="$LUAROCKS_DIR" --lua-version=5.4 --with-lua-include="$LUA_DIR/src"
        make
    fi

    if [[ "$ADD_TO_SYSTEM_PATH" = true ]]; then
        cat <<EOT >>"$RC_FILE"
alias luarocks='~/tools/luarocks/luarocks'
export PATH="$PATH:$HOME/tools/luarocks"
EOT
    fi
else
    printf "\t${tty_blue}Luarocks${tty_reset} is already installed, skip it.\n"
fi

cd ~/dotfiles/install_scripts/
