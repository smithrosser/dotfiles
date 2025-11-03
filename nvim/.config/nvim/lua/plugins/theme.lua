local themes = {
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
  everforest = {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('everforest').setup {
        background = 'soft',
      }
      vim.cmd.colorscheme 'everforest'
    end,
  },
  onenord = {
    'rmehri01/onenord.nvim',
    priority = 1000,
    config = function()
      require('onenord').setup {}
      vim.cmd.colorscheme 'onenord'
    end,
  },
}
local selected = 'everforest'

return themes[selected]
