#!/bin/bash

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

# Add extra tap
repos=(
	"homebrew/cask-fonts"
	"alienator88/homebrew-cask"
)
for i in "${repos[@]}"; do
	brew tap "$i"
done

# Install cli-tools
cli_tools=(
	"bat"
	"brew-cask-completion"
	"btop"
	"curl"
	"dua-cli"
	"eva"
	"eza"
	"fd"
	"fzf"
	"fzy"
	"git"
	"git-delta"
	"jdx/tap/rtx"
	"lazydocker"
	"lazygit"
	"libmagic"
	"libyaml"
	"lnav"
	"lsd"
	"neovim"
	"openssl"
	"poppler"
	"ripgrep"
	"ripsecrets"
	"sd"
	"sqlite"
	"tokei"
	"topgrade"
	"tree-sitter"
	"wget"
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

# Install gui-tools
gui_tools=(
	"alt-tab"
	"arc"
	"cider"
	"cron"
	"discord"
	"dropzone"
	"font-jetbrains-mono-nerd-font"
	"hey"
	"hiddenbar"
	"hot"
	"iina"
	"itsycal"
	"linear-linear"
	"logi-options-plus"
	"logseq"
	"obsidian"
	"pearcleaner"
	"raindropio"
	"raycast"
	"stats"
	"steam"
	"visual-studio-code"
	"wezterm"
)

# Installed cask list
cask_list=$(brew list --cask)

for i in "${gui_tools[@]}"; do
	if [[ $cask_list =~ (^|[[:space:]])$i($|[[:space:]]) ]]; then
		echo "$i is already installed, skip it."
	else
		brew install --cask "$i"
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
	rtx use -g "$i"
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

# Install extras
if ! (find -x /Applications -type d -name YouTube\ Music.app) &>/dev/null; then
	echo "th-ch/YouTube-Music is not installed!"
	wget -P ~/Downloads/ https://github.com/th-ch/youtube-music/releases/download/v1.20.0/YouTube-Music-1.20.0-arm64.dmg
	sudo hdiutil attach ~/Downloads/YouTube-Music-1.20.0-arm64.dmg
	sudo cp -rf /Volumes/YouTube\ Music\ 1.20.0-arm64 /Applications
	sudo hdiutil detach /Volumes/YouTube\ Music\ 1.20.0-arm64
	xattr -cr /Applications/YouTube\ Music.app
fi
# install vChewing-macOS
# https://github.com/vChewing/vChewing-macOS/releases

# symlink configs
dt-cli -c "$HOME/dotfiles/cli-utils/dt/macos.toml"
rtx trust ~/.config/rtx/config.toml

# misc
bat cache --build
mkdir -p ~/.local/state/zsh
mkdir -p ~/.local/share/less

# Post macOS setup
## show all hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder
