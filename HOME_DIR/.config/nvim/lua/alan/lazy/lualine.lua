return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      refresh = {
        statusline = 500,
      },
    },
    sections = {
      lualine_a = {
        "mode",
        {
          color = { bg = "red" },
          function()
            local regrec = vim.fn.reg_recording()
            if #regrec > 0 then
              return "@" .. regrec
            end
            return ""
          end,
        },
      },
      lualine_c = {
        {
          "filename",
          path = 1,
        },
      },
      lualine_x = {
        {
          function()
            local clients = package.loaded["copilot"] and vim.lsp.get_clients({ name = "copilot", bufnr = 0 }) or {}
            if #clients > 0 then
              return " "
            end
            return " "
          end,
        },
        "encoding",
        "fileformat",
        "filetype",
      },
    },
  },
}
