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
      },
    },
  },
  {
    "cdelledonne/vim-cmake",
    config = function()
      vim.g.cmake_build_dir_location = "./build"
      vim.g.cmake_default_config = "Debug"
      vim.g.cmake_link_compile_commands = 1
    end,
    lazy = false,
  },
}
