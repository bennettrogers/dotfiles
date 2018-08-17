local alert = require "hs.alert"

-- track the last focused window of every application in a table
-- make a method that takes an application name and focuses the last focused window for that application

-- local events = hs.uielement.watcher

watchers = {}

function init()
   appsWatcher = hs.application.watcher.new(applicationWatcher):start()

  -- -- Watch any apps that already exist
  -- local apps = hs.application.runningApplications()
  -- for i = 1, #apps do
  --   if apps[i]:title() ~= "Hammerspoon" then
  --     watchApp(apps[i], true)
  --   end
  -- end
end

function applicationWatcher(appName, eventType, appObject, userData)
  -- TODO: clean up when app or window is terminated
  if eventType == hs.application.watcher.launched then
    watchApp(appObject)
  end
end

function watchApp(app, initializing)
  if watchers[app:pid()] then return end

  local watcher = app:newWatcher(handleAppEvent):start()
  -- watchers[app:pid()] = {windows = {}}

  -- -- Watch any windows that already exist
  -- for i, window in pairs(app:allWindows()) do
  --   watchWindow(window, initializing)
  -- end
end

function handleAppEvent(element, event, watcher, userData)
  alert.show(element)
  if event == events.windowCreated then
    -- watchWindow(element)
  elseif event == events.focusedWindowChanged then
    -- Handle window change
  end
end

function watchWindow(win, initializing)
  local appWindows = watchers[win:application():pid()].windows
  if win:isStandard() and not appWindows[win:id()] then
    local watcher = win:newWatcher(handleWindowEvent, {pid=win:pid(), id=win:id()})
    appWindows[win:id()] = {watcher = watcher}

    watcher:start({hs.uielement.watcher.elementDestroyed, hs.uielement.watcher.focusedElementChanged})

    if not initializing then
      hs.alert.show('window created: '..win:id()..' with title: '..win:title())
    end
  end
end

function handleWindowEvent(win, event, watcher, info)
  alert.show("handling window event")
  if event == hs.uielement.watcher.elementDestroyed then
    watcher:stop()
    watchers[info.pid].windows[info.id] = nil
    alert.show('window destroyed')
  else
    -- Handle other events...
  end
  hs.alert.show('window event '..event..' on '..info.id)
end

init()
