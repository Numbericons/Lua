-- Older version of hide element that tabs through elements

displayNone = function()
    pressReturn()
    hs.eventtap.keyStrokes('display')
    pressTab()
    hs.eventtap.keyStrokes('none')
end

devConsole = function()
    for i = 1, 16 do
        hs.timer.doAfter(.3, pressTab)
    end

    hs.timer.doAfter(2, displayNone)
end

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "E", function()
    rightClick()
    offsetMouse(20,243)
    
    hs.timer.doAfter(.5, click)
    
    hs.timer.doAfter(3, devConsole)
end)