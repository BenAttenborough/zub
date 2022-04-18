Player = {
    x=50,
    y=80,
    sprite = 64,
    direction = Directions.left,
    counter = 0,
    moving = false,
    isJumping = false,
    DY = 0,
    jumpTimer = 0,
    acc = 0.01
}

function Player:update()
    local proposedX = self.x
    local proposedY = self.y
    if Time % 5 == 0 then
        self.counter = (self.counter + 1) % 4
    end

    if (btn(Buttons.left)) then 
        proposedX-=1
        self.direction=Directions.left
        self.moving = true
    elseif (btn(Buttons.right)) then 
        proposedX+=1 
        self.direction=Directions.right
        self.moving = true
    elseif (btn(Buttons.up)) then 
        proposedY-=1
        self.direction=Directions.up
    elseif (btn(Buttons.down)) then 
        proposedY+=1 
        self.direction=Directions.down
    elseif (btnp(Buttons.x)) then
        self.isJumping = true
    else
        self.moving = false
    end
    self.x = proposedX
end

function Player:jump()
    self.jumpTimer = self.jumpTimer + 1
    self.DY = self.DY + self.acc
    self.y = self.y - (1 - self.DY)
end

function Player:draw()
    local sprite = self.sprite
    local bounce = 0
    if self.moving then
        sprite = 96 + (self.counter * 2)
        bounce = self.counter % 2
    elseif Time >= 20 then
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
        self.y - bounce, 
        PlayerSprite.height, 
        PlayerSprite.width,
        flip
    )
    if self.moving then
        print("moving",20,0,Colours.pink)
    end
    if self.isJumping then
        self:jump()
    end
end

function can_move(x,y)
    return is_in_bounds(x,y)
end