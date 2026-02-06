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
}
