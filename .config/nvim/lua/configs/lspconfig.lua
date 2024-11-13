-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
  "html",
  "cssls",
  "lua_ls",
  "cmake",
  "pyright",
  "protols",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Enable clang-tidy & ignore proto files
lspconfig.clangd.setup {
  cmd = { "clangd", "--clang-tidy" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}
