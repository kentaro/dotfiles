-- Sierraでキーカスタマイズ
-- http://qiita.com/ganmacs/items/ca3c38d451552915d1ef
local function keyCode(key, modifiers)
   modifiers = modifiers or {}
   return function()
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
      hs.timer.usleep(1000)
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
   end
end

local function remapKey(modifiers, key, keyCode)
   return hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
end

local function disableAllHotkeys()
   for k, v in pairs(hs.hotkey.getHotkeys()) do
      v['_hk']:disable()
   end
end

local function enableAllHotkeys()
   for k, v in pairs(hs.hotkey.getHotkeys()) do
      v['_hk']:enable()
   end
end

local function keyCtrlK()
   keyCode('right', {'shift', 'cmd'})()
   keyCode('x', {'cmd'})()
end

local function escWithIMEOff()
   keyCode('escape')()
   keyCode(';', {'ctrl', 'shift'})()
end

local function handleGlobalAppEvent(name, event, app)
   if event == hs.application.watcher.activated then
      if (name ~= "iTerm2") and (name ~= "Terminal") and (name ~= "ターミナル") then
         enableAllHotkeys()
      else
         disableAllHotkeys()
         -- Escの変更だけは必要
         remapKey({'ctrl'}, '[', escWithIMEOff):enable()
      end
   end
end

appsWatcher = hs.application.watcher.new(handleGlobalAppEvent)
appsWatcher:start()

remapKey({'ctrl'}, 'e', keyCode('right', {'cmd'}))
remapKey({'ctrl'}, 'a', keyCode('left', {'cmd'}))

remapKey({'ctrl'}, 'f', keyCode('right'))
remapKey({'ctrl'}, 'b', keyCode('left'))
remapKey({'ctrl'}, 'n', keyCode('down'))
remapKey({'ctrl'}, 'p', keyCode('up'))

remapKey({'ctrl'}, 'm', keyCode('return'))
remapKey({'ctrl'}, 'h', keyCode('delete'))
remapKey({'ctrl'}, 'i', keyCode('tab'))
remapKey({'ctrl'}, 'k', keyCtrlK)
