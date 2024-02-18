return {
  "rcarriga/nvim-notify",
  opts = {
    render = "wrapped-compact",
    max_width = 70,
  },
  init = function()
    vim.notify = require("notify")
  end
}
