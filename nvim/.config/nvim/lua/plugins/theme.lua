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
    onenord = {
        "rmehri01/onenord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("onenord").setup({})
            vim.cmd.colorscheme("onenord")
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
local selected = "everforest"

return {
    { "typicode/bg.nvim", lazy = false },
    themes[selected],
}
