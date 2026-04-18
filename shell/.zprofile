if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

toolbox_scripts="$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
[ -d "$toolbox_scripts" ] && export PATH="$PATH:$toolbox_scripts"

[ -r "$HOME/.orbstack/shell/init.zsh" ] && source "$HOME/.orbstack/shell/init.zsh"
