local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Wezterm config override handler for neovim
local wezterm_config_nvim = wezterm.plugin.require('https://github.com/winter-again/wezterm-config.nvim')

-- Appearance
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.color_scheme = "Everforest Dark (Gogh)"
config.window_background_opacity = 0.8

-- Font
config.font_size = 12
config.font = wezterm.font_with_fallback({
	{ family = "monospace", weight = 500, harfbuzz_features = { "calt=1", "clig=1", "liga=1" } },
})
config.line_height = 1.1

-- Behaviour
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.enable_kitty_graphics = true

return config
