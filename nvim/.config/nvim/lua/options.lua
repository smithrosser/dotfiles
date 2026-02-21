vim.opt.number = true
vim.opt.cursorline = true
vim.opt.mouse = "a" -- Mouse enabled in all modes
vim.opt.showmode = false -- Disable '-- INSERT/NORMAL/etc --' text at bottom

-- Sync neovim & os clipboards
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

vim.opt.wrap = false -- Disable line wrap
vim.opt.breakindent = true -- Indent wrapped lines (if wrapping)
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.timeoutlen = 300 -- Timeout for keymaps
vim.opt.laststatus = 3 -- Global statusline
vim.opt.cmdheight = 0 -- Hide cmdline

-- Default tab width
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Handling new splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Whitespace rendering
vim.opt.listchars = { tab = "  ", trail = "·" }
vim.opt.list = true

vim.opt.inccommand = "split" -- Live preview of substitutions
vim.opt.scrolloff = 10
vim.opt.confirm = true
