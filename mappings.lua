-- Refer to .config/nvim/lua/core/mappings.lua
local M = {}

-- base config
M.base = {
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

-- plugin: phaazon/hop.nvim
do
  -- available functions: https://github.com/phaazon/hop.nvim/blob/master/plugin/hop.vim
  local hop = require "hop"
  local directions = require("hop.hint").HintDirection
  local keymap = {
    ["f"] = {
      function()
        hop.hint_char1 { current_line_only = true }
      end,
      "hop to inline position",
    },
    [",,b"] = {
      function()
        hop.hint_words { direction = directions.BEFORE_CURSOR }
      end,
      "hop to word backward",
    },
    [",,w"] = {
      function()
        hop.hint_words { direction = directions.AFTER_CURSOR }
      end,
      "hop to word forward",
    },
    [",,k"] = {
      function()
        hop.hint_vertical { direction = directions.BEFORE_CURSOR }
      end,
      "hop to line backward",
    },
    [",,j"] = {
      function()
        hop.hint_vertical { direction = directions.AFTER_CURSOR }
      end,
      "hop to line forward",
    },
  }
  M.plugin_hop = { n = keymap, v = keymap, o = keymap }
end

return M
