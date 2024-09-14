local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
	vim.keymap.set("n", "<leader>vh", "<cmd>lua vim.lsp.buf.hover()<cr>")
	vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>")
	vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
	vim.keymap.set("n", "<leader>df", "<cmd>lua vim.diagnostic.open_float()<cr>")
end)

local cmp = require("cmp")
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-a>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp.mapping.select_next_item(),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"vtsls",
		"volar",
		"cssls",
		"css_variables",
		"cssmodules_ls",
		"eslint",
		"stylelint_lsp",
		"gopls",
		"lua_ls",
		"rust_analyzer",
		"bashls",
		"typos_lsp",
	},
	handlers = {
		function(server_name)
			local lspconfig = require("lspconfig")
			if server_name == "rust_analyzer" then
				lspconfig[server_name].setup({
					filetypes = { "rust" },
					settings = {
						["rust-analyzer"] = {
							imports = {
								granularity = {
									group = "module",
								},
								prefix = "self",
							},
							cargo = {
								buildScripts = {
									enable = true,
								},
								allFeatures = {
									allFeatures = true,
								},
							},
							procMacro = {
								enable = true,
							},
						},
					},
				})
			elseif server_name == "eslint" then
				lspconfig[server_name].setup({
					on_attach = function(_, buffer)
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = buffer,
							command = "EslintFixAll",
						})
					end,
				})
			else
				lspconfig[server_name].setup({})
			end
		end,
	},
})

local mason_null_ls = require("mason-null-ls")
local null_ls = require("null-ls")

mason_null_ls.setup({
	PATH = "prepend",
	error = {
		"eslint_d",
		"prettierd",
		"stylua",
	},
})

local formatting = null_ls.builtins.formatting   -- formatters
local diagnostics = null_ls.builtins.diagnostics -- linters

null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.prettierd,
		diagnostics.stylelint,
		require("none-ls.diagnostics.eslint_d"),
		require("none-ls.formatting.eslint_d"),
		require("none-ls.code_actions.eslint_d"),
		require("none-ls-shellcheck.diagnostics"),
		require("none-ls-shellcheck.code_actions"),
	},

	on_attach = function()
		vim.keymap.set("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format()<cr>")
	end,
})
