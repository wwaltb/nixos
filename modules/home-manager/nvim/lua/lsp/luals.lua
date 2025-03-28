vim.lsp.config.luals = {
    cmd = { 'lua-language-server' },
    root_markers = { '.git', '.luarc.json' },
    filetypes = { 'lua' },
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        }
      }
    }
}

vim.lsp.enable('luals')
