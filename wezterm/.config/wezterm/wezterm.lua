local wezterm = require("wezterm")

--
-- Helper functions for determining dark/light theme
--
local function get_appearance()
    if wezterm.gui then
        return wezterm.gui.get_appearance()
    end
    return "Dark"
end

local function get_scheme_for_appearance(appearance)
    if appearance:find("Dark") then
        return "tokyonight"
    else
        return "tokyonight-day"
    end
end

-- Configure callback for light/dark theme switch
local function broadcast_appearance(window, pane)
    local is_dark = window:get_appearance():find("Dark") ~= nil
    local mode = is_dark and "dark" or "light"

    pane:set_user_var("APPEARANCE", mode)
end
wezterm.on("window-config-reloaded", broadcast_appearance)
wezterm.on("window-focus-changed", broadcast_appearance)

--
-- Commonly used font presets
--
local fonts = {
    recursive = {
        name = "RecMonoCasual Nerd Font", -- font family name
        weight = 450, -- font weight
        italic = true, -- enable italics
        features = {}, -- opentype features (stylistic sets, etc)
        squeeze = false, -- reduced cell width
    },
    jetbrains = {
        name = "JetBrainsMono Nerd Font", -- font family name
        weight = 450, -- font weight
        italic = true, -- enable italics
        features = {}, -- opentype features (stylistic sets, etc)
        squeeze = false, -- reduced cell width
    },
    fira_code = {
        name = "FiraCode Nerd Font",
        weight = 450,
        italic = false,
        features = {},
        squeeze = false,
    },
    iosevka_term = {
        name = "IosevkaTerm Nerd Font",
        weight = 500,
        italic = true,
        features = { "ss07" },
        squeeze = false,
    },
}
local font_name = "recursive"

--
-- Generate font rule for disabling italics if requested
--
local function get_italics_rules(enable)
    if enable then
        return {}
    end
    return {
        {
            italic = true,
            font = wezterm.font({ family = fonts[font_name].name, italic = false }),
        },
    }
end

--
-- Configuration
--
return {
    color_scheme = get_scheme_for_appearance(get_appearance()),
    font_size = 14,
    font = wezterm.font({
        family = fonts[font_name].name,
        weight = fonts[font_name].weight,
        harfbuzz_features = fonts[font_name].features,
    }),
    font_rules = get_italics_rules(fonts[font_name].italic),

    cell_width = (fonts[font_name].squeeze and 0.9) or 1,
    -- line_height = 1.1,

    front_end = "WebGpu",
    window_decorations = "TITLE | RESIZE | MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR",
    -- window_padding = { left = 5, right = 5, top = 5, bottom = 5 },

    enable_wayland = false,
    enable_tab_bar = false,
    enable_scroll_bar = false,
    term = "wezterm",

    default_prog = (wezterm.target_triple == "x86_64-pc-windows-msvc" and { "pwsh", "-nologo" }) or nil,
}
