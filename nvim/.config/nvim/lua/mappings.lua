vim.g.mapleader = ' ' -- must be first!
vim.g.maplocalleader = ' '

-- the pinky saver
vim.keymap.set('n', ';', ':', { desc = 'Enter command mode' })

-- lsp diagnostics
vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { desc = 'LSP: [l]ist [d]iagnostics' })

-- terminal navigation
vim.keymap.set('n', '<C-;>', function()
  return require('toggleterm.terminal').Terminal:new({ direction = 'float' }):toggle()
end, { desc = 'Toggle floating terminal' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- lazy
vim.keymap.set('n', '<leader>lz', ':Lazy<CR>', { desc = 'Open [l]a[z]y' })
-- mason
vim.keymap.set('n', '<leader>ms', ':Mason<CR>', { desc = 'Open [m]a[s]on' })

-- window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<leader>x', ':q<CR>', { desc = 'Move focus to the upper window' })

-- commenting
vim.keymap.set('n', '<leader>/', 'gcc', { desc = 'Toggle comment (line)', remap = true })
vim.keymap.set('v', '<leader>/', 'gc', { desc = 'Toggle comment (selection)', remap = true })

-- generating documentation comments
vim.keymap.set('n', '<leader>fd', function()
  require('neogen').generate()
end, { desc = 'Generate documentation under cursor' })

-- autocmd for highlighting copied text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- leetcode.nvim
vim.keymap.set('n', '<leader>lc', ':Leet<CR>', { desc = 'Open [l]eet[c]ode menu' })
vim.keymap.set('n', '<leader>ll', ':Leet list<CR>', { desc = '[l]eetcode: [l]ist problems' })
vim.keymap.set('n', '<leader>lr', ':Leet run<CR>', { desc = '[l]eetcode: [r]un solution' })
vim.keymap.set('n', '<leader>ls', ':Leet submit<CR>', { desc = '[l]eetcode: [s]ubmit solution' })

-- misc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- clear search highlights on <Esc>
