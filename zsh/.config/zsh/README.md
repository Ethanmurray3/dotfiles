# Zsh Dotfiles

Minimal zsh setup with Starship, vi-mode editing, fuzzy file search, autosuggestions, substring history search, and modern CLI aliases.

## What This Config Does

- Stores zsh config in `~/.config/zsh` using `ZDOTDIR`.
- Uses XDG directories for config, cache, data, and shell history.
- Sets `nvim` as the default editor.
- Uses Starship for a compact prompt with directory, OS, git branch, git status, and prompt character.
- Enables shared, deduplicated zsh history in `$XDG_STATE_HOME/zsh/history`.
- Enables `AUTOCD`, disables the terminal bell, and sorts numeric globs naturally.
- Loads vendored or auto-installed plugins from `plugins/`.

## File Map

- `.zshenv`: XDG paths, editor, pager, GPG tty, Starship config path.
- `.zprofile`: login-shell `PATH` setup.
- `.zshrc`: history, shell options, completion, fzf startup, module loading, NVM.
- `aliases.zsh`: modern replacements and convenience aliases.
- `bindings.zsh`: vi-mode cursor styling and custom keybindings.
- `fzf.zsh`: fzf defaults, previews, and custom file picker widget.
- `plugins.zsh`: small plugin loader plus `zplugin-update`.
- `prompt.zsh`: Starship initialization.
- `starship.toml`: Starship prompt theme.
- `plugins/`: bundled zsh plugins.

## Setup

Put this directory at:

```sh
~/.config/zsh
```

Make sure zsh starts with this config directory. Common options are to symlink these files into place, or keep a tiny `~/.zshenv` that sets:

```sh
export ZDOTDIR="$HOME/.config/zsh"
```

Then start a new zsh session.

## Recommended Tools

This config expects these tools to be available:

- `starship` for the prompt.
- `zoxide` for smart directory jumping.
- `fzf` and `fd` for fuzzy file selection.
- `eza` for `ls`, `ll`, `la`, and `tree`.
- `bat` or `batcat` for `cat`, previews, and man-page paging.
- `rg` for the `grep` alias.
- `nvim` for `$EDITOR`, `$VISUAL`, and `vim`.
- `git` for plugin install/update support.
- `nvm` if you want Node version management.
- `lf` if you use the `lf` wrapper that follows directory changes.

On macOS with Homebrew, the core tools are:

```sh
brew install zsh starship zoxide fzf fd eza bat ripgrep neovim git
```

## Plugins

`plugins.zsh` loads these plugins from `plugins/`:

- `zsh-users/zsh-autosuggestions`
- `zsh-users/zsh-history-substring-search`
- `jeffreytse/zsh-vi-mode`
- `zdharma-continuum/fast-syntax-highlighting`

If a plugin directory is missing, it is cloned automatically on shell startup. Update all installed plugins with:

```sh
zplugin-update
```

## Keybindings

- `Ctrl+Right`: move forward one word.
- `Ctrl+Left`: move backward one word.
- `Ctrl+F`: open an fzf file picker that excludes hidden files.
- `Ctrl+\`: toggle autosuggestions.
- `Up`: search history backward by substring.
- `Down`: search history forward by substring.

The shell uses `zsh-vi-mode`; insert mode uses a beam cursor and normal/visual mode use a block cursor.

## Aliases And Helpers

- `ls`: `eza --icons`
- `ll`: detailed listing with git status.
- `la`: detailed listing including hidden files.
- `tree`: tree view with icons.
- `cat`: `bat`
- `grep`: `rg --color=auto`
- `diff`: colorized diff.
- `df`: human-readable disk usage.
- `-`: jump to previous directory.
- `vim`: `nvim`
- `glog`: paged `git log`.
- `gadog`: graph view of all git refs.
- `dotfiles`: bare-repo helper for `$HOME/.dotfiles`.
- `stream`: open `/dev/video4` in `mpv`.

The `lf` function runs `lf` and changes the shell directory to the last directory selected inside `lf`.

## Fzf Behavior

Default fzf file search uses:

```sh
fd --type f --hidden --strip-cwd-prefix
```

`Ctrl-T` uses the same command and shows a `bat` preview. `Ctrl+F` uses a custom picker that removes `--hidden`, so hidden files are excluded.

## Notes

- `.zshrc` reads `~/.config/lf/icons` to populate `LF_ICONS`; create that file or remove that line if you do not use `lf`.
- The Starship config uses Nerd Font symbols, so a Nerd Font is recommended.
- Completion metadata is cached at `$XDG_CACHE_HOME/zsh/zcompdump`.
- History is stored at `$XDG_STATE_HOME/zsh/history`.
