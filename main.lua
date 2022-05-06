function _init()
    Time = 0
end

function _update()
    -- Time = (Time + 1) % 60
    -- Player:update()
    StateMachine:update()
end

function _draw()
    cls()
    StateMachine:draw()
    -- Player:draw()
    -- map()
    -- print(Time, 1, 1, Colours.red)
end

-- function StateMachine(state)
--     if state == GameState.menu return Menu end
-- end