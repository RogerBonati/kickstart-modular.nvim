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

local group = vim.api.nvim_create_augroup('Format', { clear = true })

-- linting
vim.api.nvim_create_autocmd('BufWritePre', {
  group = group,
  pattern = '*.yaml,*.yml',
  callback = function()
    vim.cmd '%s/\\s\\+$//e'
  end,
})

-- Automatically clear the undo directory on exit
vim.cmd [[
 autocmd VimLeave * silent! call delete(expand('&undodir'), 'rf')
]]
