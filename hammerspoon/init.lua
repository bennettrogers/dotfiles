-- Load extensions
window = require "hs.window"
hotkey = require "hs.hotkey"
keycodes = require "hs.keycodes"
alert = require "hs.alert"
screen = require "hs.screen"
grid = require "hs.grid"
appfinder = require "hs.appfinder"

-- Uncomment to set non-default log level
-- hs.logger.defaultLogLevel = 'debug'

logger = hs.logger.new('main')


-- Load custom modules
require "preload"
require "utils"
require "music"
require "grid"


function init()
  -- Bind hotkeys
  createBindings()
  alert.show("Config loaded", 1)
end

-- Define hotkeys
bind = hs.hotkey.bind
function createBindings()

  -- grid push
  bind(hyper, 'h', gridset(goLeft))
  bind(hyper, 'j', gridset(goDown))
  bind(hyper, 'l', gridset(goRight))
  bind(hyper, 'k', gridset(goUp))
  bind(hyper, 'y', gridset(goTopLeft))
  bind(hyper, 'u', gridset(goTopRight))
  bind(hyper, 'b', gridset(goBottomLeft))
  bind(hyper, 'n', gridset(goBottomRight))

  -- grid move
  bind(hyper, 'left', grid.pushWindowLeft)
  bind(hyper, 'down', grid.pushWindowDown)
  bind(hyper, 'right', grid.pushWindowRight)
  bind(hyper, 'up', grid.pushWindowUp)

  -- grid resize
  bind(hyper, '=', grid.resizeWindowTaller)
  bind(hyper, '-', grid.resizeWindowShorter)
  bind(hyper, '[', grid.resizeWindowThinner)
  bind(hyper, ']', grid.resizeWindowWider)

  -- grid maximize
  bind(hyper, 'm', grid.maximizeWindow)

  -- test new functions (defined in utils)
  bind(hyper, '`', test)

end

init()
