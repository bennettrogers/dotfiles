local alert = require "hs.alert"
local eventtap = require "hs.eventtap"

-- Define hotkeys
bind = hs.hotkey.bind

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
bind(ctrl, '2', function()
    hs.application.launchOrFocus('iTerm')
end)
bind(ctrl, '3', function()
    hs.application.launchOrFocus('Google Chrome')
end)

-- Layout applications
bind(hypershift, 'l', function()
    hs.layout.apply(devLayout)
    print("Performing dev layout")
end)

-- focus last iterm window
-- TODO: Make this work once app watchers are sorted out
-- bind(hyper, 'i', function(){})

-- test new functions (defined in utils)
bind(hyper, '`', test)

-- Globally use ctrl-[ as Esc
local escape = function()
    eventtap.keyStroke({}, 'escape')
end
bind(ctrl, '[', escape)
