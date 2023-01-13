# Dotfiles

## Manage dotfiles with [GNU stow](https://www.gnu.org/software/stow/)

Gnu stow use symlinks to manage dotfiles, every folder in this repo can be seen as `home_dir`.
Place your dotfiles in each folder as if they are in the `home_dir`.

## Install GNU stow

```sh
# NOTE: make sure perl is installed
# NOTE: also, cpanm install Test::Output
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
    echo "Assign perl location"
    export PERL_PREFIX="$HOME/.plenv/versions/5.36.0"
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
```

and put below lines in `.bashrc`:

```sh
# GNU Stow
export PATH="$HOME/tools/stow/bin":$PATH
```

## Usage

Clone into your `$HOME` or `~`.

```sh
git clone git@github.com:CharlesChiuGit/dotfiles.git ~
```

Run `stow` to symlink the things you need.

```sh
stow */ # Everything ('/' ignores the README)
```

```sh
stow Bash
```

## Stow parameters

- `-D`: remove the created symlink.
- `-S`: create assigned symlink.
- `-R`: remove & recreate assigned symlink.
- `--dotfiles`: If everything in this repo has a `dot-` prefix, it will be replaced with `.`. eg. `dotfiles/zsh/dot-zshrc -> ~/.zshrc`.

GNU stow will not handle any conflict files, it will stop all operation once it found one. GNU stow will only manage the folders and files under it created.

---

<h3 align="center">
    📸 Script Screenshots
</h3>

<p align="center">
  <img src="https://user-images.githubusercontent.com/32497323/203712457-34d05294-3485-4d95-809a-5ceac4170489.png"
  width = "85%"
  />
</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/32497323/203712544-7aa78964-1197-41b5-9259-1f9ba071eb4c.png"
  width = "85%"
  />
</p>

test pwsh