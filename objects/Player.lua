Player = {
    x=50,
    y=80,
    w=16,
    h=16,
    sprite = 64,
    direction = Directions.left,
    counter = 0,
    moving = false,
    isJumping = false,
    isFalling = false,
    DY = 1,
    acc = 0.15,
    state = PlayerState.walking
}

function Player:movement()
    if (btn(Buttons.left)) then 
        self.direction=Directions.left
        self.moving = true
        if not MapCollision(self,Directions.left,Flags.impassable) then
            self.x -= 1
        end
    elseif (btn(Buttons.right)) then
        self.direction=Directions.right
        if not MapCollision(self,Directions.right,Flags.impassable) then
            self.x += 1
        end
        self.moving = true
    elseif (btn(Buttons.up)) then 
        self.y-=1
        self.direction=Directions.up
    elseif (btn(Buttons.down)) then 
        self.y+=1 
        self.direction=Directions.down
    else
        self.moving = false
    end
end

function Player:jumpingUpdate()
    self.DY = self.DY + self.acc
    self.y = self.y - (5 - self.DY)
    -- Debug.log(self.DY)
    Debug.log(self.y)
    if not self.isFalling then
        if self.DY > 5 then
            self.isFalling = true
        end
    else
        if MapCollision(self,Directions.down,Flags.impassableDown) or MapCollision(self,Directions.down,Flags.impassable) then
            self.DY = 1
            self.isFalling = false
            self.state = PlayerState.walking
        end
    end
end

function Player:walkingUpdate()
    if (btnp(Buttons.x)) then
        self.state = PlayerState.jumping
    end
    self:movement()

    -- if not self.isJumping
    --     and not MapCollision(self,Directions.down,Flags.impassableDown)
    --     and not MapCollision(self,Directions.down,Flags.impassable) 
    -- then
    --     self:fall()
    -- end
end

function Player:update()
    if Time % 5 == 0 then
        self.counter = (self.counter + 1) % 4
    end

    if self.state == PlayerState.walking then
        self:walkingUpdate()
    elseif self.state == PlayerState.jumping then
        self:jumpingUpdate()
    end
end

function Player:fall()
    Debug.log("Falling!")
    self.DY = self.DY + self.acc
    self.y = self.y + self.DY
end

function Player:draw()
    cls()
    map()
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
end

function can_move(x,y)
    return is_in_bounds(x,y)
end