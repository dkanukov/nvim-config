return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function ()
		local lualine = require("lualine")

		lualine.setup({
			options = {
				component_separators = { left = '|', right = '|'},
				section_separators = { left = '', right = ''},
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {'branch', 'diff', 'diagnostics', 'filename'},
				lualine_c = {'datetime'},
				lualine_x = {'encoding', 'filetype'},
				lualine_y = {'progress'},
				lualine_z = {'location'}
			}
		})
	end
}

--[[ +-------------------------------------------------+
| A | B | C                             X | Y | Z |
+ -------------------------------------------------+]]