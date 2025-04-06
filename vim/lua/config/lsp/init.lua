local lsp_config = require 'lspconfig'
local custom_lsp_attach = require 'config.lsp.custom_lsp_attach'

vim.opt.completeopt = 'noinsert,menuone,noselect,preview'
vim.opt.shortmess:append({ c = true })

local defaults = {
  on_attach = custom_lsp_attach,
}

local servers = {
  -- copied from gopls config : https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-install
  gopls = {
    cmd = {"gopls", "-remote=auto", "serve"},
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
  },

  -- from the lspconfig's help
  lua_ls = {
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if path ~= vim.fn.stdpath('config') and (vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc')) then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT'
        },
        -- Make the server aware of Neovim runtime files
        workspace = {
          checkThirdParty = true,
          library = {
            vim.env.VIMRUNTIME,
            "${3rd}/luv/library",
          },
        },
      })
    end,
    settings = {
      Lua = {}
    },
  },

  phpactor = {},
  ts_ls = {},
  protols = {},
}

for server,config in pairs(servers) do
  lsp_config[server].setup(vim.tbl_deep_extend('force', defaults, config))
end
