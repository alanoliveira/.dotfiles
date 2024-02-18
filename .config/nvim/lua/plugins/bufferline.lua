return {
  "akinsho/bufferline.nvim",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        indicator = {
          style = "none",
        },
        -- always_show_bufferline = false,
        -- name_formatter = function(buffer)
        --   if #vim.fn.gettabinfo(buffer.tabnr) == 0 then
        --     return "?"
        --   end
        --   return vim.fn.fnamemodify(vim.fn.getcwd(-1, buffer.tabnr), ":t")
        -- end,
      },
    })
  end,
}
