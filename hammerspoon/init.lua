-- Load extensions
window = require "hs.window"
hotkey = require "hs.hotkey"
keycodes = require "hs.keycodes"
alert = require "hs.alert"
screen = require "hs.screen"
grid = require "hs.grid"
appfinder = require "hs.appfinder"

 
-- Load custom modules
require "preload"
require "grid"
require "utils"


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
  left = gridset(goLeft),
  right = gridset(goRight),
  up = gridset(goUp),
  down = gridset(goDown),

  -- grid move
  h = grid.pushWindowLeft,
  j = grid.pushWindowDown,
  l = grid.pushWindowRight,
  k = grid.pushWindowUp,

  -- grid resize
  ["="] = grid.resizeWindowTaller,
  ["-"] = grid.resizeWindowShorter,
  ["["] = grid.resizeWindowThinner,
  ["]"] = grid.resizeWindowWider,

  -- grid maximize
  m = grid.maximizeWindow,

  -- grid snap
  n = function() grid.snap(window.focusedWindow()) end
}

init()
