local conf = require("telescope.config").values
local finders = require "telescope.finders"
local pickers = require "telescope.pickers"
local make_entry = require "telescope.make_entry"
local actions = require("telescope.actions")

return function(list)
  local opts = {
    layout_strategy = "vertical",
    path_display = { "smart" },
  }

  if #list == 1 then
    opts.initial_mode = "normal"
  end

  pickers
      .new(opts, {
        prompt_title = list.title,
        finder = finders.new_table {
          results = list.items,
          entry_maker = make_entry.gen_from_quickfix(opts),
        },
        previewer = conf.qflist_previewer(opts),
        sorter = conf.generic_sorter(opts),
        on_complete = {
          function(picker)
            -- remove this on_complete callback
            -- otherwise it will trigger when filtering
            picker:clear_completion_callbacks()

            if picker.manager.linked_states.size == 1 then
              actions.select_default(picker.prompt_bufnr)
            end
          end,
        },
      })
      :find()
end
