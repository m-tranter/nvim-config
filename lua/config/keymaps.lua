---@diagnostic disable: undefined-global
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local function navigate(dir)
	local winnr = vim.fn.winnr()
	vim.cmd("wincmd " .. dir)
	-- if winnr didn't change, we're at the edge — hand off to Sway
	if winnr == vim.fn.winnr() then
		local sway_dir = { h = "left", j = "down", k = "up", l = "right" }
		vim.fn.jobstart("swaymsg focus " .. sway_dir[dir])
	end
end

map("n", "<C-h>", function()
	navigate("h")
end)
map("n", "<C-j>", function()
	navigate("j")
end)
map("n", "<C-k>", function()
	navigate("k")
end)
map("n", "<C-l>", function()
	navigate("l")
end)

map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<C-S-Up>", "<cmd>resize +5<CR>", opts)
map("n", "<C-S-Down>", "<cmd>resize -5<CR>", opts)
map("n", "<C-S-Left>", "<cmd>vertical resize -5<CR>", opts)
map("n", "<C-S-Right>", "<cmd>vertical resize +5<CR>", opts)
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map("n", "<Leader>P", '"_diwP', opts)
map("x", "<Leader>p", '"_dp')
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- map('n', '<Leader>n', '<Cmd>Neotree toggle<CR>')
-- Better J behavior
map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

map("n", "<leader>xl", function()
	local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
	if not success and err then
		vim.notify(err, vim.log.levels.ERROR)
	end
end, { desc = "Location List" })

map("n", "<leader>xq", function()
	local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
	if not success and err then
		vim.notify(err, vim.log.levels.ERROR)
	end
end, { desc = "Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })
map("n", "z0", "1z=", { desc = "Fix word under cursor" })
map("n", "<leader>pu", "<cmd>lua vim.pack.update()<CR>")
map("", "<up>", "<nop>", { noremap = true })
map("", "<down>", "<nop>", { noremap = true })
map("i", "<up>", "<nop>", { noremap = true })
map("i", "<down>", "<nop>", { noremap = true })
map("n", "<C-down>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<C-up>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("n", "<Leader>w", "<C-w>v", { desc = "Vertical split" })
map("n", "<C-d>", "<C-d>zz", { desc = "move down and recenter" })
map("n", "<C-u>", "<C-u>zz", { desc = "move up and recenter" })
map("n", "N", "Nzzzv", { desc = "Prev search item and recenter" })
map("n", "n", "nzzzv", { desc = "Next search item and recenter" })
map({ "n", "v", "o" }, "Q", "<Nop>", { desc = "Disable Q" })
map("n", "<Leader>a", "ggVG", { desc = "Select entire buffer" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

map("c", "w", function()
	if vim.bo.filetype == "neo-tree" then
		return "<C-c><cmd>Neotree close<cr>"
	end
	return "w"
end, { expr = true })
