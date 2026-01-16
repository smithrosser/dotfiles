return {
  'j-hui/fidget.nvim',
  config = function()
    require('fidget').setup {
      render_limit = math.huge,
      progress_ttl = math.huge,
    }
    vim.notify = require('fidget').notify
  end,
}
