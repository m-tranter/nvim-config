---@diagnostic disable: undefined-global
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/ravitemer/mcphub.nvim",
})
local mcp_hub_cmd = vim.fn.exepath("mcp-hub")
if mcp_hub_cmd == "" then
	vim.notify("mcphub: mcp-hub not found in PATH", vim.log.levels.ERROR)
	return
end

require("mcphub").setup({
	config = vim.fn.expand("~/.config/mcphub/servers.json"),
	cmd = mcp_hub_cmd,
	builtin_tools = {
		edit_file = {
			parser = {
				track_issues = true,
				extract_inline_content = true,
			},
			locator = {
				fuzzy_threshold = 0.8,
				enable_fuzzy_matching = true,
			},
			ui = {
				go_to_origin_on_complete = true,
				keybindings = {
					accept = ".",
					reject = ",",
					next = "n",
					prev = "p",
					accept_all = "ga",
					reject_all = "gr",
				},
			},
			feedback = {
				include_parser_feedback = true,
				include_locator_feedback = true,
				include_ui_summary = true,
				ui = {
					include_session_summary = true,
					include_final_diff = true,
					send_diagnostics = true,
					wait_for_diagnostics = 500,
					diagnostic_severity = vim.diagnostic.severity.WARN,
				},
			},
		},
	},
	workspace = {
		enabled = true,
		look_for = { ".mcphub/servers.json" },
		reload_on_dir_changed = true,
	},
	global_env = {
		"TAVILY_API_KEY",
		"GITHUB_PERSONAL_ACCESS_TOKEN",
	},
	auto_approve = function(params)
		return vim.g.codecompanion_auto_tool_mode == true
	end,
})
