return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "nvim-treesitter.configs".setup {
        auto_install = true,
        ensure_installed = { "markdown", "markdown_inline", "vimdoc" },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      max_lines = 4,
    },
  },
}
