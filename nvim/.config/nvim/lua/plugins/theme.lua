local themes = {
    -- Themes should be able to change based on vim.o.background
    kanagawa = {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                background = { dark = "wave", light = "lotus" },
                colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
            })
            vim.cmd.colorscheme("kanagawa")
        end,
    },
    onenord = {
        "rmehri01/onenord.nvim",
        priority = 1000,
        config = function()
            require("onenord").setup({})
            vim.cmd.colorscheme("onenord")
        end,
    },
    default = {},
}
local selected = "onenord"

-- vim.api.nvim_create_autocmd({ "ColorScheme", "FocusGained" }, {
--     desc = "Sync terminal background with Neovim",
--     callback = function()
--         local bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
--         if bg then
--             local hex = string.format("#%06x", bg)
--             -- Standard OSC 11 sequence
--             local osc = string.format("\27]11;%s\7", hex)
--
--             -- Wrap for tmux passthrough if needed
--             if os.getenv("TMUX") then
--                 osc = string.format("\27Ptmux;\27%s\27\\", osc)
--             end
--
--             io.stdout:write(osc)
--         end
--     end,
-- })

return {
    { "typicode/bg.nvim", lazy = false },
    themes[selected],
}
