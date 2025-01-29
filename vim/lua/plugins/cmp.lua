return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {'onsails/lspkind.nvim'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lsp-signature-help'},
      {'hrsh7th/cmp-path'},
      {
        'hrsh7th/cmp-cmdline',
        dependencies = {
          {'hrsh7th/cmp-buffer'},
        },
      },
      {
        'saadparwaiz1/cmp_luasnip',
        dependencies = {
          {'L3MON4D3/LuaSnip'},
        },
      },
    },
    opts = function()
      local cmp = require "cmp"
      local lspkind = require "lspkind"

      cmp.setup.cmdline(':', {
        sources = {
          { name = 'cmdline' }
        }
      })

      cmp.setup.cmdline('/', {
        sources = {
          { name = 'buffer' }
        }
      })

      return {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = {
          -- from https://github.com/greg0ire/dotvim/blob/main/lua/greg0ire/intellisense.lua
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<Esc>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
          }),
        },
        sources = {
          { name = 'buffer' },
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
        },
        formatting = {
          format = lspkind.cmp_format(),
        },
      }
    end,
  }
}
