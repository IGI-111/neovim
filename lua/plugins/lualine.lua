local lsp_progress = {
	"lsp_progress",
	colors = {
		--[[ percentage = colors.cyan,
		title = colors.cyan,
		message = colors.cyan,
		spinner = colors.cyan,
		lsp_client_name = colors.magenta, ]]
		use = false,
	},
	separators = {
		component = " ",
		progress = " | ",
		message = { pre = "(", post = ")" },
		percentage = { pre = "", post = "%% " },
		title = { pre = "", post = ": " },
		lsp_client_name = { pre = "", post = "" },
		spinner = { pre = "", post = "" },
		message = { commenced = "In Progress", completed = "Completed" },
	},
	display_components = { "lsp_client_name", "spinner" },
	timer = { progress_enddelay = 100, spinner = 100, lsp_client_name_enddelay = 100 },
	spinner_symbols = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
}

require("lualine").setup({
	options = {
		theme = "palenight",
		section_separators = { nil, nil },
		component_separators = { nil, nil },
		icons_enabled = false,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "filename", lsp_progress },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = {
			{
				"diagnostics",
				sources = {
					"nvim_lsp",
					"nvim_diagnostic",
					"nvim_workspace_diagnostic",
					"coc",
					"ale",
				},
			},
			"progress",
		},
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {
			{ "diagnostics", sources = { "nvim_diagnostic", "coc", "ale" } },
		},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
})
