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

-- Lazy package manager
-- Install
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


-- require("lspconfig").lua_ls.setup({})
-- require("lspconfig").clangd.setup({})
-- require("mason").setup()
-- require("mason-lspconfig").setup()

-- Run lazy
require("lazy").setup({
    -- Plugins
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' },
	    config = function()
            require('mason-lspconfig').setup({
            	ensure_installed = { 
			"lua_ls", 
			"clangd",
			"pylsp",
			},
            	automatic_installation = true,
            })
    	end
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'williamboman/mason-lspconfig.nvim' },
        config = function()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup{}
            lspconfig.clangd.setup{}
            lspconfig.pylsp.setup{}
            -- Add more language server setups as needed
        end
    },
    {
        -- Telescope for file changing and fuzzy finder
        "nvim-telescope/telescope.nvim", tag = "0.1.8",
        dependencies = {
            -- Plenary is a dependency of lots of other plugins
            "nvim-lua/plenary.nvim",
            
            -- Sorter greatly imporves performance
            "nvim-telescope/telescope-fzf-native.nvim",

            -- Required for live_grep and grep_string and find_files
            "BurntSushi/ripgrep",

            --Treesitter - Maybe move this outside of dependencies
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        end
    },

    -- Color Scheme
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = false,
                terminal_colors = true,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                },
            })
            vim.cmd[[colorscheme tokyonight-storm]]
        end
    }
})

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",   -- Lua
        "clangd",   -- C/C++
        "pylsp",    -- Python
    },
    automatic_installation = true,
})


-- Keymaps
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {silent=true})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {silent=true})

