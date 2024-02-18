return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    { "nvim-treesitter/playground" },
    {
      "nvim-treesitter/nvim-treesitter-context",
      opts = {
        max_lines = 4,
      },
    },
  },
  config = function()
    require "nvim-treesitter.configs".setup {
      auto_install = true,
      ensure_installed = { "markdown", "markdown_inline", "vimdoc" },
      highlight = {
        enable = true,
      },
      playground = {
        enable = true,
      },
      matchup = {
        enable = true,
      },
    }
    require("treesitter-context").setup()
  end,
}
