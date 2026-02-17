return {
    -- Tree-sitter: blazing-fast syntax trees & highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            local parsers = require("configs.parsers")

            require("nvim-treesitter").install(parsers)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = parsers,
                callback = function()
                    vim.treesitter.start()
                end,
            })
        end,
    },

    -- Better text object support
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        branch = "main",
        init = function()
            -- Disable entire built-in ftplugin mappings to avoid conflicts.
            vim.g.no_plugin_maps = true
        end,
        opts = {},
    },
}
