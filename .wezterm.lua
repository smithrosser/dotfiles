local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Default shell
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "powershell", "-nologo" }
end

-- Appearance
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.color_scheme = "Ashes (base16)"

-- Font
config.font_size = 12
config.font = wezterm.font_with_fallback({
	{ family = "Rec Mono Casual", weight = 400, harfbuzz_features = {} },
	{ family = "Symbols Nerd Font", scale = 1 },
})
-- config.line_height = 1.2

-- Behaviour
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.enable_kitty_graphics = true
config.enable_wayland = false

return config
