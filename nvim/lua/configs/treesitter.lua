local treesitter = require "treesitter"

treesitter.setup {
  ensure_installed = {
    "vim",
    "lua",
    "vimdoc",
    "html",
    "css",
    "c",
    "cpp",
    "python",
    "markdown",
    "json",
    "cmake",
    "javascript",
  },
}
