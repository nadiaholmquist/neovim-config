require("plugins")
require("setup-lspconfig")

if vim.g.neovide then
	require("neovide")
end

vim.g.mapleader = " "

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.number = true
vim.opt.scrolloff = 5

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Easily escape terminal with Ctrl+Space
vim.keymap.set("t", "<C- >", "<C-\\><C-n>")
