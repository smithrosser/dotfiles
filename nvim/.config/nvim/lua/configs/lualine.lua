return function()
    local lualine = require("lualine")
    local recorder = require("recorder")

    require("cyberdream").setup({ variant = "light" })
    lualine.setup({
        options = {
            theme = "cyberdream",
        },
        sections = {
            lualine_a = {
                {
                    "mode",
                    fmt = function(str)
                        -- Custom mapping for abbreviations
                        local mode_map = {
                            ["NORMAL"] = "N",
                            ["INSERT"] = "I",
                            ["VISUAL"] = "V",
                            ["V-LINE"] = "V-L",
                            ["V-BLOCK"] = "V-B",
                            ["SELECT"] = "S",
                            ["S-LINE"] = "S-L",
                            ["S-BLOCK"] = "S-B",
                            ["REPLACE"] = "R",
                            ["COMMAND"] = "C",
                            ["TERMINAL"] = "T",
                        }
                        return mode_map[str] or str
                    end,
                },
            },
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
