export PATH="/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home/bin:$PATH"

export ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH="/Users/manas/.oh-my-zsh"


# ZSH_THEME="spaceship"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(
#     git
#     vi-mode
#     command-not-found
# )
# 
# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# Load Antigen
if [[ -z "$ANTIGEN_LOADED" ]]; then
  source $(brew --prefix)/share/antigen/antigen.zsh
  antigen init ~/.antigenrc
  ANTIGEN_LOADED=1
fi

#source $(brew --prefix)/share/antigen/antigen.zsh

# Load Antigen configurations
#antigen init ~/.antigenrc

# PROMPT

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  conda         # conda virtualenv section
  uv
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  rprompt_prefix
  vi_mode
  git           # Git section (git_branch + git_status)
  time
  rprompt_suffix
)

# RPROMPT on same line - https://github.com/denysdovhan/spaceship-prompt/issues/558
spaceship_rprompt_prefix() {
  echo -n '%{'$'\e[1A''%}'
}
spaceship_rprompt_suffix() {
  echo -n '%{'$'\e[1B''%}'
}

SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_PROMPT_SEPARATE_LINE=true

# TIME
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR="green"
SPACESHIP_TIME_PREFIX=""

SPACESHIP_EXEC_TIME_SHOW=true
SPACESHIP_EXEC_TIME_PREFIX="took "
SPACESHIP_EXEC_TIME_SUFFIX="s"

# USER
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_PREFIX=""
#SPACESHIP_USER_COLOR="green"
#SPACESHIP_USER_COLOR_ROOT="red"
SPACESHIP_USER_SUFFIX=""

# HOST
SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_HOST_SUFFIX=""

# DIR
SPACESHIP_DIR_TRUNC=1
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_DIR_TRUNC_PREFIX="../"
SPACESHIP_DIR_PREFIX=":"

export PATH=$PATH:/usr/games
export PATH="${PATH}:${HOME}/.local/bin/"
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Vi-Mode
export KEYTIMEOUT=1

bindkey -v
bindkey '^ ' autosuggest-accept
bindkey '\e.' insert-last-word
#zle-line-init() { zle -K vicmd; }


# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"


# Base16 Gruvbox dark, hard

export JAVA21_HOME=$(/usr/libexec/java_home -v 21.0)



export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export PATH=$PATH:/opt/local/bin

alias gcps="git cherry-pick --skip"
alias gcp="git cherry-pick "


ulimit -Sn 524288
ulimit -Hn 10485760
export PATH="/opt/homebrew/bin:$PATH"

killjava() {
  PIDS=$(ps -ef | grep '[j]ava' | awk '{print $2}')
  if [ -n "$PIDS" ]; then
    echo "Killing java PIDs: $PIDS"
    read -q "REPLY?Are you sure? [y/N] "
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      echo $PIDS | xargs -r kill -9
    else
      echo "Aborted."
    fi
  else
    echo "No java processes found."
  fi
}

scratch() {
	local name="${1:-$(date +%Y%m%d-%H%M%S)}"
	vim ~/scratch_pad/"$name".md
}

tmux-pycharm() {
  tmux -L pycharm -f ~/.pycharm.tmux.conf new-session -A -s "${1:-main}"
}

mux() {
  tmux new-session -A -s "${1:-main}"
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# opencode
export PATH=/Users/manas/.opencode/bin:$PATH


export DOCKER_HOST="unix://${HOME}/.orbstack/run/docker.sock"
