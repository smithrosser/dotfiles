return {
  --Package manager
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup {
        registries = {
          "github:Crashdummyy/mason-registry",
          "github:mason-org/mason-registry",
        },
      }
    end,
    opts = {
      ensure_installed = require "configs.packages",
    },
  },
  -- Smart syntax parser
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = require "configs.parsers",
    },
  },
  -- LSP configuration manager
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- C#/.NET LSP
  {
    "seblj/roslyn.nvim",
    ft = "cs",
  },
  -- Auto-formatter
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- enable format on save
    opts = require "configs.conform",
  },
  -- Inline documentation generator
  {
    "danymat/neogen",
    config = true,
  },
  -- Preview code actions
  {
    "aznhe21/actions-preview.nvim",
  },
  -- Notifications in bottom right corner
  {
    "vigoux/notifier.nvim",
    config = function()
      require "configs.notifier"
    end,
    lazy = false,
  },
}
