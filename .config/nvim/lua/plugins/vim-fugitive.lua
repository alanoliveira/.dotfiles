return {
  "tpope/vim-fugitive",
  init = function()
    vim.keymap.set("n", "<leader>gg", "<cmd>Git<cr>", { desc = "[fugitive] git" })
    vim.keymap.set("n", "<leader>gD", "<cmd>Gvdiffsplit!<cr>", { desc = "[fugitive] diff split" })
    vim.keymap.set("n", "<leader>g>", function()
      vim.cmd("diffget //2")
      vim.cmd("diffupdate")
    end, { desc = "get from left" })
    vim.keymap.set("n", "<leader>g<", function()
      vim.cmd("diffget //3")
      vim.cmd("diffupdate")
    end, { desc = "get from right" })
  end,
}
