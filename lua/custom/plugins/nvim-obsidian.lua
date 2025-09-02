return {
  -- obsidian
  {
    'obsidian-nvim/obsidian.nvim',
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
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = '_Datumsnotizen',
        -- Optional, if you want to change the date format for the ID of daily notes.
        -- date_format = "%Y-%m-%d",
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = '%B %-d, %Y',
        -- Optional, default tags to add to each new daily note created.
        default_tags = { 'daily-notes' },
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = '_Vorlagen/Datumsnotizen',
      },
      -- Optional, for templates (see below).
      templates = {
        folder = '_Vorlagen',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
      },
      -- Either 'wiki' or 'markdown'.
      preferred_link_style = 'wiki',
      -- preferred_link_style = 'markdown',
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
