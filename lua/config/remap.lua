local keymap = vim.keymap

--Basic
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>tt", vim.cmd.Ex)
keymap.set("n", "<leader>cpf", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify("Copied to clipboard: " .. path, vim.log.levels.INFO, { title = "Path Copy" })
end)
keymap.set("n", "<leader>cp", function()
	local full_path = vim.fn.expand("%:p")
	local prefix = "/Users/dmkanukov/"
	local trimmed_path = full_path:gsub("^" .. vim.pesc(prefix), "")
	vim.fn.setreg("+", trimmed_path)
	vim.notify("Copied to clipboard: " .. trimmed_path, vim.log.levels.INFO, { title = "Path Copy" })
end)

--Tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

--Telescope
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", builtin.find_files, {})
keymap.set("n", "<leader>fs", builtin.live_grep, {})
keymap.set("n", "<leader>gs", builtin.git_status, {})

--Split
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>sx", ":close<CR>")

--Quickfix
keymap.set("n", "<leader>qc", ":cclose<CR>")

--Git
keymap.set("n", "<leader>gb", ":Gitsigns blame<CR>")
