local parsers = {
  'c',
  'cpp',
  'cmake',
  'lua',
  'python',
  'typescript',
  'javascript',
  'vimdoc',
  'json',
  'toml',
  'yaml',
  'xml',
  'brightscript',
}

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  tag = 'v0.10.0',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = parsers,
      auto_install = true,
      indent = { enable = true },
      highlight = { enable = true },
    }
  end,
}
