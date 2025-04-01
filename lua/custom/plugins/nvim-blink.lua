return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v1.*',
    opts = {
      -- keymap = { preset = 'super-tab' },
      keymap = {
        preset = 'default',
        ['<C-Z>'] = { 'accept', 'fallback' },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },

      completion = {
        documentation = { auto_show = true },
        menu = {
          border = 'rounded',
        },
        ghost_text = { enabled = true },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      signature = { enabled = true },
    },
  },
}
