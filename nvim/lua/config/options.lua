-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Set the number of spaces a tab is equal to
vim.opt.tabstop = 4

-- Set the number of spaces used for indentation
vim.opt.shiftwidth = 4

-- Use multiple of shiftwidth when indenting with '<' and '>'
vim.opt.shiftround = true

-- Copy indent from current line when starting a new line
vim.opt.autoindent = true

-- Do smart autoindenting when starting a new line
vim.opt.smartindent = true

-- Use clipboard for yank
vim.opt.clipboard = "unnamedplus"
