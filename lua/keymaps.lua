vim.g.mapleader = " "

vim.keymap.set("n", "<leader>c", ":close<CR>")
vim.keymap.set("n", "<leader>x", ":bdelete<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quitall<CR>")

vim.api.nvim_del_keymap("n", "grn")
vim.api.nvim_del_keymap("n", "grr")
vim.api.nvim_del_keymap("n", "gra")
vim.api.nvim_del_keymap("x", "gra")
vim.api.nvim_del_keymap("n", "gri")

-- For non-ui related lsp actions, use native implementation
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action)
vim.keymap.set("n", "gn", vim.lsp.buf.rename)
vim.keymap.set("n", "gk", vim.lsp.buf.hover)

