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
require "ssid"


function init()
  -- Bind hotkeys
  createBindings()
  alert.show("Config loaded", 1)
end

-- Define hotkeys
bind = hs.hotkey.bind
function createBindings()

  --
  -- Window management
  --

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


  --
  -- Music management
  --

  -- play/pause spotify
  bind(hyper, 'p', hs.spotify.playpause)
  bind(hyper, 't', hs.spotify.displayCurrentTrack)


  --
  -- Application management
  --

  -- Launch or focus various apps
  bind(ctrl, '2', function() hs.application.launchOrFocus('iTerm') end)
  bind(ctrl, '3', function() hs.application.launchOrFocus('Google Chrome') end)

  -- focus last iterm window
  -- TODO: Make this work once app watchers are sorted out
  -- bind(hyper, 'i', function(){})

  -- test new functions (defined in utils)
  bind(hyper, '`', test)

end

init()
