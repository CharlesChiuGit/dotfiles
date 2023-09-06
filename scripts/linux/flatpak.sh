#!/usr/bin/bash

if [ -f /etc/os-release ]; then
	# freedesktop.org and systemd
	. /etc/os-release
	OS=$NAME
	VER=$VERSION_ID
fi

if [[ -z $(command -v flatpak) ]]; then
	echo "Install Flatpak"
	if [[ $OS == "Arch Linux" ]]; then
		sudo pacman -S flatpak
	elif [[ $OS == "Ubuntu" ]]; then
		sudo apt install flatpak
		flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
	fi
else
	printf "${tty_blue}Flatpak${tty_reset} is already installed, skip it.\n"
fi

flatpaks=(
	"com.discordapp.Discord"
	"com.google.Chrome"
	"com.logseq.Logseq"
	"com.visualstudio.code"
	"md.obsidian.Obsidian"
	"org.fcitx.Fcitx5"
	"org.fcitx.Fcitx5.Addon.McBopomofo"
	"org.flameshot.Flameshot"
	"org.mozilla.firefox"
	"org.telegram.desktop"
	"sh.cider.Cider"

)
for i in "${flatpaks[@]}"; do
	flatpak install flathub $i
done
