return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    notify_on_error = true,
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
      python = { 'isort' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      css = { 'prettier' },
      json = { 'prettier' },
      yaml = { 'prettier' },
      toml = { 'prettier' },
      xml = { 'xmlformatter' },
    },
  },
}
