return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "mason-org/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            { "SmiteshP/nvim-navic", opts = { separator = "  " } },
            "saghen/blink.cmp",
        },
        config = function()
            -- Configure diagnostics
            require("configs.diagnostics")()

            -- Add some useful keymaps
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("tdsr-lsp-attach", { clear = true }),
                callback = function(event)
                    -- Keymaps helper function
                    local map = function(keys, func, desc, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    local builtin = require("telescope.builtin")
                    map("<leader>ra", require("renamer").rename, "[R]en[a]me")
                    map("<leader>ca", require("tiny-code-action").code_action, "[C]ode [a]ctions", { "n", "x" })
                    map("gd", builtin.lsp_definitions, "[G]o to [d]efinition")
                    map("gD", builtin.lsp_type_definitions, "[G]o to type [D]efinition")
                    map("gi", builtin.lsp_implementations, "[G]o to [i]mplementation")
                    map("gr", builtin.lsp_references, "[G]o to [r]eferences")
                    map("<leader>d", builtin.diagnostics, "List [d]iagnostics")
                end,
            })

            -- Populate our package lists
            -- `servers` is separated into automatically installed and manually installed servers
            local servers = require("configs.servers")
            local utils = require("configs.packages")

            -- Install packages via Mason
            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(servers.auto_install or {}),
                automatic_enable = false, -- Enabling servers manually later on
            })
            require("mason-tool-installer").setup({ ensure_installed = utils })

            -- Find rokucode executable, register '.brs' filetype
            require("rokucode.lsp").setup({ auto_setup = false })

            -- Now, configure & enable each LSP
            -- 'Flatten' manual/automatic install servers into single table for LSP enable step
            local all_servers = vim.tbl_deep_extend("force", servers.auto_install, servers.manual_install)

            -- Generate capabilities: start with completion via blink.cmp
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            for name, server in pairs(all_servers) do
                -- Add blink.cmp capabilities to other capabilities provided by server
                server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

                -- Enable nvim-navic (if supported)
                server.on_attach = function(client, bufnr)
                    if client.server_capabilities.documentSymbolProvider then
                        require("nvim-navic").attach(client, bufnr)
                    end
                end

                -- Enable the servers
                vim.lsp.config(name, server)
                vim.lsp.enable(name)
            end
        end,
    },
}
