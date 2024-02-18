return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-live-grep-args.nvim" },
    { "nvim-telescope/telescope-symbols.nvim" },
  },
  config = function()
    local telescope = require("telescope");
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        file_ignore_patterns = { "%.git/" },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          previewer = false,
        },
        builtin = {
          include_extensions = true,
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
            map("i", "<right>", actions.delete_buffer)
            return true
          end,
        },
      },
    })

    telescope.load_extension("custom")

    local builtin = require("telescope.builtin")
    local extensions = require("telescope").extensions
    local map = vim.keymap.set
    map("n", "<leader>ft", builtin.find_files, { desc = "find_files" })
    map("n", "<leader>fb", builtin.buffers, { desc = "buffers" })
    map("n", "<leader>fg", builtin.git_status, { desc = "git status" })
    map("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "document symbols" })
    map("i", "<C-s>", builtin.symbols, { desc = "symbols" })
    map("n", "<leader>fd", builtin.diagnostics, { desc = "diagnostics" })
    map("n", "<leader>fo", builtin.oldfiles, { desc = "old files" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "help tags" })
    map("n", "<leader>ff", builtin.builtin, { desc = "all pickers" })
    map("n", "<leader>fr", builtin.live_grep, { desc = "live grep args" })
    map("n", "<leader>fc", extensions.custom.ctags, { desc = "ctags" })
  end,
}
