---@diagnostic disable: undefined-global
local opt = vim.opt
opt.autochdir = false
opt.autoindent = true
opt.autoread = true
opt.autowrite = true
opt.backup = false
opt.breakindent = true
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.cmdheight = 1
opt.colorcolumn = "80"
opt.completeopt = "menu,menuone,noselect"
opt.concealcursor = ""
opt.conceallevel = 2
opt.confirm = true
opt.cursorline = true
opt.diffopt:append("linematch:60")
opt.expandtab = true
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.formatoptions = "jcroqlnt"
opt.gdefault = false
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg"

opt.hidden = true -- Allow hidden buffers
opt.hlsearch = true
opt.ignorecase = true
opt.inccommand = "split"
opt.incsearch = true
opt.jumpoptions = "view"
opt.laststatus = 3
opt.matchtime = 2
opt.linebreak = true
opt.maxmempattern = 20000
opt.modifiable = true
opt.mouse = ""
opt.number = true
opt.path:append("**")
opt.pumblend = 10
opt.pumheight = 10
opt.redrawtime = 10000
opt.relativenumber = true
opt.ruler = false
opt.scrolloff = 10
opt.selection = "exclusive"
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmatch = true
opt.showmode = false
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.smoothscroll = true
opt.softtabstop = 2
opt.spelllang = "en_gb"
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.swapfile = false
opt.synmaxcol = 300
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 1000
opt.ttimeoutlen = 10
opt.undodir = vim.fn.expand("~/.local/state/nvim/undo")
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 300
opt.virtualedit = "block"
opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.winblend = 0
opt.winminwidth = 5
opt.wrap = true
opt.writebackup = false
vim.g.autoformat = true
vim.g.have_nerd_font = true
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.markdown_recommended_style = 0
vim.g.trouble_lualine = true
vim.filetype.add({
	extension = {
		env = "dotenv",
	},
	filename = {
		[".env"] = "dotenv",
		["env"] = "dotenv",
	},
	pattern = {
		["[jt]sconfig.*.json"] = "jsonc",
		["%.env%.[%w_.-]+"] = "dotenv",
	},
})
