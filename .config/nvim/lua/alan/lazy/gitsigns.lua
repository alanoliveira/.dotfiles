return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  keys = {
    { "<leader>gs", ":Gitsigns stage_hunk<cr>", desc = "stage hunk" },
    { "<leader>gr", ":Gitsigns reset_hunk<cr>", desc = "reset hunk" },
    { "<leader>gu", ":Gitsigns unso_stage_hunk<cr>", desc = "undo stage hunk" },
  },
  config = true,
}
