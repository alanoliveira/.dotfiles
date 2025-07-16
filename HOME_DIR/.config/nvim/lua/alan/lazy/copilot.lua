return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        filetypes = { ["*"] = false },
        suggestion = {
          enabled = true,
          auto_trigger = true,
        },
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = "CopilotChat",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {},
  },
}
