return {
	"nvimdev/guard.nvim",
	ft = { "lua", "c", "markdown" },
	dependencies = {
		"nvimdev/guard-collection",
	},

	config = function()
		local ft = require("guard.filetype")

		ft("lua"):fmt("lsp"):append("stylua"):lint("luacheck")
		ft("typescript,javascript,typescriptreact,css"):fmt("lsp"):append("prettierd"):lint("eslint_d")
		ft("*"):lint("codespell")
	end,
}
