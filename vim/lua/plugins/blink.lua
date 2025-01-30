return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  version = '*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",
      ['<C-p>'] = {"select_prev", "fallback"},
      ['<C-n>'] = {"select_next", "fallback"},
      ['<Esc>'] = {"cancel", "fallback"},
      ['<CR>'] = {"accept", "fallback"},
    },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      --ghost_text = { enabled = true },
      menu = { auto_show = false },
    },
    signature = { enabled = true },
  },
}
