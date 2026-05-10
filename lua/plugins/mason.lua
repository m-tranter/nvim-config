---@diagnostic disable: undefined-global
vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/saghen/blink.cmp",
})

require("mason").setup({
	registries = {
		"github:mason-org/mason-registry",
		"github:Crashdummyy/mason-registry",
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
		map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
		map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
		map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
		map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
		map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")
		map("K", vim.lsp.buf.hover, "Hover documentation")

		---@param client vim.lsp.Client
		---@param method vim.lsp.protocol.Method
		---@param bufnr? integer
		---@return boolean
		local function client_supports_method(client, method, bufnr)
			return client:supports_method(method, bufnr)
		end

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if
			client
			and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
		then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})
			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end

		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "[T]oggle Inlay [H]ints")
		end
	end,
})

local capabilities = require("blink.cmp").get_lsp_capabilities()
local mason_path = vim.fn.stdpath("data") .. "/mason"

-- Set capabilities globally (replaces the tbl_deep_extend in the old handler)
vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.lsp.config("biome", {
	filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
	root_markers = { "biome.json", "biome.jsonc", "package.json" },
})

vim.lsp.config("bashls", {
	settings = {
		bashIde = {
			shellcheckArguments = { "--shell=bash", "--exclude=SC1090,SC1091" },
		},
	},
})

vim.lsp.config("jsonls", {
	filetypes = { "json", "jsonc" },
	settings = {
		json = { validate = { enable = true } },
	},
})

vim.lsp.config("html", {
	filetypes = { "html", "razor", "cshtml" },
})

vim.lsp.config("cssls", {
	filetypes = { "css" },
})

vim.lsp.config("tailwindcss", {
	root_markers = { "Dioxus.toml", "postcss.config.js", "postcss.config.ts" },
	filetypes = {
		"html",
		"css",
		"javascript",
		"typescript",
		"rust",
		"javascriptreact",
		"typescriptreact",
	},
	settings = {
		tailwindCSS = {
			includeLanguages = {
				rust = "html", -- treat rust like html for completions
			},
			experimental = {
				classRegex = {
					'class\\s*:\\s*"([^"]*)"',
				},
			},
		},
	},
})

vim.lsp.config("emmet_language_server", {
	filetypes = { "csv", "razor", "html", "css", "vue", "javascriptreact", "typescriptreact" },
	init_options = {
		variables = { lang = "en" },
		html = {
			snippets = {
				["html:5"] = "<!DOCTYPE html>\n"
					.. '<html lang="${lang}">\n'
					.. "<head>\n"
					.. '\t<meta charset="${charset}"/>\n'
					.. '\t<meta name="viewport" content="width=device-width, initial-scale=1.0"/>\n'
					.. "\t<title>Change me</title>\n"
					.. "</head>\n"
					.. "<body>\n\t${child}|\n</body>\n"
					.. "</html>",
			},
		},
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			completion = { callSnippet = "Replace" },
			diagnostics = { disable = { "missing-fields" } },
		},
	},
})

vim.lsp.config("vue_ls", {
	filetypes = { "vue" },
	init_options = {
		typescript = {
			tsdk = (function()
				local project_ts = vim.fn.getcwd() .. "/node_modules/typescript/lib"
				if vim.fn.isdirectory(project_ts) == 1 then
					return project_ts
				end
				return mason_path .. "/packages/vtsls/node_modules/@vtsls/language-server/node_modules/typescript/lib"
			end)(),
		},
	},
})

vim.lsp.config("vtsls", {
	filetypes = { "vue", "typescript", "javascript", "typescriptreact", "javascriptreact" },
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					{
						name = "@vue/typescript-plugin",
						location = mason_path .. "/packages/vue-language-server/node_modules/@vue/language-server",
						languages = { "vue" },
						configNamespace = "typescript",
						enableForWorkspaceTypeScriptVersions = true,
					},
				},
			},
		},
	},
})

vim.lsp.config("roslyn", {
	on_attach = function()
		print("This will run when the server attaches!")
	end,
	settings = {
		["csharp|inlay_hints"] = {
			csharp_enable_inlay_hints_for_implicit_object_creation = true,
			csharp_enable_inlay_hints_for_implicit_variable_types = true,
		},
		["csharp|code_lens"] = {
			dotnet_enable_references_code_lens = true,
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {},
	automatic_installation = false,
	automatic_enable = true,
})
