local function toggle_reveal()
  local is_ruby_gem = function(path)
    if string.match(path, "/gems/") == nil then return false end
    local data = vim.system({ "gem", "environment", "gemdir" }, { text = true }):wait()
    local gemdir = data.stdout:sub(1, -2)
    return require("neo-tree.utils").is_subpath(gemdir, path)
  end

  local reveal_file = vim.fn.expand("%:p")
  local dir
  if is_ruby_gem(reveal_file) then
    dir = vim.fs.root(reveal_file, { "README.md", "README.rdoc", "tags" })
  end

  require("neo-tree.command").execute({
    reveal_file = reveal_file,
    dir = dir,
    reveal_force_cwd = true,
    toggle = true,
  })
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    { "nvim-tree/nvim-web-devicons", optional = true },
  },
  keys = {
    { "<C-b>", toggle_reveal, desc = "NeoTree" },
  },
  opts = {
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
      bind_to_cwd = false,
      follow_current_file = {
        enabled = true,
      },
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      window = {
        mappings = {
          ["-"] = "navigate_up",
          ["<C-b>"] = false,
          ["q"] = false,
        },
      },
    },
  },
}
