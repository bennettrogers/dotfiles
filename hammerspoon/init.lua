-- Load extensions
local alert = require "hs.alert"

-- Uncomment to set non-default log level
-- hs.logger.defaultLogLevel = 'debug'

logger = hs.logger.new('main')

-- Load custom modules
require "preload"
require "utils"
require "bindings"
require "music"
require "grid"
require "ssid"

alert.show("Config loaded", 1)
