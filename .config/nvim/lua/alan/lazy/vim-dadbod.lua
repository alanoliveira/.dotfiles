local function execute_stmt_under_cursor()
  local bufnr = vim.api.nvim_get_current_buf()
  local node = vim.treesitter.get_node({ bufnr = bufnr })
  while node ~= nil and node:type() ~= "statement" do
    node = node:parent()
  end

  if node == nil then
    vim.notify("No statement found under cursor", "warn")
    return
  end

  local stmt = vim.treesitter.get_node_text(node, bufnr);
  vim.fn.execute("DB " .. stmt)
end

return {
  { "kristijanhusak/vim-dadbod-ui", dependencies = { "tpope/vim-dadbod" } },
  {
    "kristijanhusak/vim-dadbod-completion",
    dependencies = { "tpope/vim-dadbod" },
    cond = os.getenv("DISABLE_DADBOD_COMPLETION") ~= "1",
    config = function()
      require("cmp").setup.filetype({ "sql" }, {
        sources = {
          { name = "vim-dadbod-completion" },
        },
      })
    end,
  },
  {
    "tpope/vim-dadbod",
    lazy = true,
    ft = "sql",
    keys = {
      { "<F4>", execute_stmt_under_cursor, buffer = true, ft = "sql" },
      { "<F4>", ":'<,'> DB<cr>", desc = "Run selected statements", mode = "v", ft = "sql" },
    },
  },
}
