local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Default shell
-- config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe" }

-- Appearance
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.color_scheme = "Catppuccin Mocha (Gogh)"

-- Font
config.font_size = 11
config.font = wezterm.font_with_fallback({
	{ family = "Rec Mono Casual", weight = "Medium", harfbuzz_features = { "calt=1", "clig=1", "liga=1" } },
	{ family = "Symbols Nerd Font", scale = 1 },
})
config.line_height = 1.1

-- Behaviour
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.enable_kitty_graphics = true

return config
