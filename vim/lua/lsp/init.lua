local lsp_config = require 'lspconfig'
local custom_lsp_attach = require 'lsp/custom_lsp_attach'
local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.opt.completeopt = 'noinsert,menuone,noselect,preview'
vim.opt.shortmess:append({ c = true })

-- lsp configuration
-- copied from gopls config : https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-install
lsp_config.gopls.setup {
  cmd = {"gopls", "-remote=auto", "serve"},
  on_attach = custom_lsp_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        useany = true,
      },
      staticcheck = true,
      codelenses = {
        generate = true,
        gc_details = true,
      },
    },
  },
}

lsp_config.phpactor.setup{
  on_attach = custom_lsp_attach,
  capabilities = capabilities,
}

lsp_config.ts_ls.setup {
  on_attach = custom_lsp_attach,
  capabilities = capabilities,
}

lsp_config.protols.setup {
  on_attach = custom_lsp_attach,
  capabilities = capabilities,
}

-- from the lspconfig help
lsp_config.lua_ls.setup {
  on_attach = custom_lsp_attach,
  capabilities = capabilities,
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        },
      },
    })
  end,
  settings = {
    Lua = {}
  }
}
