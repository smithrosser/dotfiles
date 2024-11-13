require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Floating terminal
map({ "n", "t" }, "<leader>;", function()
  require("nvchad.term").toggle { pos = "float", id = "term" }
end)

-- Fuzzy finder
map("n", "<leader>ff", require("telescope.builtin").git_files, { desc = "Telescope: search Git files" })
map("n", "<leader>pf", require("telescope.builtin").find_files, { desc = "Telescope: search all files" })

-- Generate documentation
map("n", "<leader>gf", function()
  require("neogen").generate()
end, { desc = "Neogen: Generate documentation under cursor" })

-- Preview code actions
map({ "v", "n" }, "<leader>ga", require("actions-preview").code_actions)
