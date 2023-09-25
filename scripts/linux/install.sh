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
	"xdg-ninja"
	"xh"
	"xq"
	"zellij"
	"zoxide"
)
for i in "${cli_tools[@]}"; do
	brew install $i
done

# Instal zap-zsh
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

# Install langs
rtx plugin install rust https://github.com/code-lever/asdf-rust
langs=(
	"node@20.7.0"
	"python@3.11.5"
	"ruby@3.2.2"
	"go@1.21.1"
	"java@openjdk-21"
	"rust@1.72.1"
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

# symlink configs
dt-cli -c "$HOME/dotfiles/cli-utils/dt/linux.toml"

# misc
bat cache --build
fc-cache -f -v
