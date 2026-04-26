---@diagnostic disable: undefined-global
vim.pack.add({ "https://github.com/mrcjkb/rustaceanvim" })
vim.g.rustaceanvim = {
	tools = {
		hover_actions = {
			auto_focus = true,
		},
	},
	server = {
		on_attach = function(client, bufnr)
			-- your standard on_attach keymaps here
			local map = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end

			-- rustaceanvim-specific extras
			map("<leader>re", function()
				vim.cmd.RustLsp("expandMacro")
			end, "Expand Macro")
			map("<leader>rr", function()
				vim.cmd.RustLsp("runnables")
			end, "Runnables")
			map("<leader>rd", function()
				vim.cmd.RustLsp("debuggables")
			end, "Debuggables")
			map("<leader>rc", function()
				vim.cmd.RustLsp("openCargo")
			end, "Open Cargo.toml")
			map("K", function()
				vim.cmd.RustLsp("hover", "actions")
			end, "Hover Actions")
		end,
		settings = {
			["rust-analyzer"] = {
				lens = {
					enable = true,
				},
				inlayHints = {
					enable = true,
				},
			},
		},
	},
}
