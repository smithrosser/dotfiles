local mason = require "mason"

mason.setup {
  ensure_installed = {
    -- Lua (mainly Neovim configs)
    "lua-language-server",
    "stylua",
    -- Web development
    "prettier",
    "html-lsp",
    "css-lsp",
    "eslint-lsp",
    "svelte-language-server",
    "tailwindcss-language-server",
    -- C/C++
    "clangd",
    "clang-format",
    "cmake-language-server",
    "cmakelang",
    -- Python
    "pyright",
    "autopep8",
    -- Rust
    "rust-analyzer",
  },
}
