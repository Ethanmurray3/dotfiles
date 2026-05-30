# Dotfiles

Dotfiles managed with GNU Stow. Each top-level directory is a Stow package whose contents mirror paths from `$HOME`.

## Layout

- `zsh/` -> `~/.config/zsh`
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
stow zsh git nvim starship ghostty lazygit homebrew ssh
```

Preview changes first:
