local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.term = "xterm-256color"
config.enable_kitty_graphics = true

config.keys = {
  {key="Enter", mods="SHIFT", action=wezterm.action{SendString="\x1b\r"}},
}

-- For example, changing the initial geometry for new windows:
-- config.initial_cols = 120
-- config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 14
config.color_scheme = 'Catppuccin Mocha'

return config
