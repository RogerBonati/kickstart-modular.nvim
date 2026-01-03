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
        -- { name = 'obsidian' }, -- this is the correct place
        { name = 'obsidian', keyword_length = 1, keyword_pattern = [[\k\+]] },
      },
      mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-y>'] = cmp.mapping.confirm(),
      },

      formatting = {
        format = function(entry, item)
          -- Do NOT modify Obsidian completion items
          if entry.source.name == 'obsidian' then
            item.word = entry.completion_item.label
            item.abbr = entry.completion_item.label
            item.insertText = entry.completion_item.insertText or entry.completion_item.label
            return item
          end

          return item
        end,
      },
    }
  end,
}
