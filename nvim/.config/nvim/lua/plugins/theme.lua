local themes = {
	tokyonight = {
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "moon",
				day_brightness = 0.1,
			})
			vim.cmd.colorscheme("tokyonight")
		end,
	},
}

return themes["tokyonight"]
