local function load_config(name)
  return require("custom.plugins." .. name)
end

return {
  -- disable NvChad's default plugins
  -- ['folke/which-key.nvim'] = { disable = false }, -- which-key causes startuptime issue
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lsp"
    end,
  },
  ["williamboman/mason.nvim"] = {
    override_options = {
      ensure_installed = {
        -- Rust
        "rust-analyzer",

        -- Go
        "gopls",

        -- Elixir
        "elixir-ls",

        -- Python
        "python-lsp-server",
        "pylint",

        -- Lua
        -- sumneko_lua is already configured by NvChad
        "stylua",

        -- container
        "dockerfile-language-server",

        -- web dev
        "css-lsp",
        "html-lsp",
        "json-lsp",

        -- shell
        "shfmt",
        "shellcheck",
      },
    },
  },

  -- customized plugins
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.nullls"
    end,
  },
  ["phaazon/hop.nvim"] = {
    branch = "v2", -- optional but strongly recommended
    config = function()
      require("hop").setup {}
    end,
  },
  ["mg979/vim-visual-multi"] = { branch = "master" },
  ["tpope/vim-surround"] = {},
}
