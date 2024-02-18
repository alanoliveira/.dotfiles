return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = { eruby = { "erb_lint" } }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      pattern = "*.erb",
      callback = function() lint.try_lint() end,
    })
  end,
}
