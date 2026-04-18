[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Raise file descriptor limits when the OS allows it.
ulimit -Sn 524288 2>/dev/null || true
ulimit -Hn 10485760 2>/dev/null || true

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
export PATH="$HOME/.local/bin:$PATH"
