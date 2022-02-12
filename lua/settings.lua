-- Vim opts section
local bo = vim.bo
local c = vim.cmd
local g = vim.g
local o = vim.o
local wo = vim.wo

-- [b]uffer gl[o]bal
bo.shiftwidth=2
bo.tabstop = 2

-- Gl[o]bal
o.backup = true
o.backupdir = '~/.local/share/nvim/backup//'
o.breakindent = true
o.completeopt = 'menu,menuone,noselect'
o.hidden = true
o.hlsearch = false
o.ignorecase = true
o.inccommand = 'nosplit'
o.redrawtime = 5000
o.scrolloff = 3
o.smartcase = true
o.termguicolors = true
o.title = true
o.undofile = true
o.updatetime = 300

-- [w]indow gl[o]bal
wo.number = true
wo.signcolumn = 'yes'

-- Run Mix formatter every time we save Elixir files
g.mix_format_on_save = 1

o.background = 'dark'

-- [c]md
c('set expandtab')
c [[filetype off]]
