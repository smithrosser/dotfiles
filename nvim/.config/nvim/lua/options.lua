vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.showmode = false

-- Sync neovim & os clipboards
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.wrap = false
vim.opt.breakindent = true -- Indent wrapped lines (wrap disabled atm)
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300 -- Timeout for keymaps
vim.opt.laststatus = 3 -- Global statusline
vim.opt.cmdheight = 0 -- Hide cmdline

-- Default tab width (when sleuth fails)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Handling new splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Whitespace rendering
vim.opt.list = true
vim.opt.listchars = { tab = '  ', trail = '·', space = '·' }

vim.opt.inccommand = 'split' -- Live preview of substitutions
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true
