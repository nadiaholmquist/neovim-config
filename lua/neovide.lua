-- macOS and Linux treat font sizes differently.
if vim.loop.os_uname().sysname == "Darwin" then
	vim.o.guifont = "Fira Code:h15"
else
	vim.o.guifont = "Fira Code:h11"
end

vim.g.neovide_show_border = true
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_remember_window_size = true

vim.g.neovide_padding_top = 4
vim.g.neovide_padding_bottom = 4
vim.g.neovide_padding_left = 4
vim.g.neovide_padding_right = 4

-- Work around Neovide's default working directory being / on macOS
if vim.fn.getcwd() == "/" then
	vim.fn.chdir(vim.fn.getenv("HOME"))
end
