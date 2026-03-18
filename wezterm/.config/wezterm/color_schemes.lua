local wezterm = require("wezterm")
local M = {}

--
-- Commonly-used theme presets here
--
M.themes = {
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
M.selected_theme = "tokyonight"

-- Helper function to get theme
M.get_scheme = function(appearance)
    return (M.themes[M.selected_theme].dark and appearance:find("Dark")) or M.themes[M.selected_theme].light
end

--
-- Automatically determine light/dark theme from OS appearance
--
wezterm.on("window-config-reloaded", function(window, _)
    local overrides = window:get_config_overrides() or {}
    local appearance = window:get_appearance()
    local scheme = M.get_scheme(appearance)

    if overrides.color_scheme ~= scheme then
        overrides.color_scheme = scheme
        window:set_config_overrides(overrides)
    end
end)

return M
