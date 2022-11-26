-- Refer to :h nvim-defaults and .config/nvim/lua/core/options.lua for default settings.

local opt = vim.opt
local global = vim.g

opt.wrap = false -- do not wrap lines by default
opt.clipboard = "unnamedplus"
opt.timeoutlen = 500
opt.winminwidth = 0 -- set the min width of a window to 0 so we can maximize others
opt.winminheight = 0 -- set the min height of a window to 0 so we can maximize others

-- line numbers
opt.number = true -- show line number in default
opt.relativenumber = false -- show related line number in default
opt.ruler = true -- show the cursor position all the time

-- cursor
opt.cursorline = true -- highlight current line
opt.cursorcolumn = true -- highlight current column
opt.colorcolumn = "81"
opt.showmatch = true -- Cursor shows matching ) and }

-- indenting
opt.copyindent = true -- copy the previous indentation on autoindenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.list = true -- show blank characters
opt.listchars = {
  tab = "»·",
  trail = "·",
}

-- search
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- ignore case if search pattern is all lowercase,case-sensitive otherwise
opt.inccommand = "nosplit" -- interactive replace

-- mouse
opt.mouse = nil -- disable mouse integration

-- providers: Python
global.loaded_python3_provider = nil -- enable Python3 provider
global.python_host_prog = "/Users/coldturnip/.pyenv/versions/neovim2/bin/python" -- deprecated
global.python3_host_prog = "/Users/coldturnip/.pyenv/versions/neovim38/bin/python"
