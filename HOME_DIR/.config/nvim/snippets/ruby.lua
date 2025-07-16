local str_helper = require("alan.helpers.string")

local function buf_basename()
  return vim.fn.fnamemodify(vim.fn.bufname(), ":t:r")
end

return {
  s("concern", fmt([[
  module {1}
    extend ActiveSupport::Concern

    {2}
  end
    ]], {
    d(1, function()
      local concern_name = str_helper.camelize(buf_basename()) or "Concern"
      return sn(nil, { i(1, concern_name) })
    end),
    i(2) })
  ),
}
