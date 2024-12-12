local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local make_enty = require 'telescope.make_entry'
local conf = require('telescope.config').values
local M = {}

local live_multigrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()
  local finder = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == '' then
        return nil
      end
      -- split the prompt at double spaces (if given)
      local pieces = vim.split(prompt, '  ')
      local args = { 'rg' }
      local args2 = { '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' }
      if pieces[1] then
        table.insert(args, '-e')
        table.insert(args, pieces[1])
      end
      if pieces[2] then
        table.insert(args, '-g')
        table.insert(args, pieces[2])
      end
      return vim.iter({ args, args2 }):flatten():totable()
    end,
    entry_maker = make_enty.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }
  pickers
    .new(opts, {
      debounce = 100,
      previewer = conf.grep_previewer(opts),
      sorter = require('telescope.sorters').empty(),
      prompt_title = 'Multi Grep',
      finder = finder,
    })
    :find()
end

M.setup = function()
  vim.keymap.set('n', '<leader>fm', live_multigrep, { desc = '[F]ind by [M]ultigrep (text and files)' })
end
return M
