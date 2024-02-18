local telescope = require("telescope")

return telescope.register_extension({
  exports = {
    ctags = require("telescope.custom.ctags"),
    bundle_gems = require("telescope.custom.bundle-gems"),
    rails_routes = require("telescope.custom.rails-routes"),
    lsp_tags = require("telescope.custom.lsp-tags"),
  },
})
