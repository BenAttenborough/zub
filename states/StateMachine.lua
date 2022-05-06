StateMachine = {
    currentState = GameState.menu
}

function StateMachine:init()
    if self.currentState == GameState.game then
        
    else

    end
end

function StateMachine:update()
    if self.currentState == GameState.game then
        Player:update()
    else
        MenuState:update()
    end
end

function StateMachine:draw()
    if self.currentState == GameState.game then
        Player:draw()
    else
        MenuState:draw()
    end
end

function StateMachine:changeState(state)
    if state == GameState.menu then
        self.currentState = GameState.menu
    elseif state == GameState.game then
        self.currentState = GameState.game
    end
end