return function()
    local lualine = require("lualine")

    -- Add event handler to refresh lualine if recording starts/finishes
    local function refresh()
        lualine.refresh({ place = { "statusline" } })
    end
    vim.api.nvim_create_autocmd("RecordingEnter", { callback = refresh })
    vim.api.nvim_create_autocmd("RecordingLeave", { callback = refresh })

    require("lualine").setup({
        options = {
            component_separators = "",
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_c = {
                {
                    function()
                        return require("nvim-navic").get_location()
                    end,
                    cond = function()
                        return require("nvim-navic").is_available()
                    end,
                },
            },
            lualine_x = {
                { "filetype", separator = "/", padding = { left = 0, right = 1 } },
                { "lsp_status" },
            },
            lualine_y = {
                { "progress", separator = " ", padding = { left = 1, right = 0 } },
                { "location", padding = { left = 0, right = 1 } },
            },
            lualine_z = {
                "filename",
            },
        },
    })
end
