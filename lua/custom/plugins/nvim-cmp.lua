return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'obsidian-nvim/obsidian.nvim', -- needed for the obsidian source
  },

  config = function()
    local cmp = require 'cmp'

    cmp.setup {
      sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'obsidian' }, -- this is the correct place
      },
      mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-y>'] = cmp.mapping.confirm(),
      },
    }
  end,
}
