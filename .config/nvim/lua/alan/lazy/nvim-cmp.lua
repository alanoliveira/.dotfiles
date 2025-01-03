local ctags_source = {
  is_available = function(_)
    return #vim.fn.tagfiles() > 0
  end,
  complete = function(_, params, callback)
    local input = string.sub(params.context.cursor_before_line, params.offset)
    local results = vim.fn.getcompletion(input, "tag")
    local tags = {}
    for _, tag in ipairs(results) do
      tags[#tags + 1] = { label = tag }
    end
    callback(tags)
  end,
}

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "onsails/lspkind.nvim" },
  },
  config = function()
    local cmp = require("cmp")

    cmp.register_source("tags", ctags_source)

    cmp.setup {
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer", keyword_length = 3 },
        { name = "path" },
        { name = "tags", keyword_length = 3 },
      }),

      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-e>"] = cmp.mapping.abort(),
      }),

      formatting = {
        format = require("lspkind").cmp_format {
          menu = {
            ["nvim_lsp"] = "[LSP]",
            ["buffer"] = "[BUF]",
            ["path"] = "[PATH]",
            ["luasnip"] = "[SNIP]",
            ["tags"] = "[TAG]",
            ["vim-dadbod-completion"] = "[DB]",
          },
        },
      },
    }
  end,
}
