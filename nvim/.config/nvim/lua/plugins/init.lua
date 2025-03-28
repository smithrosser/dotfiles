return {
  -- misc plugins
  'tpope/vim-sleuth', -- detect shiftwidth/tabstop from filetype

  -- basic config
  require 'plugins.gitsigns', -- git diffs in gutter
  require 'plugins.which-key', -- live cheatsheet for keys
  require 'plugins.lazydev', -- lsp symbols for nvim config
  require 'plugins.telescope', -- fuzzy finder
  require 'plugins.lsp', -- lsp configurations
  require 'plugins.conform', -- auto formatting
  require 'plugins.cmp', -- auto code completion
  require 'plugins.todo', -- highlight todo/note/etc
  require 'plugins.theme', -- color scheme
  require 'plugins.mini', -- statusline, etc.
  require 'plugins.treesitter', -- syntax highlighting/navigation
  require 'plugins.toggleterm', -- floating terminal

  -- kickstart plugins
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.lint',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns',
}
