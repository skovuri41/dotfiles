-----------------------------------------------
-- Set up
-----------------------------------------------

local hyper = {"shift", "cmd"}
local mash = {"shift", "cmd","alt"}
hs.window.animationDuration = require("hs.application")
require("hs.window")

-- Get list of screens and refresh that list whenever screens are plugged or unplugged:
local screens = hs.screen.allScreens()
local screenwatcher = hs.screen.watcher.new(function()
	screens = hs.screen.allScreens()
end)
screenwatcher:start()

-- Resize window for chunk of screen.
-- For x and y: use 0 to expand fully in that dimension, 0.5 to expand halfway
-- For w and h: use 1 for full, 0.5 for half
function push(x, y, w, h)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w*x)
	f.y = max.y + (max.h*y)
	f.w = max.w*w
	f.h = max.h*h
	win:setFrame(f)
end

-- Move to monitor x. Checks to make sure monitor exists, if not moves to last monitor that exists
function moveToMonitor(x)
	local win = hs.window.focusedWindow()
	local newScreen = nil
	while not newScreen do
		newScreen = screens[x]
		x = x-1
	end

	win:moveToScreen(newScreen)
end

-----------------------------------------------
-- hyper left for left one half window
-----------------------------------------------

hs.hotkey.bind(hyper, 'Left', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-----------------------------------------------
-- hyper Right for right one half window
-----------------------------------------------

hs.hotkey.bind(hyper, 'Right', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w / 2)
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-----------------------------------------------
-- hyper f for fullscreen
-----------------------------------------------

hs.hotkey.bind(hyper, 'f', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w
        f.h = max.h
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

hs.hotkey.bind(mash, 'f', function()
        local win = hs.window.focusedWindow()
        if win ~= nil then
            win:setFullScreen(not win:isFullScreen())
        else
            hs.alert.show("No active window")
        end
    end)
-----------------------------------------------
--top left one quarter window
-----------------------------------------------

hs.hotkey.bind(mash, 'left', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h / 2
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)



-----------------------------------------------
--top right one quarter window
-----------------------------------------------

hs.hotkey.bind(mash, 'up', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w / 2)
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h / 2
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-----------------------------------------------
-- bottom right one quarter window
-----------------------------------------------

hs.hotkey.bind(mash, 'right', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w / 2)
        f.y = max.y + (max.h / 2)
        f.w = max.w / 2
        f.h = max.h / 2
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-----------------------------------------------
-- bottom left one quarter window
-----------------------------------------------

hs.hotkey.bind(mash, 'down', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y + (max.h / 2)
        f.w = max.w / 2
        f.h = max.h / 2
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-----------------------------------------------
-- Bottom
-----------------------------------------------

hs.hotkey.bind(hyper,"down", function() push(0,0.5,1,0.5) end)

-----------------------------------------------
-- Top
-----------------------------------------------

hs.hotkey.bind(hyper,"up", function()	push(0,0,1,0.5) end)

-----------------------------------------------
-----------------------------------------------
-- mash c for center window
-----------------------------------------------

 hs.hotkey.bind(mash, "c", function()
     local win = hs.window.focusedWindow()
     local f = win:frame()
     local screen = win:screen()
     local max = screen:frame()

     f.x = max.x + (max.w / 4)
     f.y = max.y
     f.w = max.w/2
     f.h = max.h
     win:setFrame(f)
 end)

-----------------------------------------------
-- Reload config on write
-----------------------------------------------

function reload_config(files)
    hs.reload()
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")

-----------------------------------------------
-- Hyper . to show window hints
-----------------------------------------------

hs.hotkey.bind(hyper, '.', function()
    hs.hints.windowHints()
end)

-----------------------------------------------
-- Hyper hjkl to switch window focus
-----------------------------------------------

hs.hotkey.bind(hyper, 'k', function()
    if hs.window.focusedWindow() then
        hs.window.focusedWindow():focusWindowNorth()
    else
        hs.alert.show("No active window")
    end
end)

hs.hotkey.bind(hyper, 'j', function()
    if hs.window.focusedWindow() then
        hs.window.focusedWindow():focusWindowSouth()
    else
        hs.alert.show("No active window")
    end
end)

hs.hotkey.bind(hyper, 'l', function()
    if hs.window.focusedWindow() then
    hs.window.focusedWindow():focusWindowEast()
    else
        hs.alert.show("No active window")
    end
end)

hs.hotkey.bind(hyper, 'h', function()
    if hs.window.focusedWindow() then
        hs.window.focusedWindow():focusWindowWest()
    else
        hs.alert.show("No active window")
    end
end)

-------------------------------
-- Move a window between monitors
-------------------------------
hs.hotkey.bind(hyper,"1", function() moveToMonitor(1) end) -- Move to first monitor
hs.hotkey.bind(hyper,"2", function() moveToMonitor(2) end) -- Move to second monitor

-----------------------------------------
--- Application Shortcuts
-----------------------------------
hs.hotkey.bind(hyper, "C", function() hs.application.launchOrFocus("Google Chrome") end)
hs.hotkey.bind(hyper, "E", function() hs.application.launchOrFocus("Emacs") end)
hs.hotkey.bind(hyper, "X", function() hs.application.launchOrFocus("Microsoft Excel") end)
hs.hotkey.bind(hyper, "S", function() hs.application.launchOrFocus("Safari") end)
hs.hotkey.bind(hyper, "M", function() hs.application.launchOrFocus("Mail") end)
hs.hotkey.bind(hyper, "I", function() hs.application.launchOrFocus("iTerm") end)
hs.hotkey.bind(hyper, "B", function() hs.application.launchOrFocus("iBooks") end)
hs.hotkey.bind(hyper, "O", function() hs.application.launchOrFocus("Photos") end)
hs.hotkey.bind(hyper, "G", function() hs.application.launchOrFocus("Messages") end)

-- multi monitor
hs.hotkey.bind(hyper, 'N', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(hyper, 'P', hs.grid.pushWindowPrevScreen)

----shrink window
hs.hotkey.bind(hyper, '-', function()
  local win = hs.window.focusedWindow()
  if not win then
    alertCannotManipulateWindow()
    return
  end
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  if f.x + f.w >= (max.w - 5) then
    -- Aligned to the right
    f.w = f.w - 20
    f.x = max.w - f.w
  elseif (max.w - 10) <= (f.x * 2) + f.w then
    -- Center window shrinking
    f.w = f.w - 20
    f.x = (max.w - f.w) / 2
  else
    f.w = f.w - 20
  end

  win:setFrame(f)
end)

----Grow Window
hs.hotkey.bind(hyper, '=',  function()
  local win = hs.window.focusedWindow()
  if not win then
    alertCannotManipulateWindow()
    return
  end
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  if f.x == 0 then
    -- Aligned to the left
    f.w = f.w + 20
  elseif f.x + f.w >= (max.w - 5) then
    -- Aligned to the right
    f.w = f.w + 20
    f.x = max.w - f.w
  elseif (max.w - 10) <= (f.x * 2) + f.w then
    -- Center window growing
    f.w = f.w + 20
    f.x = (max.w - f.w) / 2
  else
    -- Everywhere else
    f.w = f.w + 20
    f.x = f.x - 10
  end

  win:setFrame(f)
end)


---------------
global_border = nil

function redrawBorder()
    win = hs.window.focusedWindow()
    if win ~= nil then
        top_left = win:topLeft()
        size = win:size()
        if global_border ~= nil then
            global_border:delete()
        end
        global_border = hs.drawing.rectangle(hs.geometry.rect(top_left['x'], top_left['y'], size['w'], size['h']))
        global_border:setStrokeColor({["red"]=128,["blue"]=128,["green"]=0,["alpha"]=0.8})
        global_border:setFill(false)
        global_border:setStrokeWidth(1)
        global_border:show()
    end
end

redrawBorder()

allwindows = hs.window.filter.new(nil)
allwindows:subscribe(hs.window.filter.windowCreated, function () redrawBorder() end)
allwindows:subscribe(hs.window.filter.windowFocused, function () redrawBorder() end)
allwindows:subscribe(hs.window.filter.windowMoved, function () redrawBorder() end)
allwindows:subscribe(hs.window.filter.windowUnfocused, function () redrawBorder() end)
-----------------------
hs.loadSpoon("MouseCircle")
spoon.MouseCircle:bindHotkeys({show={mash, "m"}})

-- ----
hs.loadSpoon("Caffeine")
spoon.Caffeine:bindHotkeys({toggle={mash, "n"}})
spoon.Caffeine:start()

-- Triggering system lock + screen saver
hs.hotkey.bind(mash, "s",function()
    hs.timer.doAfter(1, function()
        hs.caffeinate.startScreensaver()
    end)
end)

hs.hotkey.bind(mash, "l", function()
  hs.caffeinate.lockScreen()
end)

-- Reloading the Hammerspoon conf. should be a breeze
hs.hotkey.bind(mash, "r", function()
  hs.reload()
end)

-- Draw pretty rounded corners on all screens
hs.loadSpoon("RoundedCorners")
spoon.RoundedCorners:start()

-- Yahoo Weather
hs.fs.chdir('~/.hammerspoon')
local weather = require("hs-weather")
weather.start()

-- Clipboard
require("clipboard")

-- Bind layouts
local layouts = require "layouts"
hs.hotkey.bind(hyper, ";", function()
  hs.layout.apply(layouts.solo)
end)

-- wifi event watcher
wifiWatcher = nil
homeSSID = "shikdhum"
lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if newSSID == homeSSID and lastSSID ~= homeSSID then
        -- We just joined our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(25)
    elseif newSSID ~= homeSSID and lastSSID == homeSSID then
        -- We just departed our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(0)
    end

   if lastSSID ~= newSSID then
      hs.notify.new({
        title = 'Wi-Fi Status',
        subTitle = newSSID and 'Network:' or 'Disconnected',
        informativeText = newSSID,
       -- contentImage = m.cfg.icon,
        autoWithdraw = true,
        hasActionButton = false,
      }):send()
    end

    lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()
--
