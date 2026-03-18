local wezterm = require("wezterm")
local M = {}

M.families = {
    recursive = {
        name = "RecMonoCasual Nerd Font", -- font family name
        weight = 450, -- font weight
        features = {}, -- opentype features (stylistic sets, etc)
        allow_italic = true, -- enable italics
        squeeze = false, -- reduce cell width
        squish = false, -- reduce line height
    },
    google = {
        name = "Google Sans Code",
        weight = 400,
        allow_italic = true,
        features = {},
        squeeze = false,
        squish = false,
    },
    fira_code = {
        name = "FiraCode Nerd Font",
        weight = 400,
        allow_italic = false,
        features = { "zero", "ss02", "cv16", "cv30", "cv31" },
        squeeze = false,
        squish = false,
    },
    iosevka = {
        name = "IosevkaTerm Nerd Font",
        weight = 400,
        allow_italic = true,
        features = { "ss20" },
        squeeze = false,
        squish = false,
    },
}
M.fallback_font = "fira_code"
M.selected_font = "google"
M.font_size = 11

--
-- Helper functions
--

M.get_font = function(font_name)
    local font = M.families[font_name]
    return {
        family = font.name,
        weight = font.weight,
        harfbuzz_features = font.features,
    }
end

M.get_rules = function(font)
    local rules = {}
    if not font.allow_italics then
        rules = {
            {
                italic = true,
                font = wezterm.font({
                    family = font.name,
                    style = "Roman",
                }),
            },
        }
    end
    return rules
end

M.get_cell_width = function(font)
    return (font.squeeze and 0.9) or 1.0
end

M.get_line_height = function(font)
    return (font.squish and 0.9) or nil
end

return M
