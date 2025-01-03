local function set_default_keymaps(client)
  local function try_map(method, lhs, rhs, opts)
    opts = opts or {}
    opts.buffer = true
    if client.supports_method(method) then
      local mode = opts.mode or "n"
      vim.keymap.set(mode, lhs, rhs, opts)
    end
  end

  try_map("textDocument/definition", "gd",         vim.lsp.buf.definition, { desc = "[lsp] goto definition" })
  try_map("textDocument/formatting", "<leader>cf", vim.lsp.buf.format, { desc = "[lsp] code format" })
  try_map("textDocument/hover",      "K",          vim.lsp.buf.hover, { desc = "[lsp] hover" })
  try_map("textDocument/codeAction", "<leader>ca", vim.lsp.buf.code_action, { desc = "[lsp] code action" })
end

local function enable_highligh_on_hold(client, bufnr)
  if not client.server_capabilities.documentHighlightProvider then
    return
  end

  local gid = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
  vim.api.nvim_create_autocmd("CursorHold", {
    group = gid,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.document_highlight()
    end,
  })

  vim.api.nvim_create_autocmd("CursorMoved", {
    group = gid,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.clear_references()
    end,
  })
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "folke/neodev.nvim", config = true },
    { "j-hui/fidget.nvim", config = true },
    { "williamboman/mason-lspconfig.nvim", config = true },
  },
  config = function()
    local lspcfg = require("lspconfig")
    local mason = require("mason-lspconfig")

    lspcfg.util.default_config = vim.tbl_extend("force", lspcfg.util.default_config, {
      autostart = true,
      default_capabilities = require("cmp_nvim_lsp").default_capabilities(),
      on_attach = function(client, bufnr)
        set_default_keymaps(client)
        enable_highligh_on_hold(client, bufnr)
      end,
    })

    local lsp_servers = mason.get_installed_servers()
    table.insert(lsp_servers, "rubocop")
    for _, server_name in ipairs(lsp_servers) do
      local ok, server_conf = pcall(function()
        return require("alan.lsp_config." .. server_name)
      end)
      if not ok then
        server_conf = {}
      end
      lspcfg[server_name].setup(server_conf)
    end
  end,
}
