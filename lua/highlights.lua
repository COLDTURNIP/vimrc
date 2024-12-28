-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  LspReferenceText = { fg = "orange", bg = "NONE" },
  LspReferenceRead = { fg = "orange", bg = "NONE" },
  LspReferenceWrite = { fg = "orange", bg = "NONE" },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
