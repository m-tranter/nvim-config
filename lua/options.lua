---@diagnostic disable: undefined-global

vim.fs.root(0, { '.git', 'package.json', '*.sln' })
vim.opt.clipboard = 'unnamedplus'
vim.g.have_nerd_font = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.opt.breakindent = true
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'split'
vim.opt.list = true
vim.opt.number = true
vim.opt.scrolloff = 10
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.colorcolumn = '80'
vim.opt.expandtab = true
vim.opt.gdefault = true
vim.opt.hlsearch = true
vim.opt.laststatus = 3
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.mouse = ''
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.shortmess:append 'I'
vim.opt.softtabstop = 2
vim.opt.spelllang = 'en_gb'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.undodir = os.getenv 'HOME' .. '/.local/state/nvim/undo'
vim.opt.updatetime = 50
vim.opt.wrap = true
