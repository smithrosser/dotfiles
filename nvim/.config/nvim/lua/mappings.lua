vim.g.mapleader = ' ' -- must be first!
vim.g.maplocalleader = ' '

vim.keymap.set('n', ';', ':', { desc = 'Enter command mode' })
vim.keymap.set('n', '<leader>x', ':q<CR>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- clear search highlights on <Esc>
vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { desc = 'LSP: [l]ist [d]iagnostics' })

vim.keymap.set('n', '<C-;>', function()
  return require('toggleterm.terminal').Terminal:new({ direction = 'float' }):toggle()
end, { desc = 'Toggle floating terminal' })

vim.keymap.set('n', '<leader>/', 'gcc', { desc = 'Toggle comment (line)', remap = true })
vim.keymap.set('v', '<leader>/', 'gc', { desc = 'Toggle comment (selection)', remap = true })
vim.keymap.set('n', '<leader>lz', ':Lazy<CR>', { desc = 'Open [l]a[z]y' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

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
