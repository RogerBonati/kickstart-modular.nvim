--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- tests
vim.keymap.set('n', '<leader>lb', function()
  require('conform').format()
end, { desc = 'conform test' })
--
-- Diagnostic keymaps

-- vim.keymap.set('n', '[d', vim.diagnostic.jump { count = 1 }, { desc = 'Go to previous [D]iagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.jump { count = -1 }, { desc = 'Go to next [D]iagnostic message' })

-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {0, {scope="line"}, desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>e', function()
  local diagnostics = vim.diagnostic.get()
  local lines = {}
  for _, diag in ipairs(diagnostics) do
    table.insert(lines, diag.message)
  end
  vim.diagnostic.open_float({ lines = lines }, { scope = 'full' })
end, { desc = 'Show diagnostic [E]rror messages' })

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

-- set <leader>a to open documentation for ansible
vim.api.nvim_set_keymap('n', '<leader>a', ':lua vim.cmd("AnsibleDocFloat")<CR>', { noremap = true, silent = true, desc = 'open ansible help' })

-- neotree
vim.api.nvim_set_keymap('n', '<leader>nt', ':lua vim.cmd("Neotree")<CR>', { noremap = true, silent = true, desc = 'open neotree file explorer' })
-- get rid of message buffer
vim.api.nvim_set_keymap('n', '<leader>nd', ':lua vim.cmd("NoiceDismiss")<CR>', { noremap = true, silent = true, desc = 'dismiss noicy messages' })

-- oil
vim.keymap.set('n', '-', ':lua vim.cmd("Oil --float")<CR>', { desc = 'Open parent directory' })

-- transparency
vim.api.nvim_set_keymap('n', '<leader>te', ':lua vim.cmd("TransparentEnable")<CR>', { noremap = true, silent = true, desc = 'enable transparency' })
vim.api.nvim_set_keymap('n', '<leader>td', ':lua vim.cmd("TransparentDisable")<CR>', { noremap = true, silent = true, desc = 'disable transparency' })
vim.api.nvim_set_keymap('n', '<leader>tr', ':lua vim.cmd("TransparentToggle")<CR>', { noremap = true, silent = true, desc = 'toggle transparency' })

-- relative linenumbers on of or no numbers
vim.api.nvim_set_keymap(
  'n',
  '<leader>lr',
  ':lua vim.o.relativenumber = not vim.o.relativenumber<CR>',
  { noremap = true, silent = true, desc = 'toggle relative linenumbers' }
)
vim.api.nvim_set_keymap('n', '<leader>ln', ':lua vim.opt.number = not vim.o.number<CR>', { noremap = true, silent = true, desc = 'toggle line numbering' })

-- set <leader>yt to open yaml treesitter
vim.api.nvim_set_keymap('n', '<leader>ya', ':lua vim.cmd("YAMLTelescope")<CR>', { noremap = true, silent = true, desc = 'open telescope for yaml' })

vim.api.nvim_set_keymap(
  'n',
  '<leader>yt',
  ':lua vim.cmd("Telescope yaml_schema")<CR>',
  { noremap = true, silent = true, desc = 'open treesitter yaml schemas' }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>yy',
  ':lua vim.cmd("YAMLYank")<CR>',
  { noremap = true, silent = true, desc = 'yank full path and key of the current yaml key in buffer' }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>yk',
  ':lua vim.cmd("YAMLYankKey")<CR>',
  { noremap = true, silent = true, desc = 'yank the full path of the key for the current key / value pair' }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>yv',
  ':lua vim.cmd("YAMLYankValue")<CR>',
  { noremap = true, silent = true, desc = 'yank the value of the current key / value pair' }
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>yq',
  ':lua vim.cmd("YAMLQuickfix")<CR>',
  { noremap = true, silent = true, desc = 'perform a yaml quickfix with the current key / value pairs' }
)

-- colorscheme
vim.api.nvim_set_keymap('n', '<leader>cc', ':lua vim.cmd("Telescope colorscheme")<CR>', { noremap = true, desc = 'Select colorscheme' })

-- vim.api.nvim_set_keymap(
--   'n',
--   '<leader>cc',
--   ':lua require("telescope").extensions.colorscheme.select({ enable_preview = true })<CR>',
--   { noremap = true, desc = 'Select colorscheme (with preview)' }
-- )
-- -- Buffers

vim.api.nvim_set_keymap('n', '<TAB>', ':lua vim.cmd("bnext")<CR>', { noremap = true, silent = true, desc = 'go to next buffer' })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':lua vim.cmd("bprevious")<CR>', { noremap = true, silent = true, desc = 'go to previous buffer' })
vim.api.nvim_set_keymap('n', '<leader>x', ':lua vim.cmd("bdelete!")<CR>', { noremap = true, silent = true, desc = 'delete this buffer' })
vim.api.nvim_set_keymap('n', '<leader>bn', ':lua vim.cmd(" enew ")<CR>', { noremap = true, silent = true, desc = 'make a new buffer' })

vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'open diagnsotics in a float' })
--vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end,
--    {desc="open diagnostics in float"}
--)

-- Centered findings
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true, desc = 'centered half page down' })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true, desc = 'centered half page up' })
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true, silent = true, desc = 'find and center forward' })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true, silent = true, desc = 'find and center backward' })

-- windows
vim.api.nvim_set_keymap('n', '<leader>v', '<C-w>v', { noremap = true, silent = true, desc = 'split window vertically' })
vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>s', { noremap = true, silent = true, desc = 'split window horizontically' })
vim.api.nvim_set_keymap('n', '<leader>se', '<C-w>=', { noremap = true, silent = true, desc = 'make split windows equal in width and height' })
vim.api.nvim_set_keymap('n', '<leader>xs', ':lua vim.cmd("close")<CR>', { noremap = true, silent = true, desc = 'close current split window' })

-- Toggle line wrapping
vim.api.nvim_set_keymap('n', '<leader>lw', ':lua vim.cmd("set wrap!")<CR>', { noremap = true, silent = true, desc = 'toggle linewrapping' })

-- Stay in visual mode when indenting
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true, desc = 'indent left' })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true, desc = 'indent right' })

-- linuxdabbler

-- adjust split sizes easier
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize +2<CR>', { noremap = true, silent = true, desc = 'resize vsplit vertical +3' }) -- Control+Left resizes vertical split +
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize -2<CR>', { noremap = true, silent = true, desc = 'resize vsplit vertical -3' }) -- Control+Right resizes vertical split -

vim.api.nvim_set_keymap('n', '<C-Up>', ':horizontal resize +2<CR>', { noremap = true, silent = true, desc = 'resize split vertical +3' }) -- Control+Left resizes vertical split +
vim.api.nvim_set_keymap('n', '<C-Down>', ':horizontal resize -2<CR>', { noremap = true, silent = true, desc = 'resize split vertical -3' }) -- Control+Right resizes vertical split -

-- reload config
vim.api.nvim_set_keymap('n', '<leader>rl', ':source ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true, desc = 'reload config' }) -- reload neovim config

-- insert mode easy way to get back to normal mode from home row
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true, silent = true, desc = 'simulate ESC in insert mode' }) -- kj simulates ESC
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true, desc = 'simulate ESC in insert mode' }) -- jk simulates ESC

-- execute some lua or source the file from tj
vim.keymap.set('n', '<space>_x', '<cmd>source %<CR>', { noremap = true, silent = true, desc = 'source actual file' })
vim.keymap.set('n', '<space>x', ':.lua<CR>', { noremap = true, silent = true, desc = 'execute actual file' })
vim.keymap.set('v', '<space>x', ':lua<CR>', { noremap = true, silent = true, desc = 'execute actual file' })

-- tests (for present plugin)
vim.keymap.set('n', '<space>_t', '<cmd>PlenaryBustedFile %<CR>', { noremap = true, silent = true, desc = 'run tests on actual file' })

-- vim: ts=2 sts=2 sw=2 et
