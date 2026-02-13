return function()
    local lualine = require("lualine")

    -- Add event handler to refresh lualine if recording starts/finishes
    local function refresh()
        lualine.refresh({ place = { "statusline" } })
    end
    vim.api.nvim_create_autocmd("RecordingEnter", { callback = refresh })
    vim.api.nvim_create_autocmd("RecordingLeave", { callback = refresh })

    require("lualine").setup({
        sections = {
            -- Add navic context to statusline
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
            lualine_z = { "filename" },
            lualine_y = { "lsp_status" },
            lualine_x = {
                {
                    -- show register in lualine
                    function()
                        local recording_register = vim.fn.reg_recording()
                        local recorded_register = vim.fn.reg_recorded()

                        if recording_register ~= "" then
                            return "recording @" .. recording_register
                        elseif recorded_register ~= "" then
                            return "recorded @" .. recorded_register
                        end
                        return ""
                    end,
                },
            },
        },
    })
end
