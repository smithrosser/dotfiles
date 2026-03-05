local wezterm = require("wezterm")

--
-- Commonly-used theme presets
--
local themes = {
    tokyonight = {
        light = "tokyonight-day",
        dark = "tokyonight",
    },
    everforest = {
        light = "Everforest Light Soft (Gogh)",
        dark = "Everforest Dark Soft (Gogh)",
    },
    nord = {
        light = "Nord Light (Gogh)",
        dark = "Nord (Gogh)",
    },
}
local theme_name = "nord"

--
-- Automatically determine light/dark theme from OS appearance
--
local function scheme_for_appearance(appearance)
    if appearance:find("Dark") then
        return themes[theme_name].dark
    else
        return themes[theme_name].light
    end
end
wezterm.on("window-config-reloaded", function(window, pane)
    local overrides = window:get_config_overrides() or {}
    local appearance = window:get_appearance()
    local scheme = scheme_for_appearance(appearance)

    if overrides.color_scheme ~= scheme then
        overrides.color_scheme = scheme
        window:set_config_overrides(overrides)
    end
end)

--
-- Configuration
--
local config = wezterm.config_builder()

-- Color scheme settings
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

-- Font
local fonts = require("fonts")
local chosen_font = fonts["iosevka_term"]
config.font_size = 12
config.font = wezterm.font({
    family = chosen_font.name,
    weight = chosen_font.weight,
    harfbuzz_features = chosen_font.features,
})
config.cell_width = fonts:get_cell_width(chosen_font)
config.line_height = fonts:get_line_height(chosen_font)

config.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }
config.window_decorations = "RESIZE | INTEGRATED_BUTTONS"
config.enable_wayland = false
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.term = "wezterm"

config.default_prog = (wezterm.target_triple == "x86_64-pc-windows-msvc" and { "pwsh", "-nologo" }) or nil

return config
