Player = {
    x=50,
    y=80,
    sprite = 64,
    direction = Directions.left,
    counter = 0
}

function Player:update()
    local proposedX = self.x
    local proposedY = self.y
    if Time % 10 == 0 then
        self.counter = (self.counter + 1) % 4
    end

    if (btn(Buttons.left)) then 
        proposedX-=1
        self.direction=Directions.left
        -- self:toggleStep()
    end
    if (btn(Buttons.right)) then 
        proposedX+=1 
        self.direction=Directions.right
        -- self:toggleStep()
    end
    if (btn(Buttons.up)) then 
        proposedY-=1
        self.direction=Directions.up
        -- self:toggleStep()
    end
    if (btn(Buttons.down)) then 
        proposedY+=1 
        self.direction=Directions.down
        -- self:toggleStep()
    end
    self.x = proposedX
end

function Player:draw()
    local sprite = self.sprite -- + (self.counter * 2)
    if Time >= 20 then
        if Time >= 40 then
            sprite += 4
        else
            sprite += 2
        end
    end
    local sx, sy = (sprite % 16) * 8, flr(sprite \ 16) * 8
    local flip = false
    if self.direction == Directions.right then
        flip = true
    end
    sspr(
        sx, 
        sy, 
        PlayerSprite.height, 
        PlayerSprite.width, 
        self.x, 
        self.y, 
        PlayerSprite.height, 
        PlayerSprite.width,
        flip
    )
end

function can_move(x,y)
    return is_in_bounds(x,y)
end