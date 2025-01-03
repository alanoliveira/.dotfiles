local M = {}

function M.camelize(s)
  if type(s) ~= "string" then
    return s
  end

  return s:gsub("_(%w)", function(c)
    return c:upper()
  end):gsub("^%l", string.upper)
end

return M
