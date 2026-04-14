return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "Work",
                path = "~/ws/obsidian/Work",
            },
        },
        completion = {
            nvim_cmp = true, -- This makes it compatible with nvim-cmp/blink sources
            min_chars = 2,
        },
    },
    daily_notes = {
        folder = "journal", -- relative to workspace root
        date_format = "%Y-%m-%d",
        alias_format = "%-d %B %Y",
    },
}
