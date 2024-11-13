local options = {
  formatters_by_ft = {
    -- Configs
    lua = { "stylua" },
    -- Web
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    -- Data languages
    json = { "prettier" },
    yaml = { "prettier" },
    toml = { "prettier" },
    -- Programming
    c = { "clang-format" },
    cpp = { "clang-format" },
    csharp = { "csharpier" },
    python = { "autopep8" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
