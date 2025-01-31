local packages = {
  -- Lua
  "lua-language-server",
  "stylua",

  -- Web dev
  "emmet-language-server",
  "typescript-language-server",
  "angular-language-server",
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
