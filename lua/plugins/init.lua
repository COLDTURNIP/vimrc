return {
  -- These are some examples, uncomment them if you want to see them work!
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("nvchad.configs.lspconfig").defaults()
  --     require "configs.lspconfig"
  --   end,
  -- },
  --
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lsp").config()
    end,
    opts = require("configs.lsp").opts
  },
  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
  },
  {
    "nvim-treesitter/nvim-treesitter",
  	opts = require "configs.treesitter",
  },

  -- customized plugins
  {
    "smoka7/hop.nvim",
    version = "*",
    keys = require("configs.hop").keys,
    config = require("configs.hop").config,
    lazy = false,
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
  },
  {
    "tpope/vim-surround",
  },
  { -- formater
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  { -- formater
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  -- { -- linter
  --   'mfussenegger/nvim-lint',
  --   -- TOOD: uncomment this plugin if automatic linting needed
  --   -- TODO: refactor the following logic into require "configs.nvimlint"
  --   event = { 'BufReadPost', 'BufNewFile' },
  --   config = function()
  --     local translator = { ['golangci-lint'] = 'golangcilint' }
  --     local linters_by_ft = {} ---@type table<string, string[]>
  --     for ft, linters in pairs(globals.linters) do
  --       linters_by_ft[ft] = translate_list(translator, linters)
  --     end

  --     require('lint').linters_by_ft = linters_by_ft
  --     local lint_group = vim.api.nvim_create_augroup('NvimLint', {})
  --     vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost' }, {
  --       group = lint_group,
  --       callback = function()
  --         require('lint').try_lint()
  --       end,
  --     })
  --   end,
  -- },
}
