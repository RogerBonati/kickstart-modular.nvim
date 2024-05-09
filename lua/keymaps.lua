-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- linting
vim.keymap.set('n', '<leader>l', function()
  require('conform').format { bufnr = vim.api.nvim_get_current_buf() }
end, { desc = 'Trigger formatting for current file' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- linting
--vim.api.nvim_create_autocmd('BufWritePre', {
--  pattern = '*.yaml,*.yml',
--  callback = function(args)
--    require('conform').format { bufnr = args.buf }
--  end,
--})
local group = vim.api.nvim_create_augroup('Format', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
  group = group,
  pattern = '*.yaml,*.yml',
  callback = function()
    vim.cmd '%s/\\s\\+$//e'
  end,
})

-- Set the undo directory to a temporary directory
local undo_dir = '/tmp/nvim_undo'

-- Create the undo directory if it doesn't exist
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, 'p')
end

-- Set the undo directory option using vim.o
vim.o.undodir = undo_dir
local o = vim.o
o.expandtab = true -- expand tab input with spaces characters
o.tabstop = 2 -- num of space characters per tab
o.shiftwidth = 2 -- spaces per indentation level

-- Automatically clear the undo directory on exit
vim.cmd [[
 autocmd VimLeave * silent! call delete(expand('&undodir'), 'rf')
]]

-- set <leader>a to open documentation for ansible
vim.api.nvim_set_keymap('n', '<leader>a', ':lua vim.cmd("AnsibleDocFloat")<CR>', { noremap = true, silent = true })

-- vim: ts=2 sts=2 sw=2 et
