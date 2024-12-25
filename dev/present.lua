local M = {}
-- print 'loaded present.lua, zefix!'
M.setup = function()

  -- nothing yet
end

local function create_floating_window(opts)
  opts = opts or {}
  -- local width = opts.width or math.floor(vim.o.columns * 0.8)
  -- local height = opts.height or math.floor(vim.o.lines * 0.8)
  local width = opts.width or vim.o.columns
  local height = opts.height or vim.o.lines

  -- Calculate the position to center the window
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- Create a buffer
  local buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer

  -- Define window configuration
  local win_config = {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal', -- No borders or extra UI elements
    -- border = 'rounded',
    border = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
  }
  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

--- Take some lines and parse them
---@class present.Slides
---@field slides present.Slide[]: The slides of the file
---@class present.Slide
---@field title string: the title of the file

---@param lines string[]: The lines in the buffer
---@return present.Slides

local parse_slides = function(lines)
  local slides = { slides = {} }
  local current_slide = {
    title = '',
    body = {},
  }
  local separator = '^#'
  for _, line in ipairs(lines) do
    print(line, 'find:', line:find(separator), '|')
    if line:find(separator) then
      if #current_slide.title > 0 then
        table.insert(slides.slides, current_slide)
      end
      current_slide = {
        title = line,
        body = {},
      }
    else
      table.insert(current_slide.body, line)
    end
  end
  table.insert(slides.slides, current_slide)
  return slides
end
M.start_presentation = function(opts)
  opts = opts or {}
  opts.bufnr = opts.bufnr or 0
  local lines = vim.api.nvim_buf_get_lines(opts.bufnr, 0, -1, false)
  local parsed = parse_slides(lines)
  local float = create_floating_window(opts)

  local set_slide_content = function(idx)
    vim.api.nvim_buf_set_lines(float.buf, 0, -q, false, parsed.slides[idx].body)
  end

  local current_slide = 1

  vim.keymap.set('n', 'n', function()
    current_slide = math.min(current_slide + 1, #parsed.slides)
    set_slide_content(current_slide)
    vim.api.nvim_buf_set_lines(float.buf, 0, -1, false, parsed.slides[current_slide].body)
  end, { buffer = float.buf })

  vim.keymap.set('n', 'p', function()
    current_slide = math.max(current_slide - 1, 1)
    set_slide_content(current_slide)
  end, { buffer = float.buf })

  vim.keymap.set('n', 'q', function()
    current_slide = math.max(current_slide - 1, 1)
    vim.api.nvim_win_close(float.win, true)
  end, { buffer = float.buf })

  local restore = {
    cmdheight = {
      original = vim.o.cmdheight,
      present = 0,
    },
  }
  -- set the options we want during the presentation
  for option, config in ipairs(restore) do
    vim.opt[option] = config.present
  end

  vim.api.nvim_create_autocmd('BufLeave', {
    buffer = float.buf,
    callback = function()
      -- reset the values when we are done with the presentation
      for option, config in ipairs(restore) do
        vim.opt[option] = config.original
      end
    end,
  })
  -- vim.api.nvim_buf_set_lines(float.buf, 0, -1, false, parsed.slides[1])
  set_slide_content(current_slide)
  -- vim.print(parse_slides {
  --   '# Hello',
  --   'This is something else',
  --   '# World',
  --   'this is again different',
  -- })
end
M.start_presentation { bufnr = 15 }

return M
