require "plugins"
require "setup-lspconfig"
require "filetypes"
require "mappings"

if vim.g.neovide then
	require "neovide"
end

vim.g.mapleader = " "

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 5

vim.opt.ignorecase = true
vim.opt.smartcase = true
