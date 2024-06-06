return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "prettier",
        "html-lsp",
        "css-lsp",
        "clangd",
        "clang-format",
        "cmake-language-server",
        "cmakelang",
        "pyright",
        "autopep8",
        "eslint-lsp",
        "rust-analyzer",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
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
        "rust",
        "proto",
        "go",
      },
    },
  },
  {
    "cdelledonne/vim-cmake",
    event = "BufEnter",
    config = function()
      require "configs.vim-cmake"
    end,
  },
  {
    "vigoux/notifier.nvim",
    config = function()
      require "configs.notifier"
    end,
    lazy = false,
  },
  {
    "xiyaowong/virtcolumn.nvim",
    event = "BufEnter *.*",
    config = function()
      vim.g.virtcolumn_char = "▕"
      vim.g.virtcolumn_priority = 10
    end,
  },
}
