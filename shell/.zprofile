if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

toolbox_scripts="$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
[ -d "$toolbox_scripts" ] && export PATH="$PATH:$toolbox_scripts"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
