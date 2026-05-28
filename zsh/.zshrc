export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

if [ -x "$HOME/.local/bin/percy-codex" ]; then
  alias codex="$HOME/.local/bin/percy-codex"
fi

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/e/.lmstudio/bin"
# End of LM Studio CLI section

