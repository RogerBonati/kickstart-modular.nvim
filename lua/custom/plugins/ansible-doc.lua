return {
  'salorak/ansible-doc.nvim',
  dependencies = {
    'ibhagwan/fzf-lua',
    'nvim-lua/plenary.nvim',
  },
  opts = {
    -- ansible-doc configuration goes here.
    -- See configuration section below.
    --
    ---- Buffer options
    buffer_opts = {
      -- Options passed to nvim_create_buf directly
      -- see :help nvim_create_buf
      listed = true,
      scratch = true,
    },

    -- Options to pass directly to `fzf-lua`
    fzf_opts = {
      prompt = 'Ansible modules > ',
    },

    -- Configuration for sections presence and ordering
    -- The following is the complete list of options.
    -- Comment them out and move them to structure the documentation page as you please.
    docs_structure = {
      'author',
      'attributes',
      'examples',
      'notes',
      'options',
      'return',
    },

    -- Path to file containing errors when testing
    errors_path = '/tmp/ansible-doc.errors.txt',
  },
}
