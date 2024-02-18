local cwd = vim.fn.getcwd()
local project_conf = cwd .. "/.nvim_conf.local"

if vim.fn.filereadable(project_conf) == 0 then
  return
end

if os.getenv("PROJECT_CONF") == cwd then
  vim.cmd.luafile(project_conf)
else
  vim.notify("Project configuration file found but PROJECT_CONF is not set to the current working directory", vim.log.levels.WARN)
end
