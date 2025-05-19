return {
	{
		"decaycs/decay.nvim",
		name = "decay",
		config = function()
			local decay = require("decay")
			local core = require("decay.core")
			local colors = core.get_colors("decayce")
			decay.setup({
				style = "dark",
				italics = {
					code = true,
					comments = true,
				},
				palette_overrides = {
					background = colors.background,
					statusline_bg = colors.statusline_bg,
				},
			})
			vim.cmd("colorscheme decay-dark")
		end,
	},
}
