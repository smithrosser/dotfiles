-- Pinky saver
vim.keymap.set("n", ";", ":")

-- Plugin/package managers
vim.keymap.set("n", "<leader>la", ":Lazy<CR>", { desc = "Open [la]zy" })
vim.keymap.set("n", "<leader>ma", ":Mason<CR>", { desc = "Open [ma]son" })

-- Commenting
vim.keymap.set("n", "<leader>/", "gcc", { desc = "Toggle comment (line)", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "Toggle comment (selection)", remap = true })

-- Briefly highlight selection when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("tdsr-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Clear highlight after search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
