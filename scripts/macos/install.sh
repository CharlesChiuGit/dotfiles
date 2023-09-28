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

# Add extra repo
repos=(
	"homebrew/cask-fonts"
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
	"stats"
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
for i in "${cli_tools[@]}"; do
	brew install "$i"
done

# Install gui-tools
gui_tools=(
	"appcleaner"
	"arc"
	"cider"
	"cron"
	"discord"
	"dropzone"
	"font-jetbrains-mono-nerd-font"
	"hey"
	"hiddenbar"
	"iina"
	"logi-options-plus"
	"logseq"
	"maccy"
	"obsidian"
	"raindropio"
	"raycast"
	"steam"
	"visual-studio-code"
	"wezterm"
)
for i in "${gui_tools[@]}"; do
	brew install --cask "$i"
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
# CGO_CFLAGS="-I${HOMEBREW_PREFIX}/include" CGO_LDFLAGS="-L${HOMEBREW_PREFIX}/lib" go install github.com/doronbehar/pistol/cmd/pistol@latest

# Install extras
if ! (find -x /Applications -type d -name YouTube\ Music.app) &>/dev/null; then
	echo "th-ch/YouTube-Music is not installed!"
	wget -P ~/Downloads/ https://github.com/th-ch/youtube-music/releases/download/v1.20.0/YouTube-Music-1.20.0-arm64.dmg
	sudo hdiutil attach ~/Downloads/YouTube-Music-1.20.0-arm64.dmg
	sudo cp -rf /Volumes/YouTube\ Music\ 1.20.0-arm64 /Applications
	sudo hdiutil detach /Volumes/YouTube\ Music\ 1.20.0-arm64
	xattr -cr /Applications/YouTube\ Music.app
fi

# symlink configs
dt-cli -c "$HOME/dotfiles/cli-utils/dt/macos.toml"

# misc
bat cache --build

# Post macOS setup
## show all hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder
