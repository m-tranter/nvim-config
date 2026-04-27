---@diagnostic disable: undefined-global
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/Olical/conjure",
})

-- Only use Racket backend, skip the others
vim.g["conjure#filetype#python"] = false
vim.g["conjure#filetype#lua"] = false
vim.g["conjure#filetype#clojure"] = false
vim.g["conjure#filetype#fennel"] = false
vim.g["conjure#filetype#janet"] = false
vim.g["conjure#filetype#hy"] = false
vim.g["conjure#filetype#javascript"] = false
vim.g["conjure#filetype#rust"] = false

-- Racket client config
vim.g["conjure#client#racket#stdio#command"] = "racket"
vim.g["conjure#client#racket#stdio#prompt_pattern"] = "> $"

-- Log buffer behaviour
vim.g["conjure#log#hud#enabled"] = true
vim.g["conjure#log#hud#anchor"] = "SE"
vim.g["conjure#log#hud#max_height"] = 0.4
vim.g["conjure#log#wrap"] = true
vim.api.nvim_set_hl(0, "ConjureHUDNormal", { link = "Normal" })
