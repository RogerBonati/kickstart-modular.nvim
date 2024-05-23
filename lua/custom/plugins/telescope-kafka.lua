return {
  'krisajenkins/telescope-kafka.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('telescope').load_extension 'telescope_kafka'
    require('telescope_kafka').setup {
      kcat_path = '/usr/local/bin/kcat',
    }
  end,

  -- Example keybindings. Adjust these to suit your preferences or remove
  --   them entirely:
  keys = {
    {
      '<Leader>kt',
      ':Telescope telescope_kafka kafka_topics<CR>',
      desc = '[K]afka [T]opics',
    },
  },
}
