local M = {}

function M.register_filetypes()
    vim.filetype.add({
        extension = {
            brs = "brightscript",
        },
        pattern = {
            -- Match SceneGraph XML files in Roku projects
            [".*%.xml"] = {
                priority = -math.huge, -- Low priority, let other plugins detect XML first
                function(path, bufnr)
                    -- Only treat as BrightScript XML if it's in a Roku project
                    local content = vim.api.nvim_buf_get_lines(bufnr, 0, 50, false)
                    for _, line in ipairs(content) do
                        if line:match("component.*extends") or line:match("SceneGraph") then
                            return "xml" -- BrightScript SceneGraph XML
                        end
                    end
                end,
            },
        },
    })
end

return M
