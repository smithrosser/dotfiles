return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function()
      return {
        timeout_ms = 250,
        lsp_format = 'fallback',
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      c = { 'clang-format' },
      cpp = { 'clang-format' },
      cmake = { 'cmake_language_server' },
      rust = { 'rustfmt' },
      python = { 'isort', 'black' },
      javascript = { 'prettierd' },
      typescript = { 'prettierd' },
      css = { 'prettierd' },
      json = { 'prettierd' },
      yaml = { 'prettierd' },
      toml = { 'prettierd' },
    },
  },
}
