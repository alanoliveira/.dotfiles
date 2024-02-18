return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    { "nvim-tree/nvim-web-devicons", optional = true },
  },
  config = function()
    require("neo-tree").setup({
      event_handlers = {
        {
          event = "neo_tree_popup_input_ready",
          handler = function()
            vim.api.nvim_buf_del_keymap(0, "i", "<Esc>")
          end,
        },
      },
      filesystem = {
        use_libuv_file_watcher = true,
        bind_to_cwd = false, -- if cwd of neo-tree should be bind to system cwd
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        window = {
          mappings = {
            ["-"] = "navigate_up",
            ["<C-b>"] = false,
            ["<bs>"] = {
              function()
                require("neo-tree.command").execute({
                  dir = vim.fn.getenv("PWD"),
                })
              end,
              desc = "goto shell CWD",
            },
          },
        },
      },
    })
    vim.keymap.set("n", "<C-b>", function()
      local is_ruby_gem = function(path)
        if string.match(path, "/gems/") == nil then return false end
        local gemdir = vim.fn.system("gem environment gemdir 2> /dev/null"):sub(1, -2)
        return require("neo-tree.utils").is_subpath(gemdir, path)
      end

      local belongs_to_cwd = function(path)
        return require("neo-tree.utils").is_subpath(vim.fn.getcwd(), path)
      end

      local reveal_file = vim.fn.expand("%:p")
      local dir
      if reveal_file == "" or belongs_to_cwd(reveal_file) then
        dir = vim.fn.getcwd()
      elseif is_ruby_gem(reveal_file) then
        dir = vim.fs.root(reveal_file, { "README.md", "README.rdoc", "tags" })
      elseif require("neo-tree.utils").is_subpath(vim.fn.expand("~"), reveal_file) then
        dir = vim.fn.expand("~")
      end

      require("neo-tree.command").execute({
        dir = dir,
        reveal = true,
        reveal_force_cwd = true,
        toggle = true,
      })
    end, { desc = "toggle nvim tree" })
  end,
}
