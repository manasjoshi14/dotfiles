#!/bin/bash
command -v stow >/dev/null || brew install stow
cd "$(dirname "$0")"
stow shell git vim tmux wezterm ssh claude codex gh srt
