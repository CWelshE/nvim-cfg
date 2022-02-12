local sumneko_binary = vim.fn.exepath('lua-language-server')
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary, ':h:h:h')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local settings = {
  Lua = {
    runtime = {
      version = 'LuaJIT',
      path = runtime_path,
    },
    diagnostics = {
      globals = {'vim'},
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = vim.api.nvim_get_runtime_file("", true),
    },
  },
}

local cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
local sumneko = {
  settings = settings,
  cmd = cmd;
}

return sumneko
