---@type MappingsTable

-- Refer to .config/nvim/lua/core/mappings.lua
local M = {}

M.general = {
  n = {
    ["<leader>["] = { "<cmd> cp <CR>", "jump to previous error" },
    ["<leader>]"] = { "<cmd> cn <CR>", "jump to next error" },
  },
  v = {
    ["<leader>["] = { "<cmd> cp <CR>", "jump to previous error" },
    ["<leader>]"] = { "<cmd> cn <CR>", "jump to next error" },
    ["<"] = { "<gv" },
    [">"] = { ">gv" },
  },
  o = {
    ["<leader>["] = { "<cmd> cp <CR>", "jump to previous error" },
    ["<leader>]"] = { "<cmd> cn <CR>", "jump to next error" },
  },
  c = {
    ["<C-a>"] = { "<Home>" },
    ["<C-e>"] = { "<End>" },
  },
}

M.base_emacs_movement = {
  i = {
    ["<C-b>"] = { "<Left>" },
    ["<C-f>"] = { "<Right>" },
    ["<C-a>"] = { "<Esc>^i" },
    ["<C-k>"] = { "<Esc>Da" },
  },
}

M.base_nevigation = {
  n = {
    ["<leader>fn"] = { "<cmd> NvimTreeFocus <CR>", "open file tree" },
  },
}

-- plugins: defined in custom/config/<plugin>.lua, and setup in custom/plugins.loa

return M
