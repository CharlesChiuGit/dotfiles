#!/bin/bash
# shellcheck disable=SC2059,SC2154
set -e
set -o pipefail

# Install brew
######################################################################
#                           Brew Install                             #
######################################################################
if [[ -z $(command -v brew) ]]; then
	echo "Install Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	printf 'Homebrew is already installed, skip it.\n'
fi

# Install cli-tools
cli_tools=(
	"bat"
	"btop"
	"dua-cli"
	"eva"
	"eza"
	"fd"
	"fzf"
	"fzy"
	"git-delta"
	"jdx/tap/rtx"
	"lazydocker"
	"lazygit"
	"libmagic"
	"libyaml"
	"lnav"
	"lsd"
	"neovim"
	"poppler"
	"ripgrep"
	"ripsecrets"
	"sd"
	"starship"
	"tokei"
	"topgrade"
	"tree-sitter"
	"xdg-ninja"
	"xh"
	"xq"
	"zellij"
	"zoxide"
)

# Installed formulae list
form_list=$(brew list --formulae)

for i in "${cli_tools[@]}"; do
	if [[ $form_list =~ (^|[[:space:]])$i($|[[:space:]]) ]]; then
		echo "$i is already installed, skip it."
	else
		brew install "$i"
	fi
done

# Install langs
langs=(
	"node@20.7.0"
	"python@3.11.5"
	"ruby@3.2.2"
	"go@1.21.1"
	"java@openjdk-21"
)
for i in "${langs[@]}"; do
	rtx install "$i"
done
rtx reshim

# Install rustup
if [[ -z "$(command -v rustup)" ]]; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
	source "$HOME/.local/share/cargo/env"
else
	printf "Rustup is already installed, skip it.\n"
fi

# cargo install
cargo_pkg=(
	"cargo-update"
	"cargo-cache"
	"dt-cli"
)
for i in "${cargo_pkg[@]}"; do
	cargo install "$i" -j 4 --locked
done

cargo_repo=(
	"https://github.com/mmacedoeu/termpix.git"
	"https://github.com/kamiyaa/joshuto.git"
)
for i in "${cargo_repo[@]}"; do
	cargo install --git "$i" -j 4 --force --locked
done

# go install
_homebrew_prefix=$(brew --prefix)
export HOMEBREW_PREFIX=_homebrew_prefix
if [[ -z $(command -v pistol) ]]; then
	echo "Install Pistol"
	CGO_CFLAGS="-I${HOMEBREW_PREFIX}/include" CGO_LDFLAGS="-L${HOMEBREW_PREFIX}/lib" go install github.com/doronbehar/pistol/cmd/pistol@latest
else
	printf 'Pistol is already installed, skip it.\n'
fi

# symlink configs
dt-cli -c "$HOME/dotfiles/cli-utils/dt/linux.toml"

# Install flatpak
if [ -f /etc/os-release ]; then
	# freedesktop.org and systemd
	. /etc/os-release
	OS=$NAME
	# VER=$VERSION_ID
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
	printf "Flatpak is already installed, skip it.\n"
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
	sudo flatpak install flathub "$i" -y
done

# misc
bat cache --build
fc-cache -f -v
