require "nvchad.mappings"

local map = vim.keymap.set

-- NvChad built-in recommend
-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- customized
map("n", "<leader>[", "<cmd> cp <CR>", { desc = "jump to previous error" })
map("n", "<leader>]", "<cmd> cn <CR>", { desc = "jump to next error" })
map("v", "<leader>[", "<cmd> cp <CR>", { desc = "jump to previous error" })
map("v", "<leader>]", "<cmd> cn <CR>", { desc = "jump to next error" })
map("o", "<leader>[", "<cmd> cp <CR>", { desc = "jump to previous error" })
map("o", "<leader>]", "<cmd> cn <CR>", { desc = "jump to next error" })
map("v", "<", "<gv")
map("v", ">", ">gv")

-- emacs-like movement
map("c", "<C-a>", "<Home>")
map("c", "<C-e>", "<End>")
map("i", "<C-b>", "<Left>")
map("i", "<C-f>", "<Right>")
map("i", "<C-a>", "<Esc>^i")
map("i", "<C-k>", "<Esc>Da")

-- plugins
map("n", "<leader>fn", "<cmd> NvimTreeFocus <CR>", { desc = "open file tree" })
