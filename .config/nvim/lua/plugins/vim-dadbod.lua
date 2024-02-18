return {
  {
    "tpope/vim-dadbod",
    lazy = true,
    ft = "sql",
  },
  { "kristijanhusak/vim-dadbod-ui" },
  {
    "kristijanhusak/vim-dadbod-completion",
    cond = os.getenv("DISABLE_DADBOD_COMPLETION") ~= "1",
    config = function()
      require("cmp").setup.filetype({ "sql" }, {
        sources = {
          { name = "vim-dadbod-completion" },
        },
      })
    end,
  },
}
