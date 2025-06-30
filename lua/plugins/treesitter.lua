return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "javascript", "typescript", "lua", "rust", "go", "tsx", "bash", "html", "yaml", "php" },

			sync_install = false,

			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			autotag = {
				enable = true,
			},

			textObjects = {
				select = {
					enable = false,
				},
			},
		})
	end,
}
