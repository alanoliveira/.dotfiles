local lspconfig = require("lspconfig")

return {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentHighlightProvider = false
    lspconfig.util.default_config.on_attach(client, bufnr)
  end,
}
