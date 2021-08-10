local log = hs.logger.new('mymodule','verbose')
log.i('Got heem') -- will print "[mymodule] Initializing" to the console

click = function()
    mp = hs.mouse.getAbsolutePosition()
    hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseDown, {x=mp.x, y=mp.y}):post()
    hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseUp, {x=mp.x, y=mp.y}):post()
    -- :setProperty(hs.eventtap.event.properties.mouseEventClickState, 2)
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
  
    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
  
    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
  
    f.x = max.x
    f.y = max.y + (max.h / 2)
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
  
    f.x = max.x
    f.y = max.y - (max.h / 2)
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
end)

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

pressReturn = function()
    hs.eventtap.keyStroke({}, "return")
end

deleteItem = function()
    mp = hs.mouse.getAbsolutePosition()
    hs.eventtap.event.newMouseEvent(1, {x=mp.x, y=mp.y},{"ctrl"}):post()
    hs.eventtap.event.newMouseEvent(1, {x=mp.x+30, y=mp.y+35}):post()
    hs.eventtap.event.newMouseEvent(2, {x=mp.x+30, y=mp.y+35}):post()
    hs.mouse.setAbsolutePosition({x=mp.x, y=mp.y})
    hs.timer.doAfter(1, pressReturn)
end

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "D", function()
    hs.eventtap.keyStrokes('%Celigo DF1')
end)

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "F", function()
    hs.eventtap.keyStrokes('.forEach((key,i) => { key })')
    
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "G", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
  
    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "I", function()
    hs.eventtap.keyStrokes('for (let i=0; i<arr.length; i++){}')
end)

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "K", function()
    hs.eventtap.keyStrokes('for (let k=0; k<arr.length; k++){}')
end)

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "M", function()
    hs.eventtap.keyStrokes('arr.map(el => el)')
end)

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "N", function()
    hs.eventtap.keyStrokes('zachjoliver@gmail.com')
end)

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "P", function()
    for i = 1, 10 do
        hs.timer.doAfter(2*i, deleteItem)
    end
end)

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "Q", function()
    hs.crash.crash()
end)

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "R", function()
    hs.eventtap.keyStrokes('Regards,')
    for i = 1, 8 do
        hs.eventtap.event.newKeyEvent("left", true):post()
    end
    for i = 1, 2 do
        hs.eventtap.event.newKeyEvent("return", true):post()
    end
end)

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "S", function()
    hs.eventtap.keyStrokes('const result = null;')
    hs.eventtap.event.newKeyEvent("return", true):post()
    hs.eventtap.keyStrokes('console.log(result);')
end)

name = function()
    hs.eventtap.event.newKeyEvent("return", true):post()
    hs.eventtap.keyStrokes('Zach')
end

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "T", function()
    for i = 1, 2 do
        hs.eventtap.event.newKeyEvent("return", true):post()
    end
    hs.eventtap.keyStrokes('Regards,')
    hs.timer.delayed.new(1, name):start()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
    for i = 1, 6 do
        hs.timer.delayed.new(i*2, click):start()
    end
end)

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "X", function()
    click()
    hs.eventtap.event.newKeyEvent("ctrl","e", true):post()
    hs.eventtap.keyStrokes('&xml=t')
    hs.eventtap.event.newKeyEvent("return", true):post()
end)

offsetMouse = function(deltaX,deltaY)
    mp = hs.mouse.getAbsolutePosition()
    hs.mouse.setAbsolutePosition({x=mp.x+deltaX, y=mp.y+deltaY})
end

setMouse = function(xCord,yCord)
    mp = hs.mouse.getAbsolutePosition()
    if xCord then mp.x = xCord end
    if yCord then mp.y = yCord end
    hs.mouse.setAbsolutePosition({x=mp.x, y=mp.y})
end

selectEl = function()
    log.i('Enter selectEl')
    click()
    log.i('After click in eleRemov')
    -- offsetMouse(400,0)
    -- setMouse(nil,516)
    -- click()
    -- hs.eventtap.keyStrokes('display')
    -- hs.eventtap.event.newKeyEvent("tab", true):post()
    -- hs.eventtap.keyStrokes('none')
    -- hs.timer.delayed.new(1, selectEl):start()
end

eleRemov = function()
    log.i('Enter eleRemov')
    hs.eventtap.event.newKeyEvent({"cmd","shift"},"c", true):post()
    offsetMouse(-400,0)
    log.i('After left 400 in eleRemov')
    hs.timer.doAfter(2, selectEl)
end

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "E", function()
    hs.eventtap.event.newKeyEvent({"cmd","cntrl"},"i", true):post()
    hs.timer.doAfter(2, eleRemov)
    -- hs.timer.delayed.new(2, eleRemov):start()
end)

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "Z", function()
    hs.eventtap.keyStrokes('zachary.oliver@myersholum.com')
end)