-- List language servers with configurations here
return {
    -- Special config for Lua (see Neovim docs)
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

    -- Roku BrightScript
    bright_script = {
        cmd = { "bsc", "--lsp", "--stdio" },
        filetypes = { "brs", "xml", "brightscript" },
        root_markers = { ".git", "bsconfig.json", "Makefile", "makefile" },
        settings = {
            bsc = {
                configFile = "./bsconfig.json",
            },
        },
    },

    -- C/C++
    clangd = {},

    -- bash/zsh/sh
    bashls = {},
}
