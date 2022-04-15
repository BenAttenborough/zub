function _init()
    Time = 0
end

function _update()
    Time = (Time + 1) % 60
    Player:update()
end

function _draw()
    cls()
    Player:draw()
    map()
    print(Time, 1, 1, Colours.red)
end