require("extplugins")
require("cmp_cfg")
require("keymaps")
require("sumneko_cfg")
require("lualine_cfg")
require("nvim-autopairs").setup{}
require("settings")
require("bufferline").setup{}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

-- Setup lspconfig and appropriate servers
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.elixirls.setup{
  cmd = { "/home/codyw/langservers/elixir-ls/release/language_server.sh" },
  capabilities = capabilities
}

require'lspconfig'.tsserver.setup{
  capabilities = capabilities
}

require'lspconfig'.ccls.setup{
  capabilities = capabilities
}

require'lspconfig'.rust_analyzer.setup{
  capabilities = capabilities
}

require'lspconfig'.svelte.setup{
  capabilities = capabilities
}
-- Setup treesitter and ensure a select set of definitions is installed
local ts = require 'nvim-treesitter.configs'
ts.setup {
  ensure_installed = {
    'lua', 'c', 'cpp', 'html', 'elixir', 'rust', 'javascript', 'typescript', 'python'
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  },
  indent = {
    enable = true
  }
}

-- These are configuration options which haven't been turned into Lua yet
vim.cmd 'source ~/.config/nvim/unconverted.vim'
