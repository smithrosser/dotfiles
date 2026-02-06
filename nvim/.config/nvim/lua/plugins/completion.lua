return {
    { -- Autocompletion
        "saghen/blink.cmp",
        event = "VimEnter",
        version = "1.*",
        dependencies = {
            -- LuaSnip: our snippet engine
            {
                "L3MON4D3/LuaSnip",
                version = "2.*",
                build = (function()
                    -- Build step is required for regex support in snippets.
                    return "make install_jsregexp"
                end)(),
                dependencies = {
                    -- A big collection of snippets for most languages
                    {
                        "rafamadriz/friendly-snippets",
                        config = function()
                            require("luasnip.loaders.from_vscode").lazy_load()
                        end,
                    },
                },
                opts = {},
            },
        },
        opts = {
            sources = {
                default = { "lsp", "path", "snippets" },
            },
            keymap = {
                -- 'default' (recommended) for mappings similar to built-in completions
                --   <c-y> to accept ([y]es) the completion.
                --    This will auto-import if your LSP supports it.
                --    This will expand snippets if the LSP sent a snippet.

                -- All presets have the following mappings:
                -- <tab>/<s-tab>: move to right/left of your snippet expansion
                -- <c-space>: Open menu or open docs if already open
                -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
                -- <c-e>: Hide menu
                -- <c-k>: Toggle signature help
                preset = "default",
            },
            appearance = { nerd_font_variant = "mono" },
            completion = { documentation = { auto_show = true, auto_show_delay_ms = 500 } },
            snippets = { preset = "luasnip" },
            fuzzy = { implementation = "lua" },
            signature = { enabled = true },
        },
    },
}
