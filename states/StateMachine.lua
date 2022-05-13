StateMachine = {
    currentState = GameState.menu
}

function StateMachine:init()
end

function StateMachine:update()
    if self.currentState == GameState.menu then
        MenuState:update()
    elseif self.currentState == GameState.game then
        Game:update()
    end
end

function StateMachine:draw()
    if self.currentState == GameState.menu then
        MenuState:draw()
    elseif self.currentState == GameState.game then
        Game:draw()
    else
        ErrorState:draw()
    end
end

function StateMachine:changeState(state)
    if state == GameState.menu then
        -- old state exit
        self.currentState = GameState.menu
        -- initialise state
        -- state enter
    elseif state == GameState.game then
        self.currentState = GameState.game
    end
end