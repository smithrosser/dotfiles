return function()
    local lualine = require("lualine")
    local recorder = require("recorder")

    lualine.setup({
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
                {
                    recorder.recordingStatus,
                    color = { fg = "Character", gui = "bold" },
                },
            },
            lualine_y = {
                { "filetype", separator = "/", padding = { left = 1, right = 1 } },
                { "lsp_status" },
            },
            lualine_z = {
                "filename",
            },
        },
    })
end
