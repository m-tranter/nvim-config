---@diagnostic disable: undefined-global
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/MunifTanjim/nui.nvim",
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
	},
})

require("neo-tree").setup({
	filesystem = {
		commands = {},
		window = {
			mappings = {
				["\\"] = "close_window",
			},
		},
	},
	close_if_last_window = true,
	window = {
		width = 24,
	},
})

vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<cr>", { desc = "Neotree" })
vim.keymap.set("n", "\\", ":Neotree reveal<CR>", { desc = "NeoTree reveal", silent = true })
