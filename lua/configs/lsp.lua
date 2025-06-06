local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = {
  "html", "cssls",
  "dockerls",
  "rust_analyzer", -- rust
  "gopls", -- go
  "pylsp", -- python
  "ts_ls", -- typescript
}


local M = {
  opts = {
    document_highlight = {
      enabled = true,
    },
  },

  config = function()
    local lspconfig = require "lspconfig"
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
      }
    end

    lspconfig["denols"].setup {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
    }
    return lspconfig
  end,
}

return M
