vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("christoomey/vim-tmux-navigator")

	use("tpope/vim-surround")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("folke/todo-comments.nvim")
	use("lewis6991/gitsigns.nvim")

	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"rose-pine/neovim",
		as = "rose-pine",
	})

	use({
		"sainnhe/gruvbox-material",
		as = "gruvbox",
	})

	use({"nvim-lualine/lualine.nvim", requires = { 'nvim-tree/nvim-web-devicons', opt = true }})

	use({ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } })
	use("nvim-treesitter/playground")
	use("windwp/nvim-ts-autotag")

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")

	use("nvimtools/none-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
	use("nvimtools/none-ls-extras.nvim")
	use("gbprod/none-ls-shellcheck.nvim")

	use("folke/zen-mode.nvim")
end)
