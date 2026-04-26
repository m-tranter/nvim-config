vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config") -- Load configs first
require("plugins") -- Then load plugins
require("config.options")
require("config.keymaps")
require("config.diagnostics")
require("config.autocmds")
