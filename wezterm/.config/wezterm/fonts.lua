local wezterm = require("wezterm")

return {
    recursive = {
        name = "RecMonoCasual Nerd Font", -- font family name
        weight = 450, -- font weight
        features = {}, -- opentype features (stylistic sets, etc)
        allow_italic = true, -- enable italics
        squeeze = false, -- reduce cell width
        squish = false, -- reduce line height
    },
    offlig = {
        name = "Offlig Nerd Font",
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
    iosevka_term = {
        name = "IosevkaTerm Nerd Font",
        weight = 500,
        allow_italic = true,
        features = { "ss07" },
        squeeze = false,
        squish = true,
    },

    -- Helper functions
    get_rules = function(font)
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
    end,
    get_cell_width = function(font)
        return (font.squeeze and 0.9) or 1.0
    end,
    get_line_height = function(font)
        return (font.squish and 0.9) or nil
    end,
}
