# Dotfiles

## Manage dotfiles with [GNU stow](https://www.gnu.org/software/stow/)

Gnu stow use symlinks to manage dotfiles, every folder in this repo can be seen as `home_dir`.
Place your dotfiles in each folder as if they are in the `home_dir`.

## Install GNU stow

```sh
wget https://mirror.ossplanet.net/gnu/stow/stow-latest.tar.gz
tar -xvpzf stow-latest.tar.gz
cd stow-2.3.1
./configure --prefix=/home/charles/tools
make
make install
```

and put below lines in `.bashrc`:

```sh
# GNU Stow
export PATH="$HOME/tools/stow-2.3.1/bin":$PATH
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
