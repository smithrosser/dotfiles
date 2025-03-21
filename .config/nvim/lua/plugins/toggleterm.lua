return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup {
      float_opts = {
        border = 'curved',
      },
    }
  end,
  event = 'VimEnter',
}
