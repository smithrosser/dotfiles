local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    toml = { "prettier" },
    javascript = { "prettier" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    python = { "autopep8" },
    rust = { "rustfmt" },
  },

  format_on_save = function(bufnr)
    -- -- Prevent autoformat for CMake files
    -- local bufname = vim.api.nvim_buf_get_name(bufnr)
    -- if bufname:match "/\\.(cmake)$/" then
    --   vim.notify "*.cmake file detected, not formatting..."
    --   return
    -- end
    -- if bufname:match "/CMakeLists.txt/" then
    --   vim.notify "CMakeLists.txt file detected, not formatting..."
    --   return
    -- end

    return { timeout_ms = 250, lsp_format = "fallback" }
  end,
}

require("conform").setup(options)
