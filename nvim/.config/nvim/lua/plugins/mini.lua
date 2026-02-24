return {
    "echasnovski/mini.nvim",
    config = function()
        require("mini.ai").setup({ n_lines = 500 }) -- smarter text object selection
        require("mini.surround").setup() -- better surround () "" [] handling
    end,
}
