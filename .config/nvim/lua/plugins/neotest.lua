return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "olimorris/neotest-rspec",
    "nvim-neotest/neotest-plenary",
    "zidhuss/neotest-minitest",
  },
  keys = "<Leader>t",
  config = function()
    local neotest = require("neotest")

    neotest.setup({
      adapters = {
        require("neotest-rspec"),
        require("neotest-plenary"),
        require("neotest-minitest"),
      },
    })

    vim.keymap.set("n", "<leader>tt", neotest.run.run, { desc = "Test nearest" })
    vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Test file" })
    vim.keymap.set("n", "<leader>tp", neotest.summary.toggle, { desc = "Toggle test summary" })
    vim.keymap.set("n", "<leader>tm", neotest.summary.run_marked, { desc = "Run marked tests" })
  end,
}
