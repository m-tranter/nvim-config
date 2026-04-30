---@diagnostic disable: undefined-global
vim.pack.add({
	"https://github.com/olrtg/nvim-emmet",
})
vim.keymap.set({ "n", "v" }, ",,", function()
	require("nvim-emmet").wrap_with_abbreviation()
end)
