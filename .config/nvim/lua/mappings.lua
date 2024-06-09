require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Suppress arrow keys lol
local function reminder(key)
  vim.notify("did you mean '" .. key .. "'?")
end
map({ "n", "i" }, "<Left>", function()
  reminder "h"
end)
map({ "n", "i" }, "<Down>", function()
  reminder "j"
end)
map({ "n", "i" }, "<Up>", function()
  reminder "k"
end)
map({ "n", "i" }, "<Right>", function()
  reminder "l"
end)

-- Fuzzy finder
map("n", "<leader>ff", require("telescope.builtin").git_files, { desc = "Telescope: search Git files" })
map("n", "<leader>pf", require("telescope.builtin").find_files, { desc = "Telescope: search Git files" })

-- CMake commands
map("n", "<leader>cg", "<CMD> CMakeGenerate <CR>", { desc = "CMake: Generate" })
map("n", "<leader>cb", "<CMD> CMakeBuild <CR>", { desc = "CMake: Build" })
map("n", "<leader>ci", "<CMD> CMakeInstall <CR>", { desc = "CMake: Install" })
map("n", "<leader>ct", "<CMD> CMakeTest <CR>", { desc = "CMake: Test" })
map("n", "<leader>cx", "<CMD> CMakeClose <CR>", { desc = "CMake: Close" })

-- CMake run/stop command
map("n", "<leader>cr", function()
  vim.ui.input({
    prompt = "Enter target > ",
  }, function(target)
    vim.cmd("CMakeRun " .. target)
  end)
end, { desc = "CMake: Run target" })
map("n", "<leader>cs", "<CMD> CMakeStop <CR>", { desc = "CMake: Stop" })
