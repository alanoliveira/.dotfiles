return {
  { dir = "/home/alan/Repos/telescope-taglist", dependencies = { "nvim-telescope/telescope.nvim" }, config = true },
  { "nvim-telescope/telescope-fzf-native.nvim", dependencies = { "nvim-telescope/telescope.nvim" }, build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release" },
  { "nvim-telescope/telescope-symbols.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {
      defaults = {
        file_ignore_patterns = { "%.git/", "^tags$" },
      },
      pickers = {
        find_files = {
          hidden = true,
          previewer = false,
        },
        live_grep = {
          hidden = true,
          additional_args = { "--hidden" },
        },
        oldfiles = {
          only_cwd = true,
        },
        symbols = {
          sources = { "nerd", "emoji" },
        },
        buffers = {
          select_current = true,
          attach_mappings = function(_, map)
            map({ "i", "n" }, "<right>", require("telescope.actions").delete_buffer)
            return true
          end,
        },
      },
    },
    keys = {
      { "<leader>ft", "<cmd>Telescope find_files<cr>", desc = "find_files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "buffers" },
      { "<leader>fg", "<cmd>Telescope git_status<cr>", desc = "git status" },
      { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "old files" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "help tags" },
      { "<leader>ff", "<cmd>Telescope builtin<cr>", desc = "all pickers" },
      { "<leader>fr", "<cmd>Telescope live_grep<cr>", desc = "live grep args" },
      { "<leader>fc", "<cmd>Telescope taglist<cr>", desc = "taglist" },
      { "<C-s>", "<cmd>Telescope symbols<cr>", desc = "symbols", mode = "i" },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
    end,
  },
}
