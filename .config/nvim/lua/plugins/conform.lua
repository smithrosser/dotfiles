local options = {
  formatters_by_ft = {
    -- Configs
    lua = { "stylua" },

    -- Web
    css = { "prettier" },
    scss = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    angular = { "prettier" },

    -- Data languages
    json = { "prettier" },
    yaml = { "prettier" },
    toml = { "prettier" },

    -- Programming
    c = { "clang-format" },
    cpp = { "clang-format" },
    python = { "autopep8" },

    -- Graphics
    glsl = { "glsl_analyzer" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return {
  "stevearc/conform.nvim",
  event = "BufWritePre", -- enable format on save
  opts = options,
}
