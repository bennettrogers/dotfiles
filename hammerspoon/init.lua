-- ---------------
-- ---------------
-- Load Extensions
-- ---------------
-- ---------------
local window = require "hs.window"
local hotkey = require "hs.hotkey"
local keycodes = require "hs.keycodes"
local alert = require "hs.alert"
local screen = require "hs.screen"
local grid = require "hs.grid"
local appfinder = require "hs.appfinder"


-- --------------------------------
-- --------------------------------
-- Define vars and helper functions
-- --------------------------------
-- --------------------------------

-- -------
-- Hotkeys
-- -------

local definitions = nil
local hyper = nil
local hotkeys = {}
function createHotkeys()
  for key, fun in pairs(definitions) do
    local mod = hyper

    local hk = hotkey.new(mod, key, fun)
    table.insert(hotkeys, hk)
    hk:enable()
  end
end
function rebindHotkeys()
  for i, hk in ipairs(hotkeys) do
    hk:disable()
  end
  hotkeys = {}
  createHotkeys()
  alert.show("Rebound hotkeys")
end

-- -------------------------
-- Grid
-- -------------------------

-- Moves a window to a predefined position.
local gridset = function(frame)
  return function()
    local win = window.focusedWindow()
    if win then
      grid.set(win, frame, win:screen())
    else
      alert.show("No focused window.")
    end
  end
end

-- Puts a window in a specific location
function applyPlace(win, place)
  local scrs = screen:allScreens()
  local scr = scrs[place[1]]
  grid.set(win, place[2], scr)
end

-- Creates a specific layout of application windows
function applyLayout(layout)
  return function()
    alert.show("Applying Layout.")
    for appName, place in pairs(layout) do
      -- Two types we allow: table, which is {appName, windowTitle}, or just the app itself
      if type(appName) == 'table' then
        local parentAppName = appName[1]
        local windowPattern = appName[2]
        local app = appfinder.appFromName(parentAppName)
        if app then
          for i, win in ipairs(app:allWindows()) do
            if string.match(win:title(), windowPattern) then
              applyPlace(win, place)
            end
          end
        end
      else
        local app = appfinder.appFromName(appName)
        if app then
          for i, win in ipairs(app:allWindows()) do
            applyPlace(win, place)
          end
        end
      end
    end
  end
end

-- -------------------------
-- Utility
-- -------------------------

-- Reload the Hammerspoon config file
function reloadConfig(files)
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      hs.reload()
      return
    end
  end
end

-- -------------------------
-- Initialization
-- -------------------------
function init()
  -- Bind hotkeys
  createHotkeys()
  -- If we hook up a keyboard, rebind keys
  keycodes.inputSourceChanged(rebindHotkeys)
  -- Automatically reload config file when it changes
  hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

  alert.show("Reloaded", 1)
end


-- -------------
-- -------------
-- Actual config
-- -------------
-- -------------

-- Define the activation keys
hyper = {"cmd", "ctrl"}

-- No animation duration makes for smoother transitions
hs.window.animationDuration = 0;

-- Set grid parameters
grid.GRIDWIDTH  = 32
grid.GRIDHEIGHT = 18
grid.MARGINX = 0
grid.MARGINY = 0
local gw = grid.GRIDWIDTH
local gh = grid.GRIDHEIGHT

-- Define window position aliases
local goLeft = {x = 0, y = 0, w = gw/2, h = gh}
local goRight = {x = gw/2, y = 0, w = gw/2, h = gh}
local goUp = {x = 0, y = 0, w = gw, h = gh/2}
local goDown = {x = 0, y = gh/2, w = gw, h = gh/2}
local goTopLeft = {x = 0, y = 0, w = gw/2, h = gh/2}
local goTopRight = {x = gw/2, y = 0, w = gw/2, h = gh/2}
local goBottomLeft = {x = 0, y = gh/2, w = gw/2, h = gh/2}
local goBottomRight = {x = gw/2, y = gh/2, w = gw/2, h = gh/2}

-- Define custom saved layouts
-- local devLayout = {
--   ["Sublime Text"] = {1, {x = 0, y = 0, h = 12, w = 11}},
--   LimeChat = {1, {x = 0, y = 12, h = 6, w = 5}},
--   ["Google Chrome"] = {1, {x = 11, y = 6, h = 12, w = 11}},
--   [{"Google Chrome", "Developer Tools.*"}] = {1, {x = 0, y = 6, h = 12, w = 11}},
--   Slack = {1, {x = 22, y = 0, h = 9, w = 10}},
--   Thunderbird = {1, {x = 22, y = 9, h = 9, w = 10}},
--   Skype = {1, {x = 5, y = 12, h = 6, w = 6}},
--   iTerm = {1, {x = 11, y = 0, h = 6, w = 9}},
--   Messages = {1, {x = 26, y = 12, w = 6, h = 6}},
--   Finder = {1, {x = 22, y = 6, w = 10, h = 6}}
-- }

-- Define hotkey functionality
definitions = {

  -- grid push
  Left = gridset(goLeft),
  Right = gridset(goRight),
  Up = gridset(goUp),
  Down = gridset(goDown),

  -- grid move
  H = grid.pushWindowLeft,
  J = grid.pushWindowDown,
  L = grid.pushWindowRight,
  K = grid.pushWindowUp,

  -- grid resize
  ["="] = grid.resizeWindowTaller,
  ["-"] = grid.resizeWindowShorter,
  ["["] = grid.resizeWindowThinner,
  ["]"] = grid.resizeWindowWider,

  -- grid maximize
  M = grid.maximizeWindow,

  -- grid snap
  N = function() grid.snap(window.focusedWindow()) end
}

init()
