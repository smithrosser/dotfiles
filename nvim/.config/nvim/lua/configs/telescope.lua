return function()
    require("telescope").setup({
        defaults = {
            width = 0.9,
            height = 0.9,
        },
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
    vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
    -- Search filenames
    vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Search files" })
    -- Search inside files
    vim.keymap.set("n", "<leader>.", builtin.live_grep, { desc = "Search inside files" })
    -- Search current file
    vim.keymap.set("n", "<C-/>", function()
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
            winblend = 10,
            previewer = false,
        }))
    end, { desc = "Search current file" })
    -- Search git changes
    vim.keymap.set("n", "<leader>gg", builtin.git_status, { desc = "Search inside files" })
end
