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
            { "hrsh7th/nvim-cmp", opts = {} }, -- Need to provide nvim-cmp for theme fallback
        },
        opts = {
            sources = {
                default = { "lsp", "path", "snippets" },
            },
            keymap = {
                -- Try and learn the default completion keymaps for now
                -- (:h ins-completion)
                preset = "default",
            },
            appearance = {
                nerd_font_variant = "mono",
                use_nvim_cmp_as_default = true,
            },
            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                },
            },
            snippets = {
                preset = "luasnip",
            },
            fuzzy = {
                implementation = "lua",
            },
            signature = {
                enabled = true,
            },
        },
    },
}
