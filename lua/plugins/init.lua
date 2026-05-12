---@diagnostic disable: undefined-global
require("plugins.blink")
require("plugins.conform")
require("plugins.conjure")
require("plugins.emmet")
require("plugins.indent")
require("plugins.lint")
require("plugins.markdown")
require("plugins.mason")
require("plugins.mini")
require("plugins.neo-tree")
require("plugins.obsidian")
require("plugins.racket")
require("plugins.rust")
require("plugins.telescope")
require("plugins.theme")
require("plugins.treesitter")

vim.pack.add({
	"https://github.com/folke/ts-comments.nvim",
	"https://github.com/nvchad/nvim-colorizer.lua",
	"https://github.com/windwp/nvim-ts-autotag",
})

require("colorizer").setup()
require("nvim-ts-autotag").setup()
require("ts-comments").setup()
