local themes = {
  tokyonight = {
    'folke/tokyonight.nvim',
    priority = 1000, -- load this plugin before any others
    config = function()
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
  rosepine = {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000, -- load this plugin before any others
    config = function()
      require('rose-pine').setup {
        dark_variant = 'moon',
      }
      vim.cmd.colorscheme 'rose-pine'
    end,
  },
}
local selected = 'rosepine'

return themes[selected]
