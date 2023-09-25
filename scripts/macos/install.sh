#!/bin/bash

# Install brew
######################################################################
#                           Brew Install                             #
######################################################################
if [[ -z $(command -v brew) ]]; then
	echo "Install Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	printf "${tty_blue}Homebrew${tty_reset} is already installed, skip it.\n"
fi

# Add extra repo
repos=(
	"homebrew/cask-fonts"
)
for i in "${repos[@]}"; do
	brew tap $i
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
	"neovim"
	"poppler"
	"ripgrep"
	"ripsecrets"
	"sd"
	"tokei"
	"topgrade"
	"wget"
	"xdg-ninja"
	"xh"
	"xq"
	"zellij"
	"zoxide"
	"lsd"
	"gawk"
	"grep"
)
for i in "${cli_tools[@]}"; do
	brew install $i
done

# Install gui-tools
gui_tools=(
	"appcleaner"
	"arc"
	"cider"
	"cron"
	"discord"
	"font-jetbrains-mono-nerd-font"
	"hey"
	"iina"
	"logi-options-plus"
	"logseq"
	"obsidian"
	"raindropio"
	"raycast"
	"steam"
	"wezterm"
	"visual-studio-code"
)
for i in "${gui_tools[@]}"; do
	brew install --cask $i
done

# Instal zap-zsh
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

# Install langs
rtx plugin install rust https://github.com/code-lever/asdf-rust
langs=(
	"node@20.6.0"
	"python@3.11.5"
	"ruby@3.2.2"
	"go@1.20.7"
	"java@openjdk-21"
	"rust@1.72.0"
)
for i in "${langs[@]}"; do
	rtx install $i
done
rtx reshim

# cargo install
cargo_repo=(
	"https://github.com/nabijaczleweli/cargo-update.git"
	"https://github.com/matthiaskrgr/cargo-cache.git cargo-cache"
	"https://github.com/kamiyaa/joshuto.git"
	"https://github.com/blurgyy/dt.git dt-cli"
	"https://github.com/mmacedoeu/termpix.git"
)
for i in "${cargo_repo[@]}"; do
	cargo install --git $i --locked
done

# go install
export HOMEBREW_PREFIX=$(brew --prefix)
CGO_CFLAGS="-I${HOMEBREW_PREFIX}/include" CGO_LDFLAGS="-L${HOMEBREW_PREFIX}/lib" go install github.com/doronbehar/pistol/cmd/pistol@latest

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
