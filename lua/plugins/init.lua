return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- Git integration
	use("tpope/vim-fugitive")
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- Snippets
	use({
		"hrsh7th/vim-vsnip",
		config = function()
			require("plugins.vsnip")
		end,
	})
	use("hrsh7th/vim-vsnip-integ")
	use("stevearc/vim-vsnip-snippets")
	use("rafamadriz/friendly-snippets")

	-- Motions and general text editing
	use("godlygeek/tabular")
	use("b3nj5m1n/kommentary")
	use("tpope/vim-repeat")
	use("tpope/vim-abolish")
	use("tpope/vim-surround")
	use("wellle/targets.vim")
	use("triglav/vim-visual-increment")
	use("matze/vim-move")
	use("tpope/vim-sleuth")

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lspconfig")
		end,
	})

	-- Autocompletion
	-- use("zxqfl/tabnine-vim")
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.cmp")
		end,
	})
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-vsnip")
	-- use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

	-- Formatting
	use({
		"mhartington/formatter.nvim",
		config = function()
			require("plugins.formatter")
		end,
	})

	-- Colorschemes
	use({ "sjl/badwolf", opt = true })
	use({ "chriskempson/vim-tomorrow-theme", opt = true })
	use({ "NLKNguyen/papercolor-theme", opt = true })
	use({ "nanotech/jellybeans.vim", opt = true })
	use({ "morhetz/gruvbox", opt = true })
	use({ "blueshirts/darcula", opt = true })
	use({ "atelierbram/vim-colors_atelier-schemes", opt = true })
	use("drewtempelmeyer/palenight.vim")

	-- Syntax and language integration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	})
	use('nvim-treesitter/nvim-treesitter-textobjects')
	use({
		"p00f/nvim-ts-rainbow",
		config = function()
			require("plugins.treesitter_rainbow")
		end,
	})

	-- Interface
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"simnalamburt/vim-mundo",
		config = function()
			vim.api.nvim_set_keymap("n", "<Leader>u", ":MundoToggle<CR>", { noremap = true, silent = true })
		end,
	})
	use({
		"simrat39/symbols-outline.nvim",
		config = function()
			vim.api.nvim_set_keymap("n", "<Leader>o", ":SymbolsOutline<CR>", { noremap = true, silent = true })
		end,
	})
	use({
		"hoob3rt/lualine.nvim",
		config = function()
			require("plugins.lualine")
		end,
	})
	use("kshenoy/vim-signature")
	use({
		"voldikss/vim-floaterm",
		config = function()
			require("plugins.floaterm")
		end,
	})
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("plugins.telescope")
		end,
	})
	use({
		"tamago324/lir.nvim",
		config = function()
			require("plugins.lir")
		end,
		init = function() end,
	})
	use({
		"j-hui/fidget.nvim",
		requires = { "neovim/nvim-lspconfig" },
		config = function()
			require("fidget").setup({})
		end,
	})
	-- use("kyazdani42/nvim-web-devicons")
end)
