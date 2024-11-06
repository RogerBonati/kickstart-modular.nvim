return {
  -- obsidian
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '~/Eigenedat/ObsidianVault',
        },
      },
      ui = { enable = false },
      notes_subdir = '_Datumsnotizen',

      -- Optional, for templates (see below).
      templates = {
        folder = '_Vorlagen',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
      },
      -- Either 'wiki' or 'markdown'.
      -- preferred_link_style = 'wiki',
      preferred_link_style = 'markdown',
      -- see below for full list of options 👇
    },
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    keys = {},
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
}
