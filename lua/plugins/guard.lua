return {
	"nvimdev/guard.nvim",
	-- lazy load by ft
	ft = { "lua", "c", "markdown" },
	-- Builtin configuration, optional
	dependencies = {
		"nvimdev/guard-collection",
	},

	config = function()
		local ft = require("guard.filetype")

		ft("lua"):fmt("lsp"):append("stylua"):lint("luacheck")
		ft("typescript,javascript,typescriptreact,css"):fmt("lsp"):append("prettierd"):lint("eslint_d")
		-- ft("css"):fmt("lsp"):append("eslint_d"):lint("prettierd")
	end,
}
