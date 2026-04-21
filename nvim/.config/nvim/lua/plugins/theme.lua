local themes = {
    -- for lualine only
    tokyonight = {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "storm",
                light_style = "day",
            })
            vim.cmd.colorscheme("tokyonight")
        end,
    },
    github = {
        "projekt0n/github-nvim-theme",
        name = "github-theme",
        dependencies = { "scottmckendry/cyberdream.nvim" },
        lazy = false,
        priority = 1000,
        config = function()
            require("cyberdream").setup({})
            require("github-theme").setup({})

            vim.cmd.colorscheme("github_light")
        end,
    },
    default = {},
}
local selected = "github"

return {
    { "typicode/bg.nvim", lazy = false },
    themes[selected],
}
