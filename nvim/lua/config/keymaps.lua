-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {silent=true})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {silent=true})

