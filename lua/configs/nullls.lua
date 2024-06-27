local function config_sources()
  local null_ls = require "null-ls"

  local sources = {

    -- webdev stuff
    null_ls.builtins.formatting.prettier,

    -- Lua
    null_ls.builtins.formatting.stylua,

    -- Shell
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
  }
  return sources
end

local M = {
  --[[
  config = function()
    return {
      debug = true,
      sources = config_sources(),
    }
  end,
  --]]

  opts = function(_, opts)
    opts.sources = config_sources()
  end,
}

return M
