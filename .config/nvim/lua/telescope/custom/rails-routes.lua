local finders = require "telescope.finders"
local entry_display = require "telescope.pickers.entry_display"
local pickers = require "telescope.pickers"
local conf = require("telescope.config").values

local function rails_route_parser(route)
  local chunks = vim.split(route, "%s+")
  local anchor = 2
  if #chunks == 4 then
    anchor = 1
  end
  return {
    prefix = chunks[anchor],
    method = chunks[anchor + 1],
    path = chunks[anchor + 2],
    action = chunks[anchor + 3]
  }
end

return function(opts)
  opts = opts or {}
  local is_header = true

  local displayer = entry_display.create {
    separator = " ",
    items = {
      { width = 3 },
      { width = 20 },
      { width = 30 },
      { remaining = true },
    },
  }

  pickers
      .new(opts, {
        prompt_title = "rails routes",
        finder = finders.new_oneshot_job({
          "rails",
          "routes" }, {
          entry_maker = function(line)
            if is_header then
              is_header = false
              return
            end

            local route = rails_route_parser(line)
            return {
              value = line,
              ordinal = route.method .. " " .. route.path,
              display = displayer {
                { route.method:sub(1, 3) },
                { route.prefix },
                { route.action },
                { route.path },
              },
            }
          end,
        }),
        previewer = false,
        sorter = conf.generic_sorter(opts),
      })
      :find()
end
