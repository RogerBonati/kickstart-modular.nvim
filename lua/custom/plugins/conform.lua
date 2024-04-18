return {
  'mhartington/formatter.nvim',
  require('conform').setup {
    formatters_by_ft = {
      yaml = { 'prettier' },
      yml = { 'prettier' },
    },
  },
}
