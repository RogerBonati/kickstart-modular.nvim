return {
  'nvimtools/none-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local null_ls = require 'null-ls'

    local ansible_lint = {
      method = null_ls.methods.DIAGNOSTICS,
      filetypes = { 'yaml', 'yml', 'yaml.ansible' },
      generator = null_ls.generator {
        command = 'ansible-lint',
        args = { '--parseable', '-' }, -- "-" tells ansible-lint to read from stdin
        to_stdin = true,
        from_stderr = false,
        format = 'line',
        check_exit_code = function(code)
          return code <= 4
        end,
        on_output = function(line, params)
          -- ansible-lint parseable output: path:line: message
          local row, message = line:match ':(%d+):%s*(.*)'
          if row and message then
            return {
              row = tonumber(row),
              col = 1,
              message = message,
              severity = vim.diagnostic.severity.WARN,
              source = 'ansible-lint',
            }
          end
        end,
      },
    }

    null_ls.setup {
      sources = {
        ansible_lint,
      },
    }
  end,
}
