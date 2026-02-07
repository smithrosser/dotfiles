return {
    -- Speedy auto-formatting
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_format = "fallback" })
                end,
                mode = "",
                desc = "[F]ormat buffer",
            },
        },
        opts = require("configs.conform"),
    },

    -- Auto close paired chars (quotes, brackets, etc.)
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    -- Highlight TODO, NOTE, etc.
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false },
    },

    -- Telescope picker for code actions
    {
        "rachartier/tiny-code-action.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        event = "LspAttach",
        opts = {},
    },

    -- Pretty self-explanatory
    { "NMAC427/guess-indent.nvim", opts = {} },
}
