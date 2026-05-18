# Dotfiles

Dotfiles managed with GNU Stow. Each top-level directory is a Stow package whose contents mirror paths from `$HOME`.

## Layout

- `zsh/` -> `~/.zshrc`, `~/.zprofile`
- `git/` -> `~/.gitconfig`
- `nvim/` -> `~/.config/nvim`
- `starship/` -> `~/.config/starship.toml`
- `ghostty/` -> `~/.config/ghostty/config`
- `lazygit/` -> `~/.config/lazygit`
- `homebrew/` -> `~/.config/homebrew/brew.env`
- `ssh/` -> `~/.ssh/config`

## Install

From this directory:

```sh
stow --target="$HOME" zsh git nvim starship ghostty lazygit homebrew ssh
```

Preview changes first:

```sh
stow --simulate --verbose --target="$HOME" zsh git nvim starship ghostty lazygit homebrew ssh
```

If Stow reports an existing real file, move that file aside or merge it into this repo first. For example:

```sh
mv ~/.zshrc ~/.zshrc.backup
mv ~/.zprofile ~/.zprofile.backup
stow --target="$HOME" zsh
```

Restow after changing package contents:

```sh
stow --restow --target="$HOME" zsh git nvim starship ghostty lazygit homebrew ssh
```

Remove symlinks:

```sh
stow --delete --target="$HOME" zsh git nvim starship ghostty lazygit homebrew ssh
```

## macOS setup

Install Stow with Homebrew:

```sh
brew install stow
```

Install Homebrew packages from this repo:

```sh
brew bundle --file="$HOME/dotfiles/Brewfile"
```

## Linux setup

Install Stow with your package manager:

```sh
sudo apt install stow
```

or:

```sh
sudo dnf install stow
```
