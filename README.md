# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

| Package | Files |
|---|---|
| **shell** | `.zshrc`, `.zprofile`, `.zshenv`, `.bashrc`, `.profile`, `.antigenrc`, `.fzf.bash`, `.fzf.zsh` |
| **git** | `.gitconfig` |
| **vim** | `.vimrc`, `.gvimrc`, `.ideavimrc`, `.vscodevimrc`, `.obsidian.vimrc` |
| **tmux** | `.tmux.conf`, `.pycharm.tmux.conf` |
| **wezterm** | `.wezterm.lua` |
| **ssh** | `.ssh/config` |
| **claude** | `.claude/CLAUDE.md`, `.claude/settings.json`, `.claude/commands/interview.md`, `.claude/hookify.block-rm.local.md`, `.claude/statusline-command.sh` |
| **codex** | `.codex/config.toml`, `.codex/prompts/prreview.md` |
| **gh** | `.config/gh/config.yml` |
| **srt** | `.srt-settings.json` |

## Install

```bash
git clone https://github.com/$(gh api user -q .login)/dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh
```

## Usage

Stow individual packages:

```bash
cd ~/dotfiles
stow shell    # symlinks shell configs
stow vim      # symlinks vim configs
```

Remove a package:

```bash
stow -D shell
```
