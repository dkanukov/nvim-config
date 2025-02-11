local keymap = vim.keymap

--Basic
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>tt", vim.cmd.Ex)

--Tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")
-- keymap.set("n", "<leader>tx", function()
-- 	require("mini.bufremove").delete(0, true)
-- end)
-- keymap.set("n", "<leader>tn", ":BufferLineCycleNext<CR>")
-- keymap.set("n", "<leader>tp", ":BufferLineCyclePrev<CR>")
-- keymap.set("n", "<leader>to", ":BufferLinePick<CR>")
-- keymap.set("n", "<leader><Left>", ":BufferLineMovePrev<CR>")
-- keymap.set("n", "<leader><Right>", ":BufferLineMoveNext<CR>")

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

--Tree
-- keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>")
