local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Some font presets
local fonts = {
	monospace = {
		family = "monospace",
		size = 16,
	},
}
local user_font = fonts.monospace

config.font_size = (user_font.size == nil and 14) or user_font.size
config.font = wezterm.font_with_fallback({
	{
		family = user_font.family,
		weight = (user_font.weight == nil and 400) or user_font.weight,
		harfbuzz_features = user_font.harfbuzz_features,
	},
	{ family = "Operator Mono Bold" }, -- fix Operator Mono bold variant not showing
	{ family = "Symbols Nerd Font Mono", scale = 0.8 },
	{ family = "Noto Sans Symbols 2", scale = 0.9 },
	{ family = "monospace" },
})

-- Appearance
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.color_scheme = "Tokyo Night (Gogh)"
-- config.line_height = 1.25

-- Behaviour
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.enable_kitty_graphics = true

-- Open powershell over cmd on Windows
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "powershell", "-nologo" }
end

return config
