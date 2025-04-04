vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.showmode = false

-- sync neovim & os clipboards
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.wrap = false
vim.opt.breakindent = true -- indent wrapped lines (wrap disabled atm)
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300 -- timeout for keymaps
vim.opt.laststatus = 3 -- global statusline
vim.opt.cmdheight = 0 -- hide cmdline

-- default tab width (when sleuth fails)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- handling new splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- whitespace rendering
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split' -- live preview of substitutions
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true
