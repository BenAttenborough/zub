MenuState = {
    start = false
}

function MenuState:init() end
function MenuState:enter() end
function MenuState:exit() end
function MenuState:update(dt)
    if btn(Buttons.x) then
        StateMachine:changeState(GameState.game)
    end
end
function MenuState:draw()
    cls()
    print("sub/zub", 50, 50, Colours.orange)
    print("press any key to start", 20, 60, Colours.white)
end