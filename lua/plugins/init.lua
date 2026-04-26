---@diagnostic disable: undefined-global
require("plugins.blink")
require("plugins.codecompanion")
require("plugins.conform")
require("plugins.git")
require("plugins.indent")
require("plugins.lint")
require("plugins.mason")
require("plugins.mcphub")
require("plugins.mini")
require("plugins.mini")
require("plugins.neo-tree")
require("plugins.obsidian")
require("plugins.racket")
require("plugins.telescope")
require("plugins.theme")
require("plugins.treesitter")

vim.pack.add({
	"https://github.com/folke/ts-comments.nvim",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/nvchad/nvim-colorizer.lua",
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/olrtg/nvim-emmet",
})

require("colorizer").setup()
require("fidget").setup()
require("nvim-ts-autotag").setup()
require("ts-comments").setup()

vim.keymap.set({ "n", "v" }, ",,", require("nvim-emmet").wrap_with_abbreviation)

-- "https://github.com/mrcjkb/rustaceanvim",
