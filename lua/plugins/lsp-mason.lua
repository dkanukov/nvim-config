return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
		"VonHeikemen/lsp-zero.nvim",
	},

	config = function()
		require("mason").setup()
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
					local capabilities = require("cmp_nvim_lsp").default_capabilities()
					if server_name == "rust_analyzer" then
						lspconfig[server_name].setup({
							capabilities = capabilities,
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
							capabilities = capabilities,
							on_attach = function(_, buffer)
								vim.api.nvim_create_autocmd("BufWritePre", {
									buffer = buffer,
									command = "EslintFixAll",
								})
							end,
						})
					else
						lspconfig[server_name].setup({
							capabilities = capabilities,
						})
					end
				end,
			},
		})

		local lsp_zero = require("lsp-zero")
		lsp_zero.on_attach(function(_, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
			vim.keymap.set("n", "<leader>vh", "<cmd>lua vim.lsp.buf.hover()<cr>")
			vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>")
			vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
			vim.keymap.set("n", "<leader>df", "<cmd>lua vim.diagnostic.open_float()<cr>")
		end)
	end,
}
