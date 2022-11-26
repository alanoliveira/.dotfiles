local ls = require "luasnip"

ls.config.setup {}
ls.filetype_extend("ruby", { "rails" })

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-n>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-p>", function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-n>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

require("luasnip/loaders/from_vscode").lazy_load()