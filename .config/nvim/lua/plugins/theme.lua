return {
  'folke/tokyonight.nvim',
  priority = 1000, -- load this plugin before any others
  config = function()
    vim.cmd.colorscheme 'tokyonight-moon'
  end,
}
