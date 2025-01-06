local packages = {
  -- Lua
  "lua-language-server",
  "stylua",

  -- Web dev
  "html-lsp",
  "css-lsp",
  "prettier",

  -- C/C++
  "clangd",
  "clang-format",

  -- Python
  "pyright",
  "autopep8",

  -- Graphics
  "glsl_analyzer",
}

return {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup {}
  end,
  opts = {
    ensure_installed = packages,
  },
}
