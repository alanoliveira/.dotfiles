vim.cmd("colorscheme catppuccin-macchiato")

vim.fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignWarn",  { texthl = "DiagnosticSignWarn",  text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignHint",  { texthl = "DiagnosticSignHint",  text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignInfo",  { texthl = "DiagnosticSignInfo",  text = "", numhl = "" })

vim.api.nvim_create_autocmd("TextYankPost", { pattern = "*", command = "lua require('vim.highlight').on_yank()" })

vim.on_key(function(char)
  if vim.fn.mode() == "n" then
    local keys = { "n", "N", "*", "#", "<CR>", "/", "?" }
    local new_hlsearch = vim.tbl_contains(keys, vim.fn.keytrans(char))

    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end)

local ok, notify = pcall(require, "notify")
if ok then
  vim.notify = notify
end
