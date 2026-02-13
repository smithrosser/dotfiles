local formatters_by_ft = {
    lua = { "stylua" },
    bash = { "beautysh" },
    zsh = { "beautysh" },
    sh = { "beautysh" },
    python = { "black" },

    c = {},
    cpp = {},
    brightscript = {},
}
local lsp_fallback_exclusions = {
    "brightscript",
    "cpp",
}

return {
    notify_on_error = true,
    format_on_save = function(bufnr)
        local use_fallback = not vim.tbl_contains(lsp_fallback_exclusions, vim.bo[bufnr].filetype)
        return {
            timeout_ms = 500,
            lsp_fallback = use_fallback,
        }
    end,
    formatters_by_ft = formatters_by_ft,
}
