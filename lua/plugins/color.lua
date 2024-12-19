return {
	"sainnhe/gruvbox-material",
	config = function ()
		vim.g.gruvbox_material_foreground = "material"

		--background option can be hard, medium, soft
		vim.g.gruvbox_material_background = "hard"

		vim.g.gruvbox_material_better_performance = 1

		-- 0, 1, 2
		vim.g.gruvbox_material_transparent_background = 1

		vim.cmd([[colorscheme gruvbox-material]])
	end
}