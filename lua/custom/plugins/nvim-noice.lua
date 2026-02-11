return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lualine/lualine.nvim',
    -- "rcarriga/nvim-notify", -- optional
  },

  opts = {
    throttle = 1000 / 480,

    routes = {
      {
        view = 'notify',
        filter = { event = 'msg_showmode' },
      },
    },

    views = {
      cmdline_popup = {
        position = { row = 5, col = '50%' },
        size = { width = 60, height = 'auto' },
      },
      popupmenu = {
        relative = 'editor',
        position = { row = 8, col = '50%' },
        size = { width = 60, height = 10 },
        border = { style = 'rounded', padding = { 0, 1 } },
        win_options = {
          winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
        },
      },
    },

    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
    },

    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },

    popupmenu = {
      backend = 'leap',
      kind_icons = false,
    },

    cmdline = {
      format = {
        popupmenu = { view = 'popup' },
      },
    },
  },
}
