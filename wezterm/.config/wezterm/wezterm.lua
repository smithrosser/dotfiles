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
}
local theme_name = "everforest"

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
    color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
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
    window_padding = { left = 30, right = 30, top = 30, bottom = 30 },

    enable_wayland = false,
    enable_tab_bar = false,
    enable_scroll_bar = false,
    term = "wezterm",

    default_prog = (wezterm.target_triple == "x86_64-pc-windows-msvc" and { "pwsh", "-nologo" }) or nil,
}
