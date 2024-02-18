vim.keymap.set("n", "gd", function()
  local opts = {}
  opts.search = "^" .. vim.fn.expand("<cword>") .. "$"
  opts.layout_strategy = "vertical"
  opts.path_display = { truncate = true, filename_first = { reverse_directories = true } }
  require("telescope.custom.ctags")(opts)
end, { desc = "ctags", buffer = true })
