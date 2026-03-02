---@diagnostic disable: undefined-global

-- vim.g.gruvbox_contrast_dark = 'hard'
vim.o.clipboard = 'unnamedplus'
vim.g.have_nerd_font = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.user_emmet_leader_key = ','
vim.o.breakindent = true
vim.o.confirm = true
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.inccommand = 'split'
vim.o.list = true
vim.o.number = true
vim.o.scrolloff = 10
vim.o.showmode = false
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.opt.backup = false
vim.opt.colorcolumn = '80'
vim.opt.expandtab = true
vim.opt.gdefault = true
vim.opt.hlsearch = true
vim.opt.laststatus = 3
vim.opt.lazyredraw = true
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
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.updatetime = 50
vim.opt.wrap = true
