local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
-- sumneko_lua is already configured by NvChad

lspconfig["rust_analyzer"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig["gopls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig["pylsp"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig["denols"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}

lspconfig["tsserver"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
  single_file_support = false,
}

lspconfig["dockerls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig["cssls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig["html"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

return lspconfig
