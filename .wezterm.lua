local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Some font presets
local fonts = {
	offlig = {
		family = "Offlig",
		harfbuzz_features = {},
	},
	fira = {
		family = "Fira Code",
		harfbuzz_features = {},
	},
	jetbrains = {
		family = "JetBrains Mono",
		harfbuzz_features = { "ss01" },
	},
	cursive = {
		family = "Cursive Mono",
		harfbuzz_features = { "dlig", "ss08", "ss12" },
	},
	uncursive = {
		family = "Uncursive Mono",
		harfbuzz_features = { "dlig", "ss08", "ss12" },
	},
}

-- Default shell
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "powershell", "-nologo" }
end

-- Appearance
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.color_scheme = "Catppuccin Mocha"

-- Custom font settings from user table
local user_font = fonts.cursive
if user_font.weight == nil then
	user_font.weight = 400
end

-- Set WezTerm font
config.font_size = 14
config.font = wezterm.font_with_fallback({
	{
		family = user_font.family,
		weight = user_font.weight,
		harfbuzz_features = user_font.harfbuzz_features,
	},
	{ family = "JetBrains Mono" },
})
-- config.line_height = 1.25

-- Behaviour
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.enable_kitty_graphics = true

return config
