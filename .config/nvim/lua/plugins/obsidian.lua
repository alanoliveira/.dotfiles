return {
  "epwalsh/obsidian.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    workspaces = {
      {
        name = "wiki",
        path = os.getenv("CLOUD_DIR") .. "/wiki",
      },
    },
  },
  init = function()
    vim.opt.conceallevel = 2
  end,
}
