vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

--clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

--delete single character without copying into register
keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>sv", "<C-w>v") --vertical split
keymap.set("n", "<leader>sh", "<C-w>s") --horizontal split
keymap.set("n", "<leader>sx", ":close<CR>") --close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") --new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") --close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --prev tab

-- keymap.set("n", "<leader>to", ":tabnew<CR>") --new tab
-- keymap.set("n", "<leader>tx", "<Cmd>BufferClose<CR>", opts) --close current tab
-- keymap.set("n", "<leader>tn", "<Cmd>BufferNext<CR>", opts) --next tab
-- keymap.set("n", "<leader>tp", "<Cmd>BufferPrevious<CR>", opts) --prev tab
-- keymap.set("n", "<leader>tmp", "<Cmd>BufferMovePrevious<CR>", opts)
-- keymap.set("n", "<leader>tmn", "<Cmd>BufferMoveNext<CR>", opts)

--plugins keymaps
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>tf", ":NvimTreeFocus<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- language server
keymap.set("n", "<leader>vh", "<cmd>lua vim.lsp.buf.hover()<cr>")

