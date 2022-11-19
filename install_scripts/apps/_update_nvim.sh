#!/bin/bash
# INFO: https://dywang.csie.cyut.edu.tw/dywang/linuxProgram/node61.html

if [[ ! -d "$HOME/packages/" ]]; then
    mkdir -p "$HOME/packages/"
fi

if [[ ! -d "$HOME/tools/" ]]; then
    mkdir -p "$HOME/tools/"
fi

######################################################################
#                           Update Neovim                            #
######################################################################
NVIM_DIR=$HOME/tools/nvim
NVIM_SRC_NAME=$HOME/packages/nvim-linux64.tar.gz
NVIM_LINK="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz"

echo "Updating Nvim"
echo "Removing old Nvim binary"
rm "$NVIM_SRC_NAME"
rm -r "$NVIM_DIR"

if [[ ! -d "$NVIM_DIR" ]]; then
    echo "Creating nvim directory under tools directory"
    mkdir -p "$NVIM_DIR"
fi

if [[ ! -f $NVIM_SRC_NAME ]]; then
    echo "Downloading Nvim"
    wget "$NVIM_LINK" -O "$NVIM_SRC_NAME"
fi
echo "Extracting neovim"
tar zxvf "$NVIM_SRC_NAME" --strip-components 1 -C "$NVIM_DIR"

if [[ ! -d ~/.local/share/nvim/site/pack/packer/opt/packer.nvim ]]; then
    echo "Installing packer.nvim"
    git clone --depth=1 https://github.com/wbthomason/packer.nvim \
        ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
fi

echo "Updating nvim plugins, please wait"
"$NVIM_DIR/bin/nvim" -c "autocmd User PackerComplete quitall" -c "PackerSync"

echo "Finished updating Nvim and its dependencies!"
