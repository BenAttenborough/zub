function _init()
    Time = 0
    player = Player
end

function _update()
    Time = (Time + 1) % 60
end

function _draw()
    cls()
    player:draw()
    map()
    print(Time, 1, 1, Colours.red)
end