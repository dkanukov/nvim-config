return {
	"sainnhe/gruvbox-material",
	config = function()
		vim.g.gruvbox_material_foreground = "material"

		--background option can be hard, medium, soft
		vim.g.gruvbox_material_background = "hard"

		vim.g.gruvbox_material_better_performance = 1

		-- 0, 1, 2
		vim.g.gruvbox_material_transparent_background = 1

		vim.cmd([[colorscheme gruvbox-material]])
	end,
}

-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		require("rose-pine").setup({
-- 			variant = "main",
-- 			styles = {
-- 				bold = true,
-- 				italic = true,
-- 				transparency = true,
-- 			},
-- 		})
--
-- 		vim.cmd("colorscheme rose-pine")
-- 	end,
-- }
