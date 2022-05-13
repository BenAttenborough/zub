function _init()
    Time = 0
end

function _update()
    StateMachine:update()
end

function _draw()
    cls()
    StateMachine:draw()
end
