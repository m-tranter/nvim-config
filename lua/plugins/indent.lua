---@diagnostic disable: undefined-global
vim.pack.add({
	"https://github.com/lukas-reineke/indent-blankline.nvim",
})

require("ibl").setup({
	-- your config options here, e.g.:
	-- indent = { char = '│' },
	-- scope = { enabled = false },
})
