local parsers = {
  -- Config editing stuff
  "vim",
  "vimdoc",
  "lua",

  -- Web dev
  "html",
  "css",
  "javascript",

  -- C-like
  "c",
  "cpp",
  "c_sharp",
  "cmake",

  -- Python
  "python",

  -- Data
  "yaml",
  "toml",
  "json",
  "xml",
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
