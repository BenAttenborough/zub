ErrorState = {}

function ErrorState:init() end
function ErrorState:enter() end
function ErrorState:exit() end
function ErrorState:update(dt)
    if btn(Buttons.x) then
        StateMachine:changeState(GameState.menu)
    end
end
function ErrorState:draw()
    cls()
    print("!error state!", 50, 50, Colours.orange)
    print("press any key to start", 20, 60, Colours.white)
end