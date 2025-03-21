return {
  'echasnovski/mini.nvim',
  config = function()
    -- smarter text object selection
    require('mini.ai').setup { n_lines = 500 }
    -- better surround () "" [] handling
    require('mini.surround').setup()

    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = true }
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
