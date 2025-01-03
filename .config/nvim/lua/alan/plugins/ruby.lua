local M = {}

local function register_gem_tags()
  vim.system({ "bundle", "list", "--paths" }, { text = true }, function(data)
    vim.schedule(function()
      for gem_path in vim.gsplit(data.stdout, "\n") do
        vim.opt.tags:append(vim.fs.joinpath(gem_path, "tags"))
      end
    end)
  end)
end

local function set_gem_dir()
  vim.system({ "gem", "environment", "gemdir" }, { text = true }, function(data)
    M._gemdir = data.stdout:sub(1, -2)
  end)
end


M.gemdir = function()
  return M._gemdir
end

M.setup = function()
  if vim.fn.executable("bundle") == 0 or vim.fn.glob("Gemfile") == "" then
    return
  end
  register_gem_tags()
  set_gem_dir()
end

return M
