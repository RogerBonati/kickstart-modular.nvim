-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup {
        -- Registering key mappings
        mappings = {
          -- Defining key mappings according to the new spec format
          { '<leader>c', group = '[C]ode' },
          { '<leader>c_', hidden = true }, -- Hidden mapping for <leader>c_
          { '<leader>d', group = '[D]ocument' },
          { '<leader>d_', hidden = true }, -- Hidden mapping for <leader>d_
          { '<leader>h', group = 'Git [H]unk' },
          { '<leader>h_', hidden = true }, -- Hidden mapping for <leader>h_
          { '<leader>r', group = '[R]ename' },
          { '<leader>r_', hidden = true }, -- Hidden mapping for <leader>r_
          { '<leader>s', group = '[S]earch' },
          { '<leader>s_', hidden = true }, -- Hidden mapping for <leader>s_
          { '<leader>t', group = '[T]oggle' },
          { '<leader>t_', hidden = true }, -- Hidden mapping for <leader>t_
          { '<leader>w', group = '[W]orkspace' },
          { '<leader>w_', hidden = true }, -- Hidden mapping for <leader>w_

      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
      -- Document existing key chains
      require('which-key').add {
        { '<leader>c', group = '[C]ode' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
