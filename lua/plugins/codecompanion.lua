---@diagnostic disable: undefined-global
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/ravitemer/mcphub.nvim",
	"https://github.com/olimorris/codecompanion.nvim",
})

vim.keymap.set({ "n", "v" }, "<Leader>ci", "<cmd>CodeCompanion<cr>", { desc = "Inline code companion" })
vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { desc = "CC actions" })
vim.keymap.set({ "n", "v" }, "<Leader>i", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "CC chat" })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { desc = "Send selection to CC" })

require("codecompanion").setup({
	prompt_library = {
		markdown = {
			dirs = {
				"~/.config/codecompanion",
				vim.fn.getcwd(),
			},
		},
	},
	extensions = {
		mcphub = {
			callback = "mcphub.extensions.codecompanion",
			opts = {
				make_tools = true,
				show_server_tools_in_chat = true,
				add_mcp_prefix_to_tool_names = false,
				show_result_in_chat = false,
				make_vars = true,
				make_slash_commands = true,
			},
		},
	},
	adapters = {
		acp = {
			opts = { show_presets = false },
		},
		http = {
			opts = { show_presets = false },
			anthropic = function()
				return require("codecompanion.adapters").extend("anthropic", {
					name = "sonnet4-6",
					env = { api_key = "ANTHROPIC_API_KEY" },
					schema = {
						model = { default = "claude-sonnet-4-6" },
						max_tokens = { default = 20480 },
						temperature = { default = 0.4 },
					},
				})
			end,
			ollama = function()
				return require("codecompanion.adapters").extend("ollama", {
					schema = {
						model = { default = "deepseek-coder-v2:16b" },
					},
				})
			end,
			openrouter = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					name = "openrouter",
					env = {
						url = "https://openrouter.ai/api/v1",
						api_key = "OPENROUTER_API_KEY",
						chat_url = "/chat/completions",
					},
					headers = {
						["HTTP-Referer"] = "https://github.com/neovim/neovim",
						["X-Title"] = "Neovim CodeCompanion",
					},
					schema = {
						model = {
							default = "deepseek/deepseek-v3.2",
							choices = {
								"minimax/minimax-m2.7",
								"deepseek/deepseek-v3.2",
							},
						},
					},
				})
			end,
		},
	},
	handlers = {
		parse_message_meta = function(self, data)
			local extra = data.extra
			if extra and extra.reasoning then
				data.output.reasoning = { content = extra.reasoning }
				if data.output.content == "" then
					data.output.content = nil
				end
			end
			return data
		end,
	},
	strategies = {
		chat = { adapter = "openrouter", tools = {}, variables = {} },
		inline = { adapter = "openrouter", tools = {}, variables = {} },
		agent = { adapter = "openrouter", tools = {}, variables = {} },
	},
	display = {
		chat = { render_headers = false },
	},
})
