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
  createHotkeys()
  -- If we hook up a keyboard, rebind keys
  keycodes.inputSourceChanged(rebindHotkeys)

  alert.show("Config loaded", 1)
end

-- Define hotkey functionality
definitions = {

  -- grid push
  h = gridset(goLeft),
  j = gridset(goDown),
  l = gridset(goRight),
  k = gridset(goUp),
  y = gridset(goTopLeft),
  u = gridset(goTopRight),
  b = gridset(goBottomleft),
  n = gridset(goBottomRight),

  -- grid move
  left  = grid.pushWindowLeft,
  down  = grid.pushWindowDown,
  right = grid.pushWindowRight,
  up    = grid.pushWindowUp,

  -- grid resize
  ["="] = grid.resizeWindowTaller,
  ["-"] = grid.resizeWindowShorter,
  ["["] = grid.resizeWindowThinner,
  ["]"] = grid.resizeWindowWider,

  -- grid maximize
  m = grid.maximizeWindow,

  -- test new functions (from utils)
  ["`"] = test,

}

init()
