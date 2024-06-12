local telescope_setup, telescope = pcall(require, "telescope")
local actions_setup, actions = pcall(require, "telescope.actions")

telescope.setup({
	defaults = {
		layout_strategy = 'vertical',
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
	},
})
