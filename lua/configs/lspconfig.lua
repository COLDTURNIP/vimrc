require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html", "cssls",
  "dockerls",
  "rust_analyzer", -- rust
  "gopls", -- go
  "pylsp", -- python
  "ts_ls", -- typescript
  "denols", -- deno
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
