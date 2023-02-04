return { "nvim-neotest/neotest",
  keys = "<leader>t",
  dependencies = {
    "nvim-neotest/neotest-go",
    "olimorris/neotest-rspec",
    "nvim-neotest/neotest-plenary",
    "rouge8/neotest-rust",
  },
  config = function()
    local neotest = require("neotest");
    neotest.setup({
      discovery = {
        enabled = false,
      },
      adapters = {
        require("neotest-go"),
        require("neotest-rspec"),
        require("neotest-plenary"),
        require("neotest-rust"),
        require("neotest-rspec")({
          rspec_cmd = function()
            return vim.tbl_flatten({ "rspec" })
          end,
        }),
      },
    })

    vim.keymap.set("n", "<leader>tn", function() neotest.run.run() end, { desc = "[test] run nearest" })
    vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "[test] run file" })
    vim.keymap.set("n", "<leader>tl", function() neotest.run.run_last() end, { desc = "[test] run last" })
    vim.keymap.set("n", "<leader>tm", function() neotest.summary.run_marked() end, { desc = "[test] run marked" })
    vim.keymap.set("n", "<leader>to", function() neotest.output.open() end, { desc = "[test] show output" })
    vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end, { desc = "[test] show summary" })
  end,
}