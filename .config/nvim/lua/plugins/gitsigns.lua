return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gs = require("gitsigns")
    gs.setup({
      current_line_blame = true,
      on_attach = function(bufnr)
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { desc = desc, buffer = bufnr })
        end

        map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<cr>", "stage hunk")
        map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<cr>", "reset hunk")
        map("n", "<leader>gS", gs.stage_buffer, "stage buffer")
        map("n", "<leader>gu", gs.undo_stage_hunk, "undo stage hunk")
        map("n", "<leader>gR", gs.reset_buffer, "reset buffer")
        map("n", "<leader>gp", gs.preview_hunk, "preview hunk")
        map("n", "<leader>gb", function() gs.blame_line { full = true } end, "blame line")
        map("n", "<leader>gtb", gs.toggle_current_line_blame, "toggle blame line")
        map("n", "<leader>gtd", gs.toggle_deleted, "toggle deleted")
        map("n", "[g", "<cmd>Gitsigns prev_hunk<cr>", "prev hunk")
        map("n", "]g", "<cmd>Gitsigns next_hunk<cr>", "next hunk")
      end,
    })
  end,
}
