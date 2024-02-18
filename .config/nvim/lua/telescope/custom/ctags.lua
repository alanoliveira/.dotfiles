local actions = require("telescope.actions")
local action_state = require "telescope.actions.state"
local action_set = require "telescope.actions.set"
local previewers = require "telescope.previewers"
local conf = require("telescope.config").values
local finders = require "telescope.finders"
local entry_display = require "telescope.pickers.entry_display"
local pickers = require "telescope.pickers"
local utils = require "telescope.utils"

local displayer

local displayer_maker = function(items)
  local name_size = 1
  local scope_size = 1
  for _, item in ipairs(items) do
    name_size = #item.name > name_size and #item.name or name_size
    scope_size = #item.scope > scope_size and #item.scope or scope_size
  end

  return entry_display.create {
    separator = " ",
    items = {
      { width = 1 },
      { width = name_size },
      { width = scope_size },
      { remaining = true },
    },
  }
end

return function(opts)
  opts = opts or {}
  opts.search = opts.search or ".*"
  opts.layout_strategy = opts.layout_strategy or "vertical"

  local results = vim.iter(vim.fn.taglist(opts.search)):map(function(item)
    local scope =
        item.class or
        item.module or
        item.namespace or
        item.method or
        item.singletonMethod or
        item.mixin or ""

    return {
      kind = item.kind,
      name = item.name,
      scope = scope,
      scode = item.cmd:match("/^(.*)$?/"),
      filename = item.filename,
    }
  end):totable()

  if #results == 1 then
    opts.initial_mode = "normal"
  end

  displayer = displayer_maker(results)

  pickers
      .new(opts, {
        prompt_title = "ctags",
        finder = finders.new_table {
          results = results,
          entry_maker = function(item)
            return {
              filename = item.filename,
              ordinal = item.name .. " : " .. item.scope,
              scode = item.scode,
              display = function()
                local filepath, _ = utils.transform_path(opts, item.filename)
                return displayer {
                  { item.kind },
                  { item.name },
                  { item.scope },
                  { filepath },
                }
              end,
            }
          end,
        },
        previewer = previewers.ctags.new(opts),
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
        attach_mappings = function()
          action_set.select:enhance {
            post = function()
              local selection = action_state.get_selected_entry()
              if not selection then
                return
              end

              -- escape special characters
              local scode = selection.scode:gsub("[%]~*]", function(ch)
                return "\\" .. ch
              end)

              vim.cmd "keepjumps norm! gg"
              vim.fn.search(scode)
              vim.cmd "norm! zz"
            end,
          }
          return true
        end,
      })
      :find()
end
