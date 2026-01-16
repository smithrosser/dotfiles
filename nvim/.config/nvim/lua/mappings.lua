vim.g.mapleader = " " -- Must be first!
vim.g.maplocalleader = " "

-- The pinky saver
vim.keymap.set("n", ";", ":", { desc = "Enter command mode" })

-- Package managers
vim.keymap.set("n", "<leader>lz", ":Lazy<CR>", { desc = "Open [l]a[z]y" })
vim.keymap.set("n", "<leader>ms", ":Mason<CR>", { desc = "Open [m]a[s]on" })

-- Buffer navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left buffer" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right buffer" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower buffer" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper buffer" })
vim.keymap.set("n", "<leader>x", ":q<CR>", { desc = "Close buffer" })

-- Comments
vim.keymap.set("n", "<leader>/", "gcc", { desc = "Toggle comment (line)", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "Toggle comment (selection)", remap = true })

-- Provide visual feedback when copying
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Clear highlighted search results
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
