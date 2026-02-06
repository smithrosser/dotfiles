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
    },
}
