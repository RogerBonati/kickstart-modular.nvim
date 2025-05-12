-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

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

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Dont use swap
vim.opt.swapfile = false

-- from linixdabbler https://gitlab.com/linuxdabbler/dotfiles/-/blob/main/.config/nvim/init.lua?ref_type=heads

-- local function get_all_buffers()
--   local buffers = {}
--   for i = 1, vim.api.nvim_list_bufs()[1] do
--     table.insert(buffers, vim.api.nvim_buf_get_name(i))
--   end
--   return table.concat(buffers, ' ')
-- end
--
-- -- vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#000000', fg = '#ffffff' })
-- vim.api.nvim_set_option_value('statusline', get_all_buffers(), {})
-- -- Use a custom function for the statusline

vim.opt.title = true -- show title
vim.opt.syntax = 'ON'
vim.opt.backup = false
vim.opt.compatible = false -- turn off vi compatibility mode
vim.opt.number = true -- turn on line numbers
vim.opt.relativenumber = true -- turn on relative line numbers
vim.opt.mouse = 'a' -- enable the mouse in all modes
vim.opt.ignorecase = true -- enable case insensitive searching
vim.opt.smartcase = true -- all searches are case insensitive unless there's a capital letter
-- vim.opt.hlsearch = false -- disable all highlighted search results
vim.opt.hlsearch = true
vim.opt.incsearch = true -- enable incremental searching
vim.opt.wrap = true -- enable text wrapping
-- vim.opt.tabstop = 4						-- tabs=4spaces
vim.opt.shiftwidth = 4
vim.opt.fileencoding = 'utf-8' -- encoding set to utf-8
vim.opt.pumheight = 10 -- number of items in popup menu
vim.opt.showtabline = 2 -- always show the tab line
vim.opt.laststatus = 2 -- always show statusline
vim.opt.signcolumn = 'auto'
vim.opt.expandtab = false -- expand tab
vim.opt.smartindent = true
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.showmode = true
-- vim.opt.scrolloff = 8					-- scroll page when cursor is 8 lines from top/bottom
vim.opt.sidescrolloff = 8 -- scroll page when cursor is 8 spaces from left/right
vim.opt.guifont = 'monospace:h17'
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.termguicolors = true -- terminal gui colors

vim.opt.signcolumn = 'yes:1'

-- vim: ts=2 sts=2 sw=2 et
