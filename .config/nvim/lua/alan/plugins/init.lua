return {
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "williamboman/mason.nvim", config = true },
  { "mbbill/undotree" },
  { "numToStr/Comment.nvim", config = true },
  { "kylechui/nvim-surround", config = true, module = "nvim-treesitter" },
  { "andymass/vim-matchup", init = function() vim.g.matchup_matchparen_offscreen = { method = "scrolloff" } end },
  { "folke/which-key.nvim", config = true },

  -- language specifc stuffs
  { "slim-template/vim-slim", ft = "slim" },
  { "ziglang/zig.vim", ft = "zig" },
  { "tridactyl/vim-tridactyl" },
}
