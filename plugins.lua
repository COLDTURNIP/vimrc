local function load_config(name)
  return require("custom.config." .. name)
end

---@type NvPluginSpec[]
local plugins = {
  -- See https://github.com/folke/lazy.nvim#-plugin-spec

  -- override NvChad's default plugins
  -- ['folke/which-key.nvim'] = { disable = false }, -- which-key causes startuptime issue
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        opts = require("custom.config.nullls").opts,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.config.lsp"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = require "custom.config.mason-override",
  },

  -- customized plugins
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    keys = require("custom.config.hop").keys,
    config = require("custom.config.hop").config,
    lazy = false,
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
  },
  {
    "tpope/vim-surround",
  },
}

return plugins
