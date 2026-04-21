return {
    -- Tree-sitter: blazing-fast syntax trees & highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            local parsers = require("configs.parsers")

            -- Set up custom BrightScript tree-sitter parser
            vim.opt.runtimepath:prepend(vim.fn.expand("~/ws/poc/tree-sitter-brs"))
            vim.treesitter.language.register("brs", "brightscript")

            require("nvim-treesitter").install(parsers)
            local ft_patterns = vim.list_extend({ "brightscript" }, parsers)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = ft_patterns,
                callback = function()
                    vim.treesitter.start()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
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
