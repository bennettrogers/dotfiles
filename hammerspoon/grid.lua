-- Moves a window to a predefined position.
function gridset(frame)
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
local applyPlace = function(win, place)
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

-- Set grid parameters
grid.GRIDWIDTH  = 32
grid.GRIDHEIGHT = 18
grid.MARGINX = 0
grid.MARGINY = 0
local gw = grid.GRIDWIDTH
local gh = grid.GRIDHEIGHT

-- Define window position aliases
goLeft = {x = 0, y = 0, w = gw/2, h = gh}
goRight = {x = gw/2, y = 0, w = gw/2, h = gh}
goUp = {x = 0, y = 0, w = gw, h = gh/2}
goDown = {x = 0, y = gh/2, w = gw, h = gh/2}
goTopLeft = {x = 0, y = 0, w = gw/2, h = gh/2}
goTopRight = {x = gw/2, y = 0, w = gw/2, h = gh/2}
goBottomLeft = {x = 0, y = gh/2, w = gw/2, h = gh/2}
goBottomRight = {x = gw/2, y = gh/2, w = gw/2, h = gh/2}
