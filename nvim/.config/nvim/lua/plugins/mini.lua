return {
  'echasnovski/mini.nvim',
  config = function()
    -- smarter text object selection
    require('mini.ai').setup { n_lines = 500 }
    -- better surround () "" [] handling
    require('mini.surround').setup()

    local statusline = require 'mini.statusline'
    statusline.setup {
      use_icons = true,
      content = {
        active = function()
          local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 1000 }
          local git = MiniStatusline.section_git { trunc_width = 40 }
          local diff = MiniStatusline.section_diff { trunc_width = 75 }
          local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
          local lsp = MiniStatusline.section_lsp { trunc_width = 75 }
          local filename = MiniStatusline.section_filename { trunc_width = 140 }
          local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
          local location = MiniStatusline.section_location { trunc_width = 200 }
          local search = MiniStatusline.section_searchcount { trunc_width = 75 }
          local macro = ((vim.fn.reg_recording() ~= '') and (' ' .. vim.fn.reg_recording())) or ''

          return MiniStatusline.combine_groups {
            { hl = mode_hl, strings = { mode } },
            { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
            '%<', -- Mark general truncate point
            { hl = 'MiniStatuslineFilename', strings = { filename } },
            '%=', -- End left alignment
            { hl = 'MiniStatuslineModeCommand', strings = { macro } },
            { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
            { hl = mode_hl, strings = { search, location } },
          }
        end,
      },
    }
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
