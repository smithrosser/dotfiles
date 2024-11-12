-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "lua_ls",
  "html",
  "cssls",
  "cmake",
  "pyright",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- tell clangd to ignore .proto files (seems not to work)
lspconfig.clangd.setup {
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
