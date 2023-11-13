local _, catppuccin = pcall(require, "catppuccin")

-- catppuccin.setup({
-- 	transparent_background = true,
-- })
--
-- local status, _ = pcall(vim.cmd, "colorscheme catppuccin-mocha")
--
-- if not status then
-- 	print("no such colorcheme")
-- 	return

local _, gruvbox = pcall(require, "gruvbox-material")

pcall(vim.cmd, "g:gruvbox_material_background = 'soft'")
local _, _ = pcall(vim.cmd, "colorscheme gruvbox-material")
