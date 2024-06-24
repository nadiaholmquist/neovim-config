local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Colors
	{ "lifepillar/vim-gruvbox8", lazy = false, config = function()
		vim.cmd [[ colorscheme gruvbox8_hard ]]
	end },

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
		require("nvim-treesitter.configs").setup {
			ensure_installed = { "c", "cpp", "lua", "swift", "markdown", "vim", "vimdoc", "query" },
			auto_install = true,
			highlight = { enable = true, }
		}
	end },

	-- Language Server support
	{ "neovim/nvim-lspconfig", dependencies = {
		"p00f/clangd_extensions.nvim",
		"L3MON4D3/LuaSnip",
		{ "folke/lazydev.nvim", ft = "lua", opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			}},
		},
		{ "Bilal2453/luvit-meta", lazy = true },
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"saadparwaiz1/cmp_luasnip",
			},
			opts = function(_, opts)
				opts.sources = opts.sources or {}
				table.insert(opts.sources, {
					name = "lazydev",
					group_index = 0, -- set group index to 0 to skip loading LuaLS completions
				})
			end
		},
	}},
	{ 'kosayoda/nvim-lightbulb', config = true, opts = {
		autocmd = { enabled = true }
	}},

	-- File browser
	{ "ms-jpq/chadtree", lazy = false },

	{ "kylechui/nvim-surround", event = "VeryLazy", config = true },
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },

	-- Auto tab/spaces settings depending on file
	{ "tpope/vim-sleuth", lazy = false },

	{ "airblade/vim-gitgutter" },
	{ "notjedi/nvim-rooter.lua", lazy = false, config = true },

	-- For neovim-qt
	"equalsraf/neovim-gui-shim"
})

