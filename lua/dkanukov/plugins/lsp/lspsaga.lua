-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	definition = {
		edit = "<CR>",
	},
	outline = {
		layout = "float",
		max_height = 1,
	},
	ui = {
		colors = {
			normal_bg = "#022746",
		},
	},
})
