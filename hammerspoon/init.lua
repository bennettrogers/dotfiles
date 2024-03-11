-- Load extensions
local alert = require "hs.alert"

-- Uncomment to set non-default log level
-- hs.logger.defaultLogLevel = 'debug'

logger = hs.logger.new('main')

-- Load custom modules
require "preload"
require "utils"
require "layouts"
require "bindings"
require "music"
require "ssid"

-- Load spoons
hs.loadSpoon("MiroWindowsManager")

-- hs.window.animationDuration = 0.05
spoon.MiroWindowsManager.middleScreenSizes = {3, 2, 3/2, 1}
spoon.MiroWindowsManager:bindHotkeys({
    up = {hyper, "k"},
    right = {hyper, "l"},
    down = {hyper, "j"},
    left = {hyper, "h"},
    fullscreen = {hyper, "f"},
    center = {hyper, "c"},
    move = {hyper, "v"},
    middle = {hyper, "m"}
})

alert.show("Config loaded", 1)
