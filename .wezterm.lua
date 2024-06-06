-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Open Git Bash instead of PS/CMD
-- (note: this is for windows)
config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe" }

-- Appearance
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.color_scheme = "Catppuccin Macchiato"
config.font = wezterm.font_with_fallback({ "Rec Mono Semicasual", "Symbols Nerd Font" })
config.font_size = 11

-- Behaviour
config.enable_tab_bar = false
config.enable_scroll_bar = false

return config
