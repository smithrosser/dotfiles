return {
    --
    -- Language servers installed automatically through mason-lspconfig
    --
    auto_install = {
        -- Special Lua config (see Neovim docs)
        lua_ls = {
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                        path ~= vim.fn.stdpath("config")
                        and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
                    then
                        return
                    end
                end

                client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                    runtime = {
                        version = "LuaJIT",
                        path = { "lua/?.lua", "lua/?/init.lua" },
                    },
                    workspace = {
                        checkThirdParty = false,
                        -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
                        --  See https://github.com/neovim/nvim-lspconfig/issues/3189
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                })
            end,
            settings = {
                Lua = {},
            },
        },

        -- C/C++
        clangd = {
            cmd = {
                "clangd",
                "--compile-commands-dir=/home/tsmithrosser/ws/firmware/worktrees/main/build",
                "--background-index",
                "--clang-tidy",
                "--log=verbose",
            },
        },

        -- python
        pyright = {},

        -- bash/zsh/sh
        bashls = {},

        -- BrighterScript LSP (Roku Community LSP)
        bright_script = {
            cmd = { "bsc", "--lsp", "--stdio" },
            filetypes = { "brs", "xml", "brightscript" },
            root_markers = { "bsconfig.json", ".git", "manifest", "Makefile", "makefile" },
            settings = {
                bsc = {
                    configFile = "./bsconfig.json",
                    diagnosticFilters = true,
                },
            },
        },
    },

    --
    -- Language servers installed manually by the user
    --
    manual_install = {
        -- RokuCode BrightScript LSP
        -- brightscript = {
        --     cmd = { "rokucode", "lsp", "brightscript", "start" },
        --     filetypes = { "brightscript", "brs", "xml" },
        --     root_markers = {
        --         "manifest", -- Roku app manifest (always present)
        --         ".git", -- Git repository root
        --         ".rokucode", -- RokuCode config directory
        --         ".opencode", -- OpenCode config directory
        --         "source", -- Common BrightScript source directory
        --         "components", -- SceneGraph components directory
        --     },
        --     settings = {
        --         brightscript = {
        --             diagnostics = { enable = true },
        --             hover = { enable = true },
        --             completion = { enable = true },
        --         },
        --     },
        -- },
    },
}
