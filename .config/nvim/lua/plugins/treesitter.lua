local parsers = {
  -- Config editing stuff
  "vim",
  "vimdoc",
  "lua",
  "markdown",

  -- Web dev
  "html",
  "css",
  "javascript",
  "typescript",
  "angular",

  -- C-like
  "c",
  "cpp",
  "c_sharp",
  "cmake",

  -- Python
  "python",

  -- Data
  "xml",
  "yaml",
  "toml",
  "json",
  "jsonc",
  "proto",

  -- Graphics
  "glsl",
}

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = parsers,
  },
}
