local function buf_basename()
  return vim.fn.fnamemodify(vim.fn.bufname(), ":t:r")
end

local function camelize(s)
  if type(s) ~= "string" then
    return s
  end

  return s:gsub("_(%w)", function(c)
    return c:upper()
  end):gsub("^%l", string.upper)
end

return {
  s("concern", fmt([[
  module {1}
    extend ActiveSupport::Concern

    {2}
  end
    ]], {
    d(1, function()
      local concern_name = camelize(buf_basename()) or "Concern"
      return sn(nil, { i(1, concern_name) })
    end),
    i(2) })
  ),
}
