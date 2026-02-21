return function()
    local ivy_theme = require("telescope.themes").get_ivy()
    ivy_theme.layout_config = {
        bottom_pane = {
            height = 0.9,
        },
    }
    ivy_theme.prompt_prefix = "  "
    ivy_theme.selection_caret = " "

    require("telescope").setup({
        defaults = ivy_theme,
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown(),
            },
        },
        pickers = {
            find_files = {
                file_ignore_patterns = { "%.git/", "node_modules/" },
                hidden = true,
            },
        },
    })
    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    -- Set shortcuts for some pickers
    local builtin = require("telescope.builtin")

    -- Search available Telescope pickers
    vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Search files" })
    vim.keymap.set("n", "<leader>.", builtin.live_grep, { desc = "Search files for keyword" })
    vim.keymap.set("n", "<leader>>", function()
        require("telescope.builtin").live_grep({ default_text = vim.fn.expand("<cword>") })
    end, { desc = "Search files for keyword under cursor" })
    vim.keymap.set("n", "<C-_>", builtin.current_buffer_fuzzy_find, { desc = "Search current file" })
    vim.keymap.set("n", "<leader>gg", builtin.git_status, { desc = "Search git diffs" })
    vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Telescope [s]earch [s]elect" })
end
