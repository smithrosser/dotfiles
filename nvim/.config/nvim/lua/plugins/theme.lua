local themes = {
    kanagawa = {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                theme = "lotus",
                colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
            })
            vim.cmd("colorscheme kanagawa")
        end,
    },
}
local selected = "kanagawa"

return { themes[selected] }
