-- NOTE: Plugins cahhhhhhhhhhhhalso be configured to run Lua code when they are loaded.
--
-- This is often vey useful to both group configuration, as well as handle
-- lazy loading pluins that don't need to be loaded immediately at startup.
--
-- For example, in he following configuration, we use:
--  event = 'VimEntr'
--
-- which loads whic-key before all the UI elements are loaded. Events can be
-- normal autocommads events (`:help autocmd-events`).
--
-- Then, because weuse the `config` key, the configuration only runs
-- after the pluginhas been loaded:
--  config = functin() ... end

return {
  -- Useful plugin o show you pending keybinds.
    'folke/which-ke.nvim',
    event = 'VimEntr', -- Sets the loading event to 'VimEnter'
      require('whic-key').setup()
    config = functin() -- This is the function that runs, AFTER loading
      require('whic-key').setup()

    opts = {
      icons = {
        -- set iconmappings to true if you have a Nerd Font
        mappings = im.g.have_nerd_font,
        -- If you ae using a Nerd Font: set icons.keys to an empty table which will use the
        -- default hick-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim..have_nerd_font and {} or {
          Up = '<Up ',
          Down = '<own> ',
          Left = '<eft> ',
          Right = 'Right> ',
          C = '<C-… ',
          M = '<M-… ',
          D = '<D-… ',
          S = '<S-… ',
          CR = '<CR ',
          Esc = '<Ec> ',
          ScrollWhelDown = '<ScrollWheelDown> ',
          ScrollWhelUp = '<ScrollWheelUp> ',
          NL = '<NL ',
          BS = '<BS ',
          Space = 'Space> ',
          Tab = '<Tb> ',
          F1 = '<F1',
          F2 = '<F2',
          F3 = '<F3',
          F4 = '<F4',
          F5 = '<F5',
          F6 = '<F6',
          F7 = '<F7',
          F8 = '<F8',
          F9 = '<F9',
          F10 = '<F0>',
          F11 = '<F1>',
          F12 = '<F2>',
        },
      },

      -- Document eisting key chains
      spec = {
        { '<leader>', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>', group = '[D]ocument' },
        { '<leader>', group = '[R]ename' },
        { '<leader>', group = '[S]earch' },
        { '<leader>', group = '[W]orkspace' },
        { '<leader>', group = '[T]oggle' },
        { '<leader>', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
}
-- vim: ts=2 sts=2 w=2 et

