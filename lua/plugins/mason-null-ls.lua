-- local mason_null_ls = require("mason-null-ls")
-- local null_ls = require("null-ls")

-- mason_null_ls.setup({
-- 	PATH = "prepend",
-- 	error = {
-- 		"eslint_d",
-- 		"prettierd",
-- 		"stylua",
-- 	},
-- })

-- local formatting = null_ls.builtins.formatting   -- formatters
-- local diagnostics = null_ls.builtins.diagnostics -- linters

-- null_ls.setup({
-- 	sources = {
-- 		formatting.stylua,
-- 		formatting.prettierd,
-- 		diagnostics.stylelint,
-- 		require("none-ls.diagnostics.eslint_d"),
-- 		require("none-ls.formatting.eslint_d"),
-- 		require("none-ls.code_actions.eslint_d"),
-- 		require("none-ls-shellcheck.diagnostics"),
-- 		require("none-ls-shellcheck.code_actions"),
-- 	},

-- 	on_attach = function()
-- 		vim.keymap.set("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format()<cr>")
-- 	end,
-- })

return {}
