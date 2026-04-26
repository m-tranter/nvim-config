---@diagnostic disable: undefined-global
local opt = vim.opt
vim.fs.root(0, { ".git", "package.json", "*.sln" })
vim.g.have_nerd_font = true
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
opt.autochdir = false -- Don't auto change directory
opt.autoindent = true -- Copy indent from current line
opt.autoread = true -- Auto reload files changed outside vim
opt.autowrite = true -- Auto save
opt.backspace = "indent,eol,start" -- Better backspace behavior
opt.backup = false -- Don't create backup files

opt.gdefault = true
opt.breakindent = true
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.cmdheight = 1 -- Command line height
opt.colorcolumn = "80"
opt.completeopt = "menu,menuone,noselect"
opt.concealcursor = "" -- Don't hide cursor line markup
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Highlight current line
opt.diffopt:append("linematch:60")
opt.encoding = "UTF-8" -- Set encoding
opt.errorbells = false -- No error bells
opt.expandtab = true -- Use spaces instead of tabs
opt.foldlevel = 99 -- Start with all folds open
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.hidden = true -- Allow hidden buffers
opt.hlsearch = true -- Don't highlight search results
opt.ignorecase = true -- Case insensitive search
opt.incsearch = true -- Show matches as you type

opt.inccommand = "split"
opt.iskeyword:append("-") -- Treat dash as part of word
opt.jumpoptions = "view"
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.list = false
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.matchtime = 2 -- How long to show matching bracket
opt.maxmempattern = 20000
opt.modifiable = true -- Allow buffer modifications
opt.mouse = "" -- Enable mouse support
opt.number = true -- Line numbers
opt.path:append("**") -- include subdirectories in search
opt.pumblend = 10 -- Popup menu transparency
opt.pumheight = 10 -- Popup menu height
opt.redrawtime = 10000
opt.relativenumber = true -- Relative line numbers
opt.ruler = false -- Disable the default ruler
opt.scrolloff = 10 -- Keep 10 lines above/below cursor
opt.selection = "exclusive" -- Selection behavior
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Indent width
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmatch = true -- Highlight matching brackets
opt.showmode = false -- Don't show mode in command line
opt.signcolumn = "yes" -- Always show sign column
opt.smartcase = true -- Case sensitive if uppercase in search
opt.smartindent = true -- Smart auto-indenting
opt.smoothscroll = true
opt.softtabstop = 2 -- Soft tab stop
opt.spelllang = "en_gb"
opt.splitbelow = true -- Horizontal splits go below
opt.splitkeep = "screen"
opt.splitright = true -- Vertical splits go right
opt.swapfile = false -- Don't create swap files
opt.synmaxcol = 300 -- Syntax highlighting limit
opt.tabstop = 2 -- Tab width
opt.termguicolors = true -- Enable 24-bit colors
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.ttimeoutlen = 0 -- Key code timeout
opt.undodir = vim.fn.expand("~/.local/state/nvim/undo") -- Undo directory
opt.undofile = true -- Persistent undo
opt.undolevels = 10000
opt.updatetime = 300 -- Faster completion
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.winblend = 0 -- Floating window transparency
opt.winminwidth = 5 -- Minimum window width
opt.wrap = true
opt.writebackup = false -- Don't create backup before writing
vim.g.autoformat = true
vim.g.markdown_recommended_style = 0
vim.g.trouble_lualine = true
vim.wo.foldmethod = "expr"

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
