return {
  'projekt0n/github-nvim-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1003, -- make sure to load this before all the other start plugins
  config = function()
    require('github-theme').setup {
      -- ...
    }

    -- vim.cmd 'colorscheme catppuccin'
    -- vim.cmd 'colorscheme tokyonight-storm'
  end,
} --
