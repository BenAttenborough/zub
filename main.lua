function _init()
    Time = 0
    player = Player
end

function _update()
    Time = (Time + 1) % 60
end

function _draw()
    cls()
    print(Time, 1, 1, Colours.red)
    player:draw()
end