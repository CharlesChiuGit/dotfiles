#!/bin/bash

# place zap-zsh config
if [[ -f ~/.zshenv ]]; then
	echo "Backup ~/.zshenv to ~/.zshenv.bak"
	mv ~/.zshenv ~/.zshenv.bak
fi
cp ~/dotfiles/core-utils/zsh_tmp/.zshenv ~
cp -r ~/dotfiles/core-utils/zsh/zsh ~/.config/

# make sure zsh is default shell
chsh -s "$(which zsh)"

# Instal zap-zsh
if command -v zap &>/dev/null; then
	echo "Install zap-zsh"
	zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
else
	printf 'zap-zsh is already installed, skip it.\n'
fi
