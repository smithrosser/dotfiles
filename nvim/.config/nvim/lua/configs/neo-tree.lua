return {
    sources = { "filesystem" },
    source_selector = { winbar = false },
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            follow_current_file = {
                enabled = true,
                leave_dirs_open = false,
            },
        },
        window = {
            mappings = { ["\\"] = "close_window" },
            position = "float",
            width = 40,
            height = 30,
            popup = {
                size = {
                    height = "80%",
                    width = "80%",
                },
                border = {
                    style = "rounded",
                    highlight = "Normal",
                    text = { top_align = "center" },
                },
                win_options = {
                    winhighlight = "Normal:Normal,FloatBorder:Normal",
                },
            },
        },
        sort_function = function(a, b)
            -- Directories always come first
            if a.type ~= b.type then
                return a.type < b.type -- "directory" < "file"
            end
            -- For files, sort by extension first, then by name
            if a.type == "file" then
                local ext_a = a.name:match("%.([^%.]+)$") or ""
                local ext_b = b.name:match("%.([^%.]+)$") or ""
                if ext_a ~= ext_b then
                    return ext_a < ext_b
                end
            end
            return a.name < b.name
        end,
    },
}
