---@diagnostic disable: undefined-global
vim.pack.add({
	"https://github.com/mfussenegger/nvim-lint",
})

local lint = require("lint")

lint.linters_by_ft = {
	html = { "htmlhint" },
	css = { "stylelint" },
	markdown = { "markdownlint" },
}
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		if vim.bo.modifiable and vim.bo.filetype ~= "codecompanion" then
			lint.try_lint()
		end
	end,
})
