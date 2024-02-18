local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local finders = require "telescope.finders"
local entry_display = require "telescope.pickers.entry_display"
local pickers = require "telescope.pickers"
local tscope_utils = require "telescope.utils"
local conf = require("telescope.config").values

local function gem_path_parser(gem_path)
  local ruby_version, gem_name, gem_version =
      gem_path:match("ruby/([^/]+)/.*/gems/([^/]+)-([^/]+)")
  return {
    path = gem_path,
    gem_name = gem_name,
    gem_version = gem_version,
    ruby_version = ruby_version
  }
end

return function(opts)
  opts = opts or {}

  local displayer = entry_display.create {
    separator = " ",
    items = {
      { width = 20 },
      { width = 13 },
      { width = 13 },
      { remaining = true },
    },
  }

  pickers
      .new(opts, {
        prompt_title = "bundle gems",
        finder = finders.new_oneshot_job({
          "bundle",
          "list",
          "--paths" }, {
          entry_maker = function(line)
            local gem_info = gem_path_parser(line)
            return {
              value = line,
              ordinal = gem_info.gem_name,
              display = displayer {
                { gem_info.gem_name },
                { gem_info.gem_version },
                { gem_info.ruby_version },
                { line },
              },
            }
          end,
        }),
        previewer = false,
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr)
          actions.select_default:replace(function()
            local selection = action_state.get_selected_entry()
            if selection == nil then
              tscope_utils.__warn_no_selection "telescope.custom.bundle_gems"
              return
            end
            actions.close(prompt_bufnr)
            vim.cmd("tabnew +enew | tcd " .. selection.value .. " | setlocal buftype=nofile bufhidden=hide")
          end)
          return true
        end,
      })
      :find()
end
