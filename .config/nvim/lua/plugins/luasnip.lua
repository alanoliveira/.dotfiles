-- snippets
return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    local ls = require "luasnip"
    ls.config.setup {}

    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })

    vim.keymap.set({ "s" }, "<C-h>", "<C-o>s", { silent = true })

    local snippets_path = vim.fn.stdpath("config") .. "/lua/snippets"
    require("luasnip.loaders.from_lua").lazy_load({ paths = { snippets_path } })
    require("luasnip.loaders.from_vscode").load()

    vim.api.nvim_create_user_command(
      "LuaSnipEdit",
      require("luasnip.loaders").edit_snippet_files,
      {}
    )
  end,
}
