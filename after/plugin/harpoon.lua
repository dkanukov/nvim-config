local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)

vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
