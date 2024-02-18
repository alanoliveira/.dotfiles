return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme catppuccin-macchiato")
    end,
  },

  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "williamboman/mason.nvim", config = true },
  { "kylechui/nvim-surround", config = true },
  { "tridactyl/vim-tridactyl" },
}
