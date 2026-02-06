return {
    -- mini.icons: Lovely icon pack
    {
        "nvim-mini/mini.icons",
        version = "*",
        config = function()
            require("mini.icons").setup()
            MiniIcons.mock_nvim_web_devicons() -- Integrate with nvim-web-devicons
        end,
    },

    -- Telescope: fuzzy find anything
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        event = "VimEnter",
        config = require("configs.telescope"),
    },

    -- Neotree: configurable file tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        cmd = "Neotree",
        keys = {
            { "\\", ":Neotree reveal<CR>", desc = "Neotree: open", silent = true },
        },
        opts = require("configs.neo-tree"),
    },

    -- Lualine: improved statusline
    {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        opts = {
            sections = {
                -- Add navic context to statusline
                lualine_c = {
                    {
                        function()
                            return require("nvim-navic").get_location()
                        end,
                        cond = function()
                            return require("nvim-navic").is_available()
                        end,
                    },
                },
            },
        },
    },

    -- indent-blankline: highlights indented blocks clearly
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = { indent = { char = "│" } },
    },

    -- fidget.nvim: better notifications
    {
        "j-hui/fidget.nvim",
        config = function()
            local fidget = require("fidget")

            fidget.setup({})
            vim.notify = fidget.notify
        end,
    },
}
