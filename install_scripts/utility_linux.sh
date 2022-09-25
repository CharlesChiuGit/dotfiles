#!/usr/bin/env bash
# INFO: https://dywang.csie.cyut.edu.tw/dywang/linuxProgram/node61.html
set -eu
set -o pipefail

# Whether to add the path of the installed executables to system PATH
ADD_TO_SYSTEM_PATH=true

# select which shell we are using
USE_BASH_SHELL=true

if [[ ! -d "$HOME/packages/" ]]; then
	mkdir -p "$HOME/packages/"
fi

if [[ ! -d "$HOME/tools/" ]]; then
	mkdir -p "$HOME/tools/"
fi

#######################################################################
#                           statship part                             #
#######################################################################
STARSHIP_DIR=$HOME/tools/starship
STARSHIP_SRC_NAME=$HOME/packages/starship.tar.gz
STARSHIP_LINK="https://github.com/starship/starship/releases/download/v1.10.3/starship-x86_64-unknown-linux-gnu.tar.gz"
if [[ -z "$(command -v starship)" ]]; then
	echo "Install starship"
	if [[ ! -f $STARSHIP_SRC_NAME ]]; then
		echo "Downloading starship and renaming"
		wget $STARSHIP_LINK -O "$STARSHIP_SRC_NAME"
	fi

	if [[ ! -d "$STARSHIP_DIR" ]]; then
		echo "Creating starship directory under tools directory"
		mkdir -p "$STARSHIP_DIR"
		echo "Extracting to $HOME/tools/starship directory"
		tar zxvf "$STARSHIP_SRC_NAME" -C "$STARSHIP_DIR"
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$STARSHIP_DIR:\$PATH\"" >>"$HOME/.bashrc"
		export PATH="$STARSHIP_DIR:$PATH"
	fi

	# # set up manpath and zsh completion for batcat
	# mkdir -p $HOME/tools/ripgrep/doc/man/man1
	# mv $HOME/tools/ripgrep/doc/rg.1 $HOME/tools/ripgrep/doc/man/man1

else
	echo "starship is already installed. Skip installing it."
fi

#######################################################################
#                              btop part                              #
#######################################################################
BTOP_DIR=$HOME/tools/btop
BTOP_SRC_NAME=$HOME/packages/btop.tbz
BTOP_LINK="https://github.com/aristocratos/btop/releases/download/v1.2.9/btop-x86_64-linux-musl.tbz"
if [[ -z "$(command -v btop)" ]]; then
	echo "Install btop"
	if [[ ! -f $BTOP_SRC_NAME ]]; then
		echo "Downloading btop and renaming"
		wget $BTOP_LINK -O "$BTOP_SRC_NAME"
	fi

	if [[ ! -d "$BTOP_DIR" ]]; then
		echo "Creating btop directory under tools directory"
		mkdir -p "$BTOP_DIR"
		echo "Extracting to $HOME/tools/btop directory"
		tar xjf "$BTOP_SRC_NAME" -C "$BTOP_DIR"
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$BTOP_DIR/bin:\$PATH\"" >>"$HOME/.bashrc"
		export PATH="$BTOP_DIR/bin:$PATH"
	fi

	# # set up manpath and zsh completion for batcat
	# mkdir -p $HOME/tools/ripgrep/doc/man/man1
	# mv $HOME/tools/ripgrep/doc/rg.1 $HOME/tools/ripgrep/doc/man/man1

else
	echo "btop is already installed. Skip installing it."
fi

#######################################################################
#                            batcat part                             #
#######################################################################
BATCAT_DIR=$HOME/tools/batcat
BATCAT_SRC_NAME=$HOME/packages/batcat.tar.gz
BATCAT_LINK="https://github.com/sharkdp/bat/releases/download/v0.22.1/bat-v0.22.1-x86_64-unknown-linux-musl.tar.gz"
if [[ -z "$(command -v bat)" ]] && [[ ! -f "$BATCAT_DIR/bat" ]]; then
	echo "Install batcat"
	if [[ ! -f $BATCAT_SRC_NAME ]]; then
		echo "Downloading batcat and renaming"
		wget $BATCAT_LINK -O "$BATCAT_SRC_NAME"
	fi

	if [[ ! -d "$BATCAT_DIR" ]]; then
		echo "Creating batcat directory under tools directory"
		mkdir -p "$BATCAT_DIR"
		echo "Extracting to $HOME/tools/batcat directory"
		tar zxvf "$BATCAT_SRC_NAME" -C "$BATCAT_DIR" --strip-components 1
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$BATCAT_DIR:\$PATH\"" >>"$HOME/.bashrc"
		export PATH="$BATCAT_DIR:$PATH"
	fi

	# # set up manpath and zsh completion for batcat
	# mkdir -p $HOME/tools/ripgrep/doc/man/man1
	# mv $HOME/tools/ripgrep/doc/rg.1 $HOME/tools/ripgrep/doc/man/man1

else
	echo "batcat is already installed. Skip installing it."
fi

#######################################################################
#                              cpufetch part                              #
#######################################################################
CPUFETCH_DIR=$HOME/tools/cpufetch
CPUFETCH_LINK="https://github.com/Dr-Noob/cpufetch/releases/download/v1.02/cpufetch_x86-64_linux"
if [[ -z "$(command -v cpufetch)" ]]; then
	echo "Install cpufetch"

	if [[ ! -d "$CPUFETCH_DIR" ]]; then
		echo "Creating cpufetch directory under tools directory"
		mkdir -p "$CPUFETCH_DIR"
		echo "Download to $HOME/tools/cpufetch directory"
    wget "$CPUFETCH_LINK" -O "$CPUFETCH_DIR/cpufetch"
    chmod +x "$CPUFETCH_DIR/cpufetch"
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$CPUFETCH_DIR:\$PATH\"" >>"$HOME/.bashrc"
		export PATH="$CPUFETCH_DIR:$PATH"
	fi

	# # set up manpath and zsh completion for batcat
	# mkdir -p $HOME/tools/ripgrep/doc/man/man1
	# mv $HOME/tools/ripgrep/doc/rg.1 $HOME/tools/ripgrep/doc/man/man1

else
	echo "cpufetch is already installed. Skip installing it."
fi

#######################################################################
#                            fdfind part                              #
#######################################################################
FDFIND_DIR=$HOME/tools/fdfind
FDFIND_SRC_NAME=$HOME/packages/fdfind.tar.gz
FDFIND_LINK="https://github.com/sharkdp/fd/releases/download/v8.4.0/fd-v8.4.0-x86_64-unknown-linux-musl.tar.gz"
if [[ -z "$(command -v fd)" ]] && [[ ! -f "$FDFIND_DIR/fd" ]]; then
	echo "Install fdfind"
	if [[ ! -f $FDFIND_SRC_NAME ]]; then
		echo "Downloading fdfind and renaming"
		wget $FDFIND_LINK -O "$FDFIND_SRC_NAME"
	fi

	if [[ ! -d "$FDFIND_DIR" ]]; then
		echo "Creating fdfind directory under tools directory"
		mkdir -p "$FDFIND_DIR"
		echo "Extracting to $HOME/tools/fdfind directory"
		tar zxvf "$FDFIND_SRC_NAME" -C "$FDFIND_DIR" --strip-components 1
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$FDFIND_DIR:\$PATH\"" >>"$HOME/.bashrc"
		export PATH="$FDFIND_DIR:$PATH"
	fi

else
	echo "fdfind is already installed. Skip installing it."
fi

#######################################################################
#                            fzf part                                 #
#######################################################################
FZF_DIR=$HOME/tools/fzf
FZF_SRC_NAME=$HOME/packages/fzf.tar.gz
FZF_LINK="https://github.com/junegunn/fzf/releases/download/0.33.0/fzf-0.33.0-linux_amd64.tar.gz"
if [[ -z "$(command -v fzf)" ]] && [[ ! -f "$FZF_DIR/fzf" ]]; then
	echo "Install fzf"
	if [[ ! -f $FZF_SRC_NAME ]]; then
		echo "Downloading fzf and renaming"
		wget $FZF_LINK -O "$FZF_SRC_NAME"
	fi

	if [[ ! -d "$FZF_DIR" ]]; then
		echo "Creating fzf directory under tools directory"
		mkdir -p "$FZF_DIR"
		echo "Extracting to $HOME/tools/fzf directory"
		tar zxvf "$FZF_SRC_NAME" -C "$FZF_DIR"
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$FZF_DIR:\$PATH\"" >>"$HOME/.bashrc"
		export PATH="$FZF_DIR:$PATH"
	fi

else
	echo "fzf is already installed. Skip installing it."
fi

#######################################################################
#                            fzy part                                 #
#######################################################################
FZY_DIR=$HOME/tools/fzy
FZY_SRC_NAME=$HOME/packages/fzy.tar.gz
FZY_LINK="https://github.com/jhawthorn/fzy/releases/download/1.0/fzy-1.0.tar.gz"
if [[ -z "$(command -v fzy)" ]] && [[ ! -f "$FZY_DIR/fzy" ]]; then
	echo "Install fzy"
	if [[ ! -f $FZY_SRC_NAME ]]; then
		echo "Downloading fzy and renaming"
		wget $FZY_LINK -O "$FZY_SRC_NAME"
	fi

	if [[ ! -d "$FZY_DIR" ]]; then
		echo "Creating fzy directory under tools directory"
		mkdir -p "$FZY_DIR"
		echo "Extracting to $HOME/tools/fzy directory"
		tar zxvf "$FZY_SRC_NAME" -C "$FZY_DIR" --strip-components 1
		make -C "$FZY_DIR"
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$FZY_DIR:\$PATH\"" >>"$HOME/.bashrc"
		export PATH="$FZY_DIR:$PATH"
	fi

else
	echo "fzy is already installed. Skip installing it."
fi

#######################################################################
#                      git-delta part                                 #
#######################################################################
GITDELTA_DIR=$HOME/tools/git-delta
GITDELTA_SRC_NAME=$HOME/packages/git-delta.tar.gz
GITDELTA_LINK="https://github.com/dandavison/delta/releases/download/0.14.0/delta-0.14.0-x86_64-unknown-linux-musl.tar.gz"
if [[ -z "$(command -v delta)" ]] && [[ ! -f "$GITDELTA_DIR/delta" ]]; then
	echo "Install git-delta"
	if [[ ! -f $GITDELTA_SRC_NAME ]]; then
		echo "Downloading git-delta and renaming"
		wget $GITDELTA_LINK -O "$GITDELTA_SRC_NAME"
	fi

	if [[ ! -d "$GITDELTA_DIR" ]]; then
		echo "Creating git-delta directory under tools directory"
		mkdir -p "$GITDELTA_DIR"
		echo "Extracting to $HOME/tools/git-delta directory"
		tar zxvf "$GITDELTA_SRC_NAME" -C "$GITDELTA_DIR" --strip-components 1
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$GITDELTA_DIR:\$PATH\"" >>"$HOME/.bashrc"
		export PATH="$GITDELTA_DIR:$PATH"
	fi

else
	echo "git-delta is already installed. Skip installing it."
fi

#######################################################################
#                           glow part                                 #
#######################################################################
GLOW_DIR=$HOME/tools/glow
GLOW_SRC_NAME=$HOME/packages/glow.tar.gz
GLOW_LINK="https://github.com/charmbracelet/glow/releases/download/v1.4.1/glow_1.4.1_linux_x86_64.tar.gz"
if [[ -z "$(command -v glow)" ]] && [[ ! -f "$GLOW_DIR/glow" ]]; then
	echo "Install glow"
	if [[ ! -f $GLOW_SRC_NAME ]]; then
		echo "Downloading glow and renaming"
		wget $GLOW_LINK -O "$GLOW_SRC_NAME"
	fi

	if [[ ! -d "$GLOW_DIR" ]]; then
		echo "Creating glow directory under tools directory"
		mkdir -p "$GLOW_DIR"
		echo "Extracting to $HOME/tools/glow directory"
		tar zxvf "$GLOW_SRC_NAME" -C "$GLOW_DIR"
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$GLOW_DIR:\$PATH\"" >>"$HOME/.bashrc"
		export PATH="$GLOW_DIR:$PATH"
	fi

else
	echo "glow is already installed. Skip installing it."
fi

#######################################################################
#                        lazygit part                                 #
#######################################################################
LAZYGIT_DIR=$HOME/tools/lazygit
LAZYGIT_SRC_NAME=$HOME/packages/lazygit.tar.gz
LAZYGIT_LINK="https://github.com/jesseduffield/lazygit/releases/download/v0.35/lazygit_0.35_Linux_x86_64.tar.gz"
if [[ -z "$(command -v lazygit)" ]] && [[ ! -f "$LAZYGIT_DIR/lazygit" ]]; then
	echo "Install lazygit"
	if [[ ! -f $LAZYGIT_SRC_NAME ]]; then
		echo "Downloading lazygit and renaming"
		wget $LAZYGIT_LINK -O "$LAZYGIT_SRC_NAME"
	fi

	if [[ ! -d "$LAZYGIT_DIR" ]]; then
		echo "Creating lazygit directory under tools directory"
		mkdir -p "$LAZYGIT_DIR"
		echo "Extracting to $HOME/tools/lazygit directory"
		tar zxvf "$LAZYGIT_SRC_NAME" -C "$LAZYGIT_DIR"
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$LAZYGIT_DIR:\$PATH\"" >>"$HOME/.bashrc"
		export PATH="$LAZYGIT_DIR:$PATH"
	fi

else
	echo "lazygit is already installed. Skip installing it."
fi

#######################################################################
#                       LSDeluxe part                                 #
#######################################################################
LSD_DIR=$HOME/tools/lsd
LSD_SRC_NAME=$HOME/packages/lsd.tar.gz
LSD_LINK="https://github.com/Peltoche/lsd/releases/download/0.23.1/lsd-0.23.1-x86_64-unknown-linux-gnu.tar.gz"
if [[ -z "$(command -v lsd)" ]] && [[ ! -f "$LSD_DIR/lsd" ]]; then
	echo "Install lsd"
	if [[ ! -f $LSD_SRC_NAME ]]; then
		echo "Downloading lsd and renaming"
		wget $LSD_LINK -O "$LSD_SRC_NAME"
	fi

	if [[ ! -d "$LSD_DIR" ]]; then
		echo "Creating lsd directory under tools directory"
		mkdir -p "$LSD_DIR"
		echo "Extracting to $HOME/tools/lsd directory"
		tar zxvf "$LSD_SRC_NAME" -C "$LSD_DIR" --strip-components 1
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$LSD_DIR:\$PATH\"" >>"$HOME/.bashrc"
		export PATH="$LSD_DIR:$PATH"
	fi

else
	echo "lsd is already installed. Skip installing it."
fi

#######################################################################
#                            Ripgrep part                             #
#######################################################################
RIPGREP_DIR=$HOME/tools/ripgrep
RIPGREP_SRC_NAME=$HOME/packages/ripgrep.tar.gz
RIPGREP_LINK="https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz"
if [[ -z "$(command -v rg)" ]] && [[ ! -f "$RIPGREP_DIR/rg" ]]; then
	echo "Install ripgrep"
	if [[ ! -f $RIPGREP_SRC_NAME ]]; then
		echo "Downloading ripgrep and renaming"
		wget $RIPGREP_LINK -O "$RIPGREP_SRC_NAME"
	fi

	if [[ ! -d "$RIPGREP_DIR" ]]; then
		echo "Creating ripgrep directory under tools directory"
		mkdir -p "$RIPGREP_DIR"
		echo "Extracting to $HOME/tools/ripgrep directory"
		tar zxvf "$RIPGREP_SRC_NAME" -C "$RIPGREP_DIR" --strip-components 1
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$RIPGREP_DIR:\$PATH\"" >>"$HOME/.bashrc"
		export PATH="$RIPGREP_DIR:$PATH"
	fi

	# # set up manpath and zsh completion for ripgrep
	# mkdir -p $HOME/tools/ripgrep/doc/man/man1
	# mv $HOME/tools/ripgrep/doc/rg.1 $HOME/tools/ripgrep/doc/man/man1

	# if [[ "$USE_BASH_SHELL" = true ]]; then
	# 	echo 'export MANPATH=$HOME/tools/ripgrep/doc/man:$MANPATH' >>"$HOME/.bashrc"
	# else
	# 	echo 'export MANPATH=$HOME/tools/ripgrep/doc/man:$MANPATH' >>"$HOME/.zshrc"
	# 	echo 'export FPATH=$HOME/tools/ripgrep/complete:$FPATH' >>"$HOME/.zshrc"
	# fi
else
	echo "ripgrep is already installed. Skip installing it."
fi

#######################################################################
#                       tree-sitter part                              #
#######################################################################
TS_DIR=$HOME/tools/treesitter
TS_SRC_NAME=$HOME/packages/tree-sitter-linux-x64.gz
TS_LINK="https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.7/tree-sitter-linux-x64.gz"
if [[ -z "$(command -v tree-sitter)" ]] && [[ ! -f "$TS_DIR/tree-sitter" ]]; then
	echo "Install treesitter"
	if [[ ! -f $TS_SRC_NAME ]]; then
		echo "Downloading treesitter and renaming"
		wget $TS_LINK -P "$HOME/packages"
	fi

	if [[ ! -d "$TS_DIR" ]]; then
		echo "Creating tree-sitter directory under tools directory"
		mkdir -p "$TS_DIR"
		echo "Extracting to $HOME/tools/treesitter directory"
		gunzip "$TS_SRC_NAME"
		mv "$HOME/packages/tree-sitter-linux-x64" "$TS_DIR/tree-sitter"
		chmod u+x "$TS_DIR/tree-sitter"
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$TS_DIR:\$PATH\"" >>"$HOME/.bashrc"
		export PATH="$TS_DIR:$PATH"
	fi

else
	echo "tree-sitter is already installed. Skip installing it."
fi

#######################################################################
#                         trash-cli part                              #
#######################################################################
TRASH_DIR=$HOME/tools/trash-cli
TRASH_LINK="https://github.com/andreafrancia/trash-cli.git"
if [[ -z "$(command -v trash)" ]]; then
	echo "Install trash-cli"

	if [[ ! -d "$TRASH_DIR" ]]; then
		echo "Creating trash-cli directory under tools directory"
		mkdir -p "$TRASH_DIR"
		echo "git clone to $HOME/tools/trash-cli directory"
		git clone --depth=1 "$TRASH_LINK" "$TRASH_DIR"
		cd "$TRASH_DIR"
		pip3 install .

	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$HOME/.local/bin:\$PATH\"" >>"$HOME/.bashrc"
		export PATH=$HOME/.local/bin:$PATH
	fi

else
	echo "tree-sitter is already installed. Skip installing it."
fi

#######################################################################
#                         zoxide part                                 #
#######################################################################
ZOXIDE_DIR=$HOME/tools/zoxide
ZOXIDE_SRC_NAME=$HOME/packages/zoxide.tar.gz
ZOXIDE_LINK="https://github.com/ajeetdsouza/zoxide/releases/download/v0.8.3/zoxide-0.8.3-x86_64-unknown-linux-musl.tar.gz"
if [[ -z "$(command -v zoxide)" ]] && [[ ! -f "$ZOXIDE_DIR/zoxide" ]]; then
	echo "Install zoxide"
	if [[ ! -f $ZOXIDE_SRC_NAME ]]; then
		echo "Downloading zoxide and renaming"
		wget $ZOXIDE_LINK -O "$ZOXIDE_SRC_NAME"
	fi

	if [[ ! -d "$ZOXIDE_DIR" ]]; then
		echo "Creating zoxide directory under tools directory"
		mkdir -p "$ZOXIDE_DIR"
		echo "Extracting to $HOME/tools/zoxide directory"
		tar zxvf "$ZOXIDE_SRC_NAME" -C "$ZOXIDE_DIR"
		##chmod +x "$ZOXIDE_DIR/zoxide.bash"
		##ln -s "$ZOXIDE_DIR/zoxide.bash" "$ZOXIDE_DIR/zoxide"
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$ZOXIDE_DIR:\$PATH\"" >>"$HOME/.bashrc"
		export PATH="$ZOXIDE_DIR:$PATH"
	fi

else
	echo "zoxide is already installed. Skip installing it."
fi

#######################################################################
#                       Pandoc part                                 #
#######################################################################
# PANDOC_DIR=$HOME/tools/pandoc
# PANDOC_SRC_NAME=$HOME/packages/pandoc.tar.gz
# PANDOC_LINK="https://github.com/jgm/pandoc/releases/download/2.19.2/pandoc-2.19.2-linux-amd64.tar.gz"
# if [[ -z "$(command -v pandoc)" ]] && [[ ! -f "$PANDOC_DIR/pandoc" ]]; then
# 	echo "Install pandoc"
# 	if [[ ! -f $PANDOC_SRC_NAME ]]; then
# 		echo "Downloading pandoc and renaming"
# 		wget $PANDOC_LINK -O "$PANDOC_SRC_NAME"
# 	fi

# 	if [[ ! -d "$PANDOC_DIR" ]]; then
# 		echo "Creating pandoc directory under tools directory"
# 		mkdir -p "$PANDOC_DIR"
# 		echo "Extracting to $HOME/tools/pandoc directory"
# 		tar zxvf "$PANDOC_SRC_NAME" -C "$PANDOC_DIR" --strip-components 1
# 	fi

# 	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
# 		echo "export PATH=\"$PANDOC_DIR/bin:\$PATH\"" >>"$HOME/.bashrc"
#     export PATH="$PANDOC_DIR/bin:$PATH"
# 	fi

# else
# 	echo "pandoc is already installed. Skip installing it."
# fi

#######################################################################
#                           nala part                                 #
#######################################################################
# NOTE: Make sure the following build depends are installed.
# NOTE: sudo apt install git python3-apt pandoc -y
# NALA_DIR=$HOME/tools/nala
# NALA_LINK="https://gitlab.com/volian/nala.git"
# if [[ -z "$(command -v nala)" ]]; then
# 	echo "Install nala"

# 	if [[ ! -d "$NALA_DIR" ]]; then
# 		echo "Creating nala directory under tools directory"
# 		mkdir -p "$NALA_DIR"
# 		echo "git clone nala repo under tools directory"
#     git clone --depth=1 "$NALA_LINK" "$NALA_DIR"
#     make install -C "$NALA_DIR" # might need sudo for this

# 	fi

# 	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
# 		echo "export PATH=\"$NALA_DIR/bin:\$PATH\"" >>"$HOME/.bashrc"
# 	fi

# else
# 	echo "nala is already installed. Skip installing it."
# fi

#######################################################################
#                           tmux part                                 #
#######################################################################
# NOTE: sudo apt install libevent-dev
TMUX_DIR=$HOME/tools/tmux
TMUX_SRC_NAME=$HOME/packages/tmux.tar.gz
TMUX_LINK="https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz"
if [[ ! -f "$TMUX_DIR/tmux" ]]; then
	echo "Install tmux"
	if [[ ! -f $TMUX_SRC_NAME ]]; then
		echo "Downloading tmux and renaming"
		wget $TMUX_LINK -O "$TMUX_SRC_NAME"
	fi

	if [[ ! -d "$TMUX_DIR" ]]; then
		echo "Creating tmux directory under tools directory"
		mkdir -p "$TMUX_DIR"
		echo "Extracting to $HOME/tools/tmux directory"
		tar zxvf "$TMUX_SRC_NAME" -C "$TMUX_DIR" --strip-components 1
		cd "$TMUX_DIR"
		./configure --prefix="$TMUX_DIR"
		make
		make install
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$TMUX_DIR:\$PATH\"" >>"$HOME/.bashrc"
		export PATH="$TMUX_DIR:$PATH"
		alias tmux='~/tools/tmux/tmux'
	fi

echo "Installing tpm"
if [[ ! -d ~/.tmux/plugins/tpm ]]; then
	git clone --depth=1 https://github.com/tmux-plugins/tpm \
    ~/.tmux/plugins/tpm
  # NOTE: `prefix` + `I` to install plugins via tpm.
fi

else
	echo "tmux is already installed. Skip installing it."
fi

#######################################################################
#                       GNU stow part                                 #
#######################################################################
# NOTE: make sure perl is installed
# NOTE: also, cpanm install Test::Output Test::Output
STOW_DIR=$HOME/tools/stow
STOW_SRC_NAME=$HOME/packages/stow.tar.gz
STOW_LINK="https://ftp.gnu.org/gnu/stow/stow-2.3.1.tar.gz"
if [[ -z "$(command -v stow)" ]]; then
	echo "Install GNU stow"
	if [[ ! -f $STOW_SRC_NAME ]]; then
		echo "Downloading stow and renaming"
		wget $STOW_LINK -O "$STOW_SRC_NAME"
	fi

	if [[ ! -d "$STOW_DIR" ]]; then
		echo "Creating stow directory under tools directory"
		mkdir -p "$STOW_DIR"
		echo "Extracting to $HOME/tools/stow directory"
		tar zxvf "$STOW_SRC_NAME" -C "$STOW_DIR" --strip-components 1
		cd "$STOW_DIR"
		cpanm install Test::Output Test::Output
		echo "Assign perl location"
		# export PERL_PREFIX="$HOME/.plenv/versions/5.36.0"
		export PERL_PREFIX="$HOME/tools/perl"
		./configure --prefix="$PERL_PREFIX"
		make
		make install
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$STOW_DIR/bin:\$PATH\"" >>"$HOME/.bashrc"
		export PATH="$STOW_DIR/bin:$PATH"
	fi

else
	echo "GNU stow is already installed. Skip installing it."
fi

#######################################################################
#                           xplr part                                 #
#######################################################################
XPLR_DIR=$HOME/tools/xplr
XPLR_SRC_NAME=$HOME/packages/xplr.tar.gz
XPLR_LINK="https://github.com/sayanarijit/xplr/releases/download/v0.19.3/xplr-linux.tar.gz"
if [[ -z "$(command -v xplr)" ]]; then
	echo "Install xplr"
	if [[ ! -f $XPLR_SRC_NAME ]]; then
		echo "Downloading xplr and renaming"
		wget "$XPLR_LINK" -O "$XPLR_SRC_NAME"
	fi

	if [[ ! -d "$XPLR_DIR" ]]; then
		echo "Creating xplr directory under tools directory"
		mkdir -p "$XPLR_DIR"
		echo "Extracting to $HOME/tools/xplr directory"
		tar zxvf "$XPLR_SRC_NAME" -C "$XPLR_DIR"

	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
    echo "export PATH=\"$XPLR_DIR:\$PATH\"" >>"$HOME/.bashrc"
    export PATH="$XPLR_DIR:$PATH"
    # for old habit
	fi

else
	echo "XPLR is already installed. Skip installing it."
fi

#######################################################################
#                        dua-cli part                                 #
#######################################################################
DUA_DIR=$HOME/tools/dua-cli
DUA_SRC_NAME=$HOME/packages/dua-cli.tar.gz
DUA_LINK="https://github.com/Byron/dua-cli/releases/download/v2.18.0/dua-v2.18.0-x86_64-unknown-linux-musl.tar.gz"
if [[ -z "$(command -v dua)" ]]; then
	echo "Install dua-cli"
	if [[ ! -f $DUA_SRC_NAME ]]; then
		echo "Downloading xplr and renaming"
		wget "$DUA_LINK" -O "$DUA_SRC_NAME"
	fi

	if [[ ! -d "$DUA_DIR" ]]; then
		echo "Creating dua directory under tools directory"
		mkdir -p "$DUA_DIR"
		echo "Extracting to $HOME/tools/dua directory"
		tar zxvf "$DUA_SRC_NAME" -C "$DUA_DIR" --strip-components 1

	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
    echo "export PATH=\"$DUA_DIR:\$PATH\"" >>"$HOME/.bashrc"
    export PATH="$DUA_DIR:$PATH"
	fi

else
	echo "dua-cli is already installed. Skip installing it."
fi

#######################################################################
#                            viu part                                 #
#######################################################################
VIU_DIR=$HOME/tools/viu
VIU_LINK="https://github.com/atanunq/viu/releases/download/v1.4.0/viu"
if [[ -z "$(command -v viu)" ]]; then
	echo "Install viu"
	if [[ ! -d "$VIU_DIR" ]]; then
		echo "Creating viu directory under tools directory"
		mkdir -p "$VIU_DIR"
    cd "$VIU_DIR"
    wget "$VIU_LINK"
    chmod +x "$VIU_DIR/viu"
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
    echo "export PATH=\"$VIU_DIR:\$PATH\"" >>"$HOME/.bashrc"
    export PATH="$VIU_DIR:$PATH"
	fi

else
	echo "viu is already installed. Skip installing it."
fi

#######################################################################
#                          ImageMagick part                                 #
#######################################################################
MAGICK_DIR=$HOME/tools/magick
MAGICK_LINK="https://github.com/ImageMagick/ImageMagick"
if [[ -z "$(command -v magick)" ]]; then
	echo "Install ImageMagick"

	if [[ ! -d "$MAGICK_DIR" ]]; then
		echo "Creating magick directory under tools directory"
		mkdir -p "$MAGICK_DIR"
    echo "git clone to $HOME/tools/magick directory"
		git clone --depth=1 "$MAGICK_LINK" "$MAGICK_DIR"
		cd "$MAGICK_DIR"
		./configure --prefix="$MAGICK_DIR" --with-modules
		make
		make install
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$MAGICK_DIR/bin:\$PATH\"" >>"$HOME/.bashrc"
		echo "export MAGICK_HOME=$MAGICK_DIR" >>"$HOME/.bashrc"
    export MAGICK_HOME="$MAGICK_DIR"
		export PATH="$MAGICK_DIR/bin:$PATH"
    echo "export LD_LIBRARY_PATH=\"$\{LD_LIBRARY_PATH:+\$LD_LIBRARY_PATH:}\$MAGICK_HOME/lib" >>"$HOME/.bashrc"
    LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$MAGICK_HOME/lib"
    export LD_LIBRARY_PATH
	fi

else
	echo "ImageMagick is already installed. Skip installing it."
fi

#######################################################################
#                          chafa part                                 #
#######################################################################
# NOTE: sudo apt install libfreetype6-dev libjpeg-dev librsvg2-dev libtiff5-dev libwebp-dev libmagickwand-dev libtool gtk-doc-tools
CHAFA_DIR=$HOME/tools/chafa
CHAFA_LINK="https://github.com/hpjansson/chafa.git"
if [[ -z "$(command -v chafa)" ]]; then
	echo "Install chafa"

	if [[ ! -d "$CHAFA_DIR" ]]; then
		echo "Creating chafa directory under tools directory"
		mkdir -p "$CHAFA_DIR"
    echo "git clone to $HOME/tools/chafa directory"
		git clone --depth=1 "$CHAFA_LINK" "$CHAFA_DIR"
		cd "$CHAFA_DIR"
		# ./configure --prefix="$CHAFA_DIR"
    ./autogen.sh --prefix="$CHAFA_DIR"
		make
		make install
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$CHAFA_DIR/bin:\$PATH\"" >>"$HOME/.bashrc"
		export PATH="$CHAFA_DIR/bin:$PATH"
	fi

else
	echo "chafa is already installed. Skip installing it."
fi

#######################################################################
#                           stpv part                                 #
#######################################################################
# STPV_DIR=$HOME/tools/stpv
# STPV_LINK="https://github.com/Naheel-Azawy/stpv.git"
# if [[ -z "$(command -v stpv)" ]]; then
# 	echo "Install stpv"

# 	if [[ ! -d "$STPV_DIR" ]]; then
# 		echo "Creating stpv directory under tools directory"
# 		mkdir -p "$STPV_DIR"
#     echo "git clone to $HOME/tools/stpv directory"
# 		git clone --depth=1 "$STPV_LINK" "$STPV_DIR"
# 	fi

# 	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
# 		echo "export PATH=\"$STPV_DIR:\$PATH\"" >>"$HOME/.bashrc"
# 		export PATH="$STPV_DIR:$PATH"
# 	fi

# else
# 	echo "stpv is already installed. Skip installing it."
# fi

#######################################################################
#                           ctpv part                                 #
#######################################################################
CTPV_DIR=$HOME/tools/ctpv
CTPV_LINK="https://github.com/NikitaIvanovV/ctpv.git"
if [[ -z "$(command -v ctpv)" ]]; then
	echo "Install ctpv"

	if [[ ! -d "$CTPV_DIR" ]]; then
		echo "Creating ctpv directory under tools directory"
		mkdir -p "$CTPV_DIR"
    echo "git clone to $HOME/tools/ctpv directory"
		git clone --depth=1 "$CTPV_LINK" "$CTPV_DIR"
    cd "$CTPV_DIR"
    sudo make install # NOTE: need sudo for this
	fi

else
	echo "ctpv is already installed. Skip installing it."
fi

#######################################################################
#                             lf part                                 #
#######################################################################
LF_DIR=$HOME/tools/lf
LF_SRC_NAME=$HOME/packages/lf.tat.gz
LF_LINK="https://github.com/gokcehan/lf/releases/download/r27/lf-linux-amd64.tar.gz"
if [[ -z "$(command -v lf)" ]]; then
	echo "Install lf"
	if [[ ! -f $LF_SRC_NAME ]]; then
		echo "Downloading lf and renaming"
		wget "$LF_LINK" -O "$LF_SRC_NAME"
	fi

	if [[ ! -d "$LF_DIR" ]]; then
		echo "Creating lf directory under tools directory"
		mkdir -p "$LF_DIR"
		echo "Extracting to $HOME/tools/lf directory"
		tar zxvf "$LF_SRC_NAME" -C "$LF_DIR"
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
    echo "export PATH=\"$LF_DIR:\$PATH\"" >>"$HOME/.bashrc"
    export PATH="$LF_DIR:$PATH"
	fi

else
	echo "LF is already installed. Skip installing it."
fi

#######################################################################
#                          broot part                                 #
#######################################################################
BROOT_DIR=$HOME/tools/broot
BROOT_SRC_NAME=$HOME/packages/broot.zip
BROOT_LINK="https://github.com/Canop/broot/releases/download/v1.15.0/broot_1.15.0.zip"
if [[ -z "$(command -v broot)" ]]; then
	echo "Install broot"
	if [[ ! -f $BROOT_SRC_NAME ]]; then
		echo "Downloading broot and renaming"
		wget "$BROOT_LINK" -O "$BROOT_SRC_NAME"
	fi

	if [[ ! -d "$BROOT_DIR" ]]; then
		echo "Creating broot directory under tools directory"
		mkdir -p "$BROOT_DIR"
    unzip "$BROOT_SRC_NAME" -d "$BROOT_DIR"
    chmod +x "$BROOT_DIR/x86_64-linux/broot"
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
    echo "export PATH=\"$BROOT_DIR/x86_64-linux:\$PATH\"" >>"$HOME/.bashrc"
    export PATH="$BROOT_DIR/x86_64-linux:$PATH"
	fi

else
	echo "Broot is already installed. Skip installing it."
fi

#######################################################################
#                          lnav part                                 #
#######################################################################
LNAV_DIR=$HOME/tools/lnav
LNAV_SRC_NAME=$HOME/packages/lnav.zip
LNAV_LINK="https://github.com/tstack/lnav/releases/download/v0.11.0/lnav-0.11.0-musl-64bit.zip"
if [[ -z "$(command -v lnav)" ]]; then
	echo "Install lnav"
	if [[ ! -f $LNAV_SRC_NAME ]]; then
		echo "Downloading lnav and renaming"
		wget "$LNAV_LINK" -O "$LNAV_SRC_NAME"
	fi


	if [[ ! -d "$LNAV_DIR" ]]; then
		echo "Creating lnav directory under tools directory"
		mkdir -p "$LNAV_DIR"
    unzip "$LNAV_SRC_NAME" -d "$LNAV_DIR"
    for f in $LNAV_DIR/lnav-0.11.0/*; do cp $f "$LNAV_DIR"; done
    rm -r "$LNAV_DIR/lnav-0.11.0"
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
		echo "export PATH=\"$LNAV_DIR:\$PATH\"" >>"$HOME/.bashrc"
		export PATH="$LNAV_DIR:$PATH"
	fi

else
	echo "lnav is already installed. Skip installing it."
fi

#######################################################################
#                        termpix part                                 #
#######################################################################
TERMPIX_DIR=$HOME/tools/termpix
TERMPIX_LINK="https://github.com/mmacedoeu/termpix.git"
if [[ -z "$(command -v termpix)" ]]; then
	echo "Install termpix"

	if [[ ! -d "$TERMPIX_DIR" ]]; then
		echo "Creating termpix directory under tools directory"
		mkdir -p "$TERMPIX_DIR"
    echo "git clone to $HOME/tools/termpix directory"
		git clone --depth=1 "$TERMPIX_LINK" "$TERMPIX_DIR"
    cd "$TERMPIX_DIR"
    cargo build
    cargo install --path .
	fi

else
	echo "termpix is already installed. Skip installing it."
fi

#######################################################################
#                         Pistol part                                 #
#######################################################################
PISTOL_DIR=$HOME/tools/pistol
PISTOL_LINK="https://github.com/doronbehar/pistol.git"
if [[ -z "$(command -v pistol)" ]]; then
	echo "Install pistol"

	if [[ ! -d "$PISTOL_DIR" ]]; then
		echo "Creating pistol directory under tools directory"
		mkdir -p "$PISTOL_DIR"
    echo "git clone to $HOME/tools/pistol directory"
		git clone --depth=1 "$PISTOL_LINK" "$PISTOL_DIR"
    cd "$PISTOL_DIR"
    make
	fi

	if [[ "$ADD_TO_SYSTEM_PATH" = true ]] && [[ "$USE_BASH_SHELL" = true ]]; then
    echo "export PATH=\"$PISTOL_DIR:\$PATH\"" >>"$HOME/.bashrc"
    export PATH="$PISTOL_DIR:$PATH"
	fi

else
	echo "Pistol is already installed. Skip installing it."
fi
