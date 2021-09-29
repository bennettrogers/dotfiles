--- Audio-related stuff

-- local spotify=require("hs.spotify")
-- local audio=require("hs.audiodevice")

-- local spotify_was_playing = false

-- local devs = {}

-- -- Per-device watcher to detect headphones in/out
-- function audiodevwatch(dev_uid, event_name, event_scope, event_element)
--   logger.df("Audiodevwatch args: %s, %s, %s, %s", dev_uid, event_name, event_scope, event_element)
--   dev = audio.findDeviceByUID(dev_uid)
--   if event_name == 'jack' then
--     if dev:jackConnected() then
--       logger.d("Headphones connected")
--       if spotify_was_playing then
--         logger.d("Resuming playback in Spotify")
--         notify("Headphones plugged", "Resuming Spotify playback")
--         spotify.play()
--       end
--     else
--       logger.d("Headphones disconnected")
--       -- Cache current state to know whether we should resume
--       -- when the headphones are connected again
--       spotify_was_playing = spotify.isPlaying()
--       logger.df("spotify_was_playing=%s", spotify_was_playing)
--       if spotify_was_playing then
--         logger.d("Pausing Spotify")
--         notify("Headphones unplugged", "Pausing Spotify")
--         spotify.pause()
--       end
--     end
--   end
-- end

-- for i,dev in ipairs(audio.allOutputDevices()) do
--   if dev.watcherCallback ~= nil then
--     logger.df("Setting up watcher for audio device %s (UID %s)", dev:name(), dev:uid())
--     devs[dev:uid()]=dev:watcherCallback(audiodevwatch)
--     devs[dev:uid()]:watcherStart()
--   else
--     logger.w("Skipping audio device watcher setup because you have an older version of Hammerspoon")
--   end
-- end
