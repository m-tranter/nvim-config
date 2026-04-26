---@diagnostic disable: undefined-global
vim.lsp.config["racket_langserver"] = {
	cmd = { "racket", "--lib", "racket-langserver" },
	filetypes = { "racket", "scheme" },
	root_markers = { "*.rkt", "info.rkt" },
}

vim.lsp.enable("racket_langserver")
