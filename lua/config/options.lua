vim.cmd("let g:netrw_banner = 0")

-- Block cursor
vim.o.guicursor = ""

-- Line and relative line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Tabs and indents
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.wrap = false

-- Search
vim.o.incsearch = true
vim.o.inccommand = "split"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

-- Visuals
vim.o.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 300

-- Leader keys
--vim.g.mapleader = " "
--vim.g.maplocalleader = " "

-- Additional options
vim.o.mouse = "a"
--vim.o.clipboard:append("unnamedplus")
vim.g.editorconfig = true

-- List characters
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
