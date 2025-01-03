P = function(v)
  print(vim.inspect(v))
end

R = function(name)
  require("plenary.reload").reload_module(name)
end

