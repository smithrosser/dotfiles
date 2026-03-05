local themes = {
    -- Themes should be able to change based on vim.o.background
    kanagawa = {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                background = { dark = "wave", light = "lotus" },
                colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
            })
            vim.cmd.colorscheme("kanagawa")
        end,
    },
    nord = {
        "gbprod/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nord").setup({})
            vim.cmd.colorscheme("nord")
        end,
    },
    nordic = {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nordic").setup({
                cursorline = {
                    theme = "light",
                },
            })
            vim.cmd.colorscheme("nordic")
        end,
    },
    everforest = {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            require("everforest").setup({
                background = "soft",
            })
            vim.cmd.colorscheme("everforest")
        end,
    },
    default = {},
}
local selected = "nord"

return {
    { "typicode/bg.nvim", lazy = false },
    themes[selected],
}
