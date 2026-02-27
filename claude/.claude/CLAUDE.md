# Global Claude Instructions

## REQUIRED

- **NEVER use `rm -rf`** - it's blocked by the command-validator hook for safety
- Use `trash` instead: `trash folder-name` or `trash file.txt`
- Works exactly like `rm -rf` but moves to Trash instead of permanent deletion

## **ENTROPY REMINDER**
This codebase will outlive you. Every shortcut you take becomes someone else's burden. Every hack compounds into technical debt that slows the whole team down.

You are not just writing code. You are shaping the future of this project. The patterns you establish will be copied. The corners you cut will be cut again.

**Fight entropy. Leave the codebase better than you found it.**

## Documentation Style

- Do not add explanatory inline comments to directory trees or code blocks in documentation
- Let file/folder names speak for themselves
- Avoid comments like `# This is the config file` or `# Project's own venv`
