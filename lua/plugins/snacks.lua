return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

	config = function()
		--TODO: SETUP LATER
		local snacks = require("snacks")

		snacks.setup({
			dashboard = {
				enabled = true,
			},
		})
	end,
}
