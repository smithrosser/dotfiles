local color_schemes = require("color_schemes")
local fonts = require("fonts")
local wezterm = require("wezterm")
local config = wezterm.config_builder()

print("Loading config...")

-- Color scheming
config.color_scheme = color_schemes:get_scheme()

-- Fonts
local selected_font = fonts.families[fonts.selected_font]
local fallback_font = fonts.families[fonts.fallback_font]

config.font_size = fonts.size
config.font = wezterm.font_with_fallback({
    {
        family = selected_font.name,
        weight = selected_font.weight,
        harfbuzz_features = selected_font.features,
    },
    {
        family = fallback_font.name,
        weight = fallback_font.weight,
        harfbuzz_features = fallback_font.features,
    },
})
config.cell_width = fonts:get_cell_width(selected_font)
config.line_height = fonts:get_line_height(selected_font)

-- Appearance
config.window_decorations = "RESIZE | INTEGRATED_BUTTONS"
config.window_padding = {
    left = 10,
    right = 10,
    top = (wezterm.target_triple == "aarch64-apple-darwin" and 50) or 10,
    bottom = 10,
}
config.enable_wayland = false
config.enable_tab_bar = false
config.enable_scroll_bar = false

-- Behaviour
config.term = "wezterm"
config.default_prog = (wezterm.target_triple == "x86_64-pc-windows-msvc" and { "pwsh", "-nologo" }) or nil

return config
