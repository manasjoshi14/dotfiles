#!/bin/bash
input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
user=$(whoami)
host=$(hostname -s)
time=$(date +%H:%M:%S)

# Define colors using $'...' syntax for actual escape characters
BLUE=$'\e[34m'
CYAN=$'\e[36m'
RED=$'\e[31m'
GREEN=$'\e[32m'
YELLOW=$'\e[33m'
RESET=$'\e[0m'

if [ "$cwd" = "$HOME" ]; then
    dir="~"
else
    parent=$(basename "$(dirname "$cwd")")
    current=$(basename "$cwd")
    if [ "$parent" = "/" ] || [ "$parent" = "." ]; then
        dir="$current"
    else
        dir="../$current"
    fi
fi

git_branch=""
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
    branch=$(git -C "$cwd" branch --show-current 2>/dev/null)
    if [ -n "$branch" ]; then
        if ! git -C "$cwd" diff-index --quiet HEAD -- 2>/dev/null; then
            git_branch=" on ${RED}${branch}${RESET}"
        else
            git_branch=" on ${GREEN}${branch}${RESET}"
        fi
    fi
fi

venv=""
if [ -n "$VIRTUAL_ENV" ]; then
    venv=" ${CYAN}($(basename "$VIRTUAL_ENV"))${RESET}"
elif [ -n "$CONDA_DEFAULT_ENV" ]; then
    venv=" ${CYAN}(${CONDA_DEFAULT_ENV})${RESET}"
elif [ -f "$cwd/pyproject.toml" ] && command -v uv &> /dev/null; then
    if [ -d "$cwd/.venv" ]; then
        venv=" ${CYAN}(uv)${RESET}"
    fi
fi

printf "%s" "${BLUE}${user}${RESET}@${BLUE}${host}${RESET}:${CYAN}${dir}${RESET}${venv}${git_branch} ${GREEN}${time}${RESET}"
