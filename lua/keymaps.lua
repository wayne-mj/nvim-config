local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move lines up/down
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc ="Move lines down in visual selection"})
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc ="Move lines up in visual selection"})

-- Join Lines
keymap("n", "J", "mzJ`z")

-- Indent/Antindent
keymap("v","<","<gv",opts)
keymap("v",">",">gv",opts)

-- Language formating
keymap("n", "<leader>f", vim.lsp.buf.format)

-- Global search and replace from cursor
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word cursor is on globally" })

-- Tabs
keymap("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "Open new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close current tab" })
keymap("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "Go to next tab" })
keymap("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "Go to previous tab" })
keymap("n", "<leader>tf", "<cmd>tabnew %<cr>", { desc = "Open current tab in new tab" })

-- Explorer
keymap("n", "<leader>e", "<cmd>Ex<cr>", { desc = "Neovim Explorer"})

-- Lazy
keymap("n", "<leader>L","<cmd>Lazy<cr>", { desc = "Lazy Vim"})
keymap("n", "<leader>Lu" , "<cmd>Lazy update<cr>", { desc = "Lazy Update" })

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Telescope Fine Files"})
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Live Grep"})
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope Search Buffer"})
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Telescope List Keymaps"})
--keymap("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "Telescope Fine Files"})
--keymap("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "Telescope Fine Files"})

-- Comment
-- keymap("n", "<C-/>", "gc", { desc = "Comment/Uncomment section"})

-- Trouble
keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)", })
keymap("n", "<leader>x", "<cmd>Trouble<cr>", { desc = "Launch Trouble", })
keymap("n", "<leader>xl", "<cmd>Trouble lsp<cr>", { desc = "LSP (Trouble)", })



