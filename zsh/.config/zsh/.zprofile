typeset -U path PATH

case "$(uname -s)" in
  Darwin)
    path=(
      /usr/local/bin
      /System/Cryptexes/App/usr/bin
      /usr/bin
      /bin
      /usr/sbin
      /sbin
      /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin
      /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin
      /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin
      /pkg/env/global/bin
      /opt/homebrew/bin
      /Applications/Ghostty.app/Contents/MacOS
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    )
    ;;
  Linux)
    path=(
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
      /usr/local/sbin
      /usr/local/bin
      /usr/sbin
      /usr/bin
      /sbin
      /bin
    )
    ;;
esac

export PATH
