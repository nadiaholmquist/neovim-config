local telescope = require('telescope.builtin')

-- Global mappings.
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', telescope.diagnostics)

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

-- Easily escape terminal with Ctrl+Space
vim.keymap.set("t", "<C- >", "<C-\\><C-n>")

vim.keymap.set('n', 'å', ":Neotree reveal<CR>", { silent = true })

vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<leader>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<leader>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)

		-- Telescope-enabled LSP commands
		vim.keymap.set('n', 'gd', telescope.lsp_definitions, opts)
		vim.keymap.set('n', '<leader>D', telescope.lsp_type_definitions, opts)
		vim.keymap.set('n', 'gr', telescope.lsp_references, opts)
		vim.keymap.set('n', 'gi', telescope.lsp_implementations, opts)

		vim.keymap.set('n', '<leader>ws', telescope.lsp_dynamic_workspace_symbols, opts)
		vim.keymap.set('n', '<leader>s', telescope.lsp_document_symbols, opts)
	end,
})

