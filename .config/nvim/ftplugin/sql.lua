local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set({ "n", "i" }, "<F4>", function()
  local node = vim.treesitter.get_node({ bufnr = bufnr })
  while node ~= nil and node:type() ~= "statement" do
    node = node:parent()
  end

  if node == nil then
    vim.notify("No statement found under cursor", "warn")
    return
  end

  local stmt = vim.treesitter.get_node_text(node, bufnr);
  vim.fn.execute("DB " .. stmt)
end, { desc = "Run statement under cursor", buffer = true })

vim.keymap.set("v", "<F4>", "<Cmd>'<,'> DB<CR>", { desc = "Run selected statements", buffer = true })
