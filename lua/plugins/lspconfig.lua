local lspconfig = require("lspconfig")
lspconfig.rust_analyzer.setup({})
lspconfig.tsserver.setup({})

vim.g.markdown_fenced_languages = { "ts=typescript" }
-- lspconfig.denols.setup{}

lspconfig.pyright.setup({})

-- language server keybindings
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help<CR>', {noremap=true, silent=true})
-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, {noremap=true, silent=true})
-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, {noremap=true, silent=true})
-- vim.keymap.set('n', '<space>wl', vim.inspect(vim.lsp.buf.list_workspace_folders)), {noremap=true, silent=true})
vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, { noremap = true, silent = true })
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { noremap = true, silent = true })
vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true })
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { noremap = true, silent = true })
