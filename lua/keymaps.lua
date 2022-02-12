-- Remappings of commands and keys should be contained in here.
local map = vim.api.nvim_set_keymap

-- Window switching
map('n', '<C-h>', '<C-w>h', {})
map('n', '<C-j>', '<C-w>j', {})
map('n', '<C-k>', '<C-w>k', {})
map('n', '<C-l>', '<C-w>l', {})

-- Leader remapping
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

map('n', '<leader>k', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true })

map('n', ']b', '<cmd>BufferLineCycleNext<CR>', { noremap = true})
map('n', '[b', '<cmd>BufferLineCyclePrev<CR>', { noremap = true})
map('n', '[B', '<cmd>BufferLinePickClose<CR>', { noremap = true})

-- nnoremap <silent><mymap> :BufferLineMoveNext<CR>
-- nnoremap <silent><mymap> :BufferLineMovePrev<CR>

-- nnoremap <silent>be :BufferLineSortByExtension<CR>
-- nnoremap <silent>bd :BufferLineSortByDirectory<CR>
-- nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

local snip_opts = { noremap = true, expr = true, silent = true }

map('i',
    '<C-j>',
    "vsnip#expandable() ? '<cmd>:call vsnip#expand()<CR>' : '<C-j>'",
    snip_opts)
map('s',
    '<C-j>',
    "vsnip#expandable() ? '<cmd>:call vsnip#expand()<CR>' : '<C-j>'",
    snip_opts)

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  --
  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>CodeActionMenu<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'sumneko_lua', 'tsserver', 'ccls', 'svelte', 'rust_analyzer', 'svelte' }
for _, lsp in ipairs(servers) do
  if lsp == 'sumneko_lua' then
    nvim_lsp[lsp].setup {
      settings = require('sumneko_cfg').settings,
      cmd = require('sumneko_cfg').cmd,
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  else
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end
end
