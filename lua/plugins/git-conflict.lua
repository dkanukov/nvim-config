return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = function()
		require("git-conflict").setup({
			default_mappings = true,
			disable_diagnostics = false,
			highlights = {
				incoming = "DiffAdd",
				current = "DiffText",
			},
			mappings = { -- Custom mappings
				ours = "co",
				theirs = "ct",
				none = "cn",
				both = "cb",
				next = "]x",
				prev = "[x",
			},
		})
	end,
}
