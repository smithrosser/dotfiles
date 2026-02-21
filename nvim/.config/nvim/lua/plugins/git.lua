return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                current_line_blame = true,
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol",
                    delay = 1000,
                },
                current_line_blame_formatter = "   <author>, <author_time:%Y-%m-%d> - <summary>",
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                },

                on_attach = function(bufnr)
                    local gitsigns = require("gitsigns")

                    -- Keymap for blame floating window
                    vim.keymap.set("n", "<leader>gb", function()
                        vim.notify("blaming")
                        gitsigns.blame_line({ full = true })
                    end, { buffer = bufnr, noremap = true })
                end,
            })
        end,
    },
}
