-- return {
--   'ggandor/leap.nvim',
--   -- init = function()
--   -- 	require("leap").add_default_mappings()
--   -- end,
--   dependencies = {
--     'tpope/vim-repeat',
--   },
--
--   opts = {
--     add_default_mappings = true,
--   },
--
--   lazy = false,
-- }

-- return {
--   {
--     url = 'https://codeberg.org/andyg/leap.nvim',
--     dependencies = {
--       'tpope/vim-repeat',
--     },
--     config = function()
--       require('leap').add_default_mappings()
--     end,
--   },
-- }

return {
  {
    url = 'https://codeberg.org/andyg/leap.nvim',
    dependencies = { 'tpope/vim-repeat' },

    build = false,
    dev = false,
    -- force full clone:

    config = function()
      local leap = require 'leap'

      -- These are the new recommended mappings
      leap.add_repeat_mappings('s', '<enter>')

      -- Standard motions
      vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
      vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
      vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)')
    end,
  },
}
