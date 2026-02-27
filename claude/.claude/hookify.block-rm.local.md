---
name: block-rm
enabled: true
event: bash
pattern: \brm\s+
action: block
---

🚫 **rm command blocked**

The `rm` command is not allowed in this project. Use `trash` instead for safe deletion:

```bash
trash folder-name    # Instead of rm -rf folder-name
trash file.txt       # Instead of rm file.txt
```

The `trash` command moves items to Trash instead of permanent deletion, allowing recovery if needed.
