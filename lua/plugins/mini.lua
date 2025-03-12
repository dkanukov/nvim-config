return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.ai").setup()
		require("mini.surround").setup()
		require("mini.pairs").setup({
			mappings = {
				["<"] = { action = "open", pair = "<>", neigh_pattern = "[^\\]." },
				[">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },
			},
		})
	end,
}
