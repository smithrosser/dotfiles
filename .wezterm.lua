local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Default shell
config.default_prog = { "powershell", "-nologo" }

-- Appearance
config.window_padding = { left = 8, right = 8, top = 8, bottom = 0 }
config.color_scheme = "Everforest Dark (Gogh)"

-- Font
config.font_size = 11
config.font = wezterm.font_with_fallback({
	{ family = "Rec Mono Casual", weight = 600, harfbuzz_features = { "calt=1", "clig=1", "liga=1" } },
	{ family = "Symbols Nerd Font", scale = 1 },
})
-- config.line_height = 1.2

-- Behaviour
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.enable_kitty_graphics = true

return config
