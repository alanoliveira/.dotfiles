return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", optional = true },
  keys = {
    {
      "<leader>ct", function() require("trouble").open("diagnostics") end,
    },
  },
}
