return {
  'MunifTanjim/oil.nvim',
  event = 'VimEnter',
  opts = {},
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      default_file_explorer = true,
    }
  end,
}
