return {
  {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    opts_extend = { 'sources.providers' },

    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'folke/lazydev.nvim',
    },

    opts = {
      keymap = { preset = 'default' },

      appearance = {
        nerd_font_variant = 'mono',
        use_nvim_cmp_as_default = false,
      },

      completion = {
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
        keyword = { range = 'full' },
      },

      signature = { enabled = false },

      sources = {
        default = { 'lsp', 'path', 'buffer', 'snippets', 'obsidian' },

        providers = {
          obsidian = {
            module = 'obsidian.completion.blink',
            transform_items = function(items)
              for _, item in ipairs(items) do
                item.label = item.text
                item.insertText = item.text
              end
              return items
            end,
          },
        },
      },

      snippets = { preset = 'luasnip' },

      fuzzy = {
        implementation = 'lua',
        use_rust = false, -- verhindert die Warnung
      },
    },
  },
}
