return {
  "mbbill/undotree",
  init = function()
    vim.keymap.set("n", "<leader>u", function() vim.cmd("UndotreeToggle") end, { desc = "undotree toggle" })
  end,
}
