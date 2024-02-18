return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  dependencies = {
    { "zbirenbaum/copilot-cmp", enabled = false },
  },
  config = function()
    vim.api.nvim_command("highlight CopilotSuggestion guifg=#736b64 guibg=#d8d4d1 guisp=#233f94")
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
          accept_word = "<M-w>",
          accept_line = "<M-l>",
          dismiss = "/",
        },
      },
      filetypes = {
        yaml = true,
        markdown = true,
        gitcommit = true,
        gitrebase = true,
        hgcommit = true,
      },
    })

    vim.keymap.set({ "n", "i" }, "<F12>", function()
      if require("copilot.client").is_disabled() then
        require("copilot.command").enable()
      else
        require("copilot.command").disable()
      end
    end)
  end,
}
