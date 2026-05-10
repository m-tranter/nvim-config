---@diagnostic disable: undefined-global
require("plugins.blink")
-- require("plugins.codecompanion")
require("plugins.conform")
require("plugins.conjure")
require("plugins.emmet")
require("plugins.git")
require("plugins.indent")
require("plugins.lint")
require("plugins.mason")
-- require("plugins.mcphub")
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
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/nvchad/nvim-colorizer.lua",
	-- "https://github.com/seblyng/roslyn.nvim",
	"https://github.com/tpope/vim-fugitive", -- no setup needed
	"https://github.com/windwp/nvim-ts-autotag",
})

require("colorizer").setup()
require("fidget").setup()
require("nvim-ts-autotag").setup()
require("ts-comments").setup()
-- require("roslyn").setup()
