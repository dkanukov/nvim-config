return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local _, telescope = pcall(require, "telescope")
		local _, actions = pcall(require, "telescope.actions")
	
		telescope.setup({
		  defaults = {
			layout_strategy = 'vertical',
			mappings = {
			  i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
			  },
			},
		  },
		})
	  end,
}