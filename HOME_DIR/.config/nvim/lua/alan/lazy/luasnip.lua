-- snippets
return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  build = "make install_jsregexp",
  keys = function()
    local ls = require "luasnip"
    return {
      {
        "<C-k>",
        function()
          if ls.expand_or_jumpable() then ls.expand_or_jump() end
        end,
        silent = true,
        mode = { "i", "s" },
      },
      {
        "<C-j>",
        function()
          if ls.jumpable(-1) then ls.jump(-1) end
        end,
        silent = true,
        mode = { "i", "s" },
      },
    }
  end,
  config = function()
    require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets" } })
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
