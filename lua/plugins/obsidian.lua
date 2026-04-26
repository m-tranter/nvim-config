---@diagnostic disable: undefined-global
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	{
		src = "https://github.com/obsidian-nvim/obsidian.nvim",
	},
})

require("obsidian").setup({

	legacy_commands = false, -- this will be removed in 4.0.0
	workspaces = {
		{
			name = "personal",
			path = "~/vault",
		},
	},
})
