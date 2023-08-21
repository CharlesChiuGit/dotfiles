# Dotfiles

## Manage dotfiles with [dt-cli](https://github.com/blurgyy/dt)

`dt` is a dot files manager written in rust, check [here](https://github.com/CharlesChiuGit/dotfiles/tree/main/cli-utils/dt) to see my current settings.

## Usage

Clone into your `$HOME` or `~`.

```sh
git clone git@github.com:CharlesChiuGit/dotfiles.git ~
```

Run `dt-cli -c XXX.toml` to symlink/copy configs to it's correlated location.

```sh
cd dotfiles/cli-utils/dt
dt-cli -c linux.toml
```

See [dt-cli Hands-on Guide](https://dt.cli.rs/config/guide/) for more info.

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
