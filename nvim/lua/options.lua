require "nvchad.options"

-- Appearance
vim.o.cursorlineopt = "both"
vim.opt.listchars = {
  space = "·",
  trail = "·",
  tab = "› ",
}
vim.opt.list = true
vim.opt.wrap = false
vim.opt.scrolloff = 8

-- Indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.shiftwidth = 4
vim.opt.expandtab = true

-- Misc
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.updatetime = 50
