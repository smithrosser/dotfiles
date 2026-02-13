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
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
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
        config = require("configs.lualine"),
    },

    -- Winbar.nvim: powerline-style winbar
    {
        "fgheng/winbar.nvim",
        opts = {},
    },

    -- renamer.nvim: better-looking symbol renaming
    {
        "filipdutescu/renamer.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            title = "Rename",
            show_refs = true,
            border = true,
            with_popup = true,
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

    -- toggleterm.nvim: floating terminal with state
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {},
    },
}
