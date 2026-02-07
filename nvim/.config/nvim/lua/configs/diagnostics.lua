return function()
    vim.diagnostic.config({
        severity_sort = true,
        update_in_insert = true,
        underline = true,
        float = { border = "rounded", source = "if_many" },
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = " ",
                [vim.diagnostic.severity.WARN] = " ",
                [vim.diagnostic.severity.INFO] = " ",
                [vim.diagnostic.severity.HINT] = " ",
            },
        },
        virtual_text = {
            source = false,
            prefix = "",
            spacing = 1,
        },
    })
end
