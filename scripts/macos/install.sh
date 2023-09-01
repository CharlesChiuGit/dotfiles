#!/bin/sh

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install cli-tools
brew install wget
brew install curl
brew install git
brew install sheldon
brew install starship
brew install lsd
brew install fzf
brew install bat
brew install zoxide
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
brew install lazydocker
brew install lazygit
brew install git-delta
brew install dua-cli
brew install fzy
brew install ripgrep
brew install sd
brew install xh
brew install xq
brew install neovim
brew install btop
brew install zellij
brew install topgrade
brew install procs
brew install tokei
brew install ripsecrets
brew install eva
brew install jdx/tap/rtx

# Install gui-tools
brew install brew-cask-completion
brew install --cask raycast
brew install --cask cron
brew install --cask arc
brew install --cask hey
brew install --cask discord
brew install --cask logseq
brew install --cask obsidian
brew install --cask logi-options-plus
brew install —-cask appcleaner
brew install --cask cheatsheet
brew install --cask raindropio
brew install --cask steam
brew install --cask cider
brew install --cask iina
brew install --cask wezterm

# Install langs
rtx install node@16.16.0
rtx install python@3.11.5
brew install libyaml && rtx install ruby@3.2.2
rtx install go@1.20.7
rtx install java@openjdk-21
rtx install rust@1.72.0
rtx reshim

# Install extras
# th-ch/youtube-music
wget -P ~/Downloads/ https://github.com/th-ch/youtube-music/releases/download/v1.20.0/YouTube-Music-1.20.0-arm64.dmg
# NOTE: `xattr -cr /Applications/YouTube\ Music.app`

# symlink configs
cargo install cargo-update
cargo install --git https://github.com/kamiyaa/joshuto.git --force
cargo install dt-cli
dt-cli -c "~/Workspace/dotfiles/cli-utils/dt/macos.toml"
bat cache --build

# Post macOS setup
## show all hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder
