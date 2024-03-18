-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim")
	use("christoomey/vim-tmux-navigator")

	use("szw/vim-maximizer")

	-- essential plugins
	use("tpope/vim-surround")
	use("inkarkat/vim-ReplaceWithRegister")

	use("numToStr/Comment.nvim")

	use("nvim-tree/nvim-tree.lua")

	use("nvim-tree/nvim-web-devicons")

	use("nvim-lualine/lualine.nvim")

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({
		"nvimdev/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")

	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use("windwp/nvim-autopairs")
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	use("lewis6991/gitsigns.nvim")

	use("lukas-reineke/indent-blankline.nvim")

	use({
		"rust-lang/rust.vim",
		run = function()
			vim.opt.g.rustfmt_autosave = 1
		end,
	})

	use({
		"simrat39/rust-tools.nvim",
	})

	use({ "sainnhe/gruvbox-material" })
	use({ "folke/tokyonight.nvim" })

	use 'mfussenegger/nvim-dap'

	use ({
		"olexsmir/gopher.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	})

	use({ "folke/todo-comments.nvim" })

	use { "catppuccin/nvim", as = "catppuccin" }

	if packer_bootstrap then
		require("packer").sync()
	end
end)
