-- Create hotkeys for each key config pair
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

-- Reload the Hammerspoon config file
function reloadConfig(files)
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      hs.reload()
      return
    end
  end
end
