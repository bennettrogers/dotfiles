-- stuff to always load/set first

-- Uncomment to set non-default log level
hs.logger.defaultLogLevel = 'debug'
logger = hs.logger.new('main')


-- no animation duration makes for smoother transitions
hs.window.animationDuration = 0

-- auto reload config
configFileWatcher = hs.pathwatcher.new(hs.configdir, hs.reload):start()

-- persist console history across launches
hs.shutdownCallback = function() hs.settings.set('history', hs.console.getHistory()) end
hs.console.setHistory(hs.settings.get('history'))

-- helpful aliases
i = hs.inspect
fw = hs.window.focusedWindow
fmt = string.format
bind = hs.hotkey.bind
clear = hs.console.clearConsole
reload = hs.reload
pbcopy = hs.pasteboard.setContents
std = hs.stdlib and require("hs.stdlib")

-- activation keys
hyper = {"cmd", "ctrl"}
hypershift = {"cmd", "ctrl", "shift"}
