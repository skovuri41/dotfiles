local layouts = {}

local log = hs.logger.new('layouts', 'debug')

local layout = require "layout"

-- Each layout is a table describing the desired layout.
-- See: http://www.hammerspoon.org/docs/hs.layout.html#apply
layouts.work = {}
layouts.home = {}
layouts.solo = {
  {"Messages", nil, nil, layout.topRightQuad, nil, nil},
  {"iTerm2", nil, nil, layout.bottomRightQuad, nil, nil},
  {"Google Chrome", nil, nil, layout.left50, nil, nil}
}

return layouts
