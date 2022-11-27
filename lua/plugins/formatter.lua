vim.api.nvim_exec(
	[[
		augroup FormatAutogroup
			autocmd!
			autocmd BufWritePost *.tsx,*.ts,*.js,*.rs,*.lua,*.nix FormatWrite
		augroup END
	]],
	true
)

require("formatter").setup({
	logging = false,
	filetype = {
		javascript = {
			-- prettier
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
					stdin = true,
				}
			end,
		},
		typescript = {
			-- prettier
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
					stdin = true,
				}
			end,
		},
		typescriptreact = {
			-- prettier
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
					stdin = true,
				}
			end,
		},
		rust = {
			-- Rustfmt
			function()
				return {
					exe = "rustfmt",
					args = { "--emit=stdout", "--edition=2018" },
					stdin = true,
				}
			end,
		},
		lua = {
			-- stylua
			function()
				return {
					exe = "stylua",
					args = { "-" },
					stdin = true,
				}
			end,
		},
		nix = {
			-- luafmt
			function()
				return {
					exe = "nixfmt",
					args = {},
					stdin = false,
				}
			end,
		},
	},
})
