local Provider = {}
Provider.__index = Provider

function Provider.new()
  return setmetatable({}, Provider)
end

function Provider:get_items(ctx, callback)
  local ok, obsidian = pcall(require, 'obsidian')
  if not ok or not obsidian.completion then
    return callback {}
  end

  obsidian.completion(ctx, function(items)
    for _, item in ipairs(items) do
      item.label = item.text
      item.insertText = item.text
    end
    callback(items)
  end)
end

return Provider
