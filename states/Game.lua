Game = {
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

function Game:movement()
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
    else
        self.moving = false
    end
end

function Game:fallingUpdate()
    self.DY = self.DY + self.acc
    local potentialY = flr(self.y - (1 - self.DY))
    local mockPlayer = {
        x = self.x,
        y = self.y,
        w = self.w,
        h = self.h
    }
    for i = self.y, potentialY do
        mockPlayer.y = i
        -- Need to check each position below character as they fall
        if MapCollision(mockPlayer,Directions.down,Flags.impassableDown) or MapCollision(mockPlayer,Directions.down,Flags.impassable) then
            potentialY = i
            self.DY = 1
            self.state = PlayerState.walking
            break
        end
    end 
    self.y = potentialY
end

function Game:jumpingUpdate()
    self.DY = self.DY + self.acc
    local potentialY = flr(self.y - (5 - self.DY))

    if not self.isFalling then
        if self.DY > 5 then
            self.isFalling = true
        end
    else
        local mockPlayer = {
            x = self.x,
            y = self.y,
            w = self.w,
            h = self.h
        }
        for i = self.y, potentialY do
            mockPlayer.y = i
            -- Need to check each position below character as they fall
            if MapCollision(mockPlayer,Directions.down,Flags.impassableDown) or MapCollision(mockPlayer,Directions.down,Flags.impassable) then
                potentialY = i
                self.DY = 1
                self.isFalling = false
                self.state = PlayerState.walking
                break
            end
        end 
    end
    self.y = potentialY
end

function Game:walkingUpdate()
    if not MapCollision(self,Directions.down, Flags.impassableDown) then
        self.state = PlayerState.falling
    end
    if (btnp(Buttons.x)) then
        self.state = PlayerState.jumping
    end
    if (btn(Buttons.o)) then
        add(Bullets,Bullet:new{x=self.x, y=self.y})
    end
    self:movement()
end

function Game:update()
    Time = (Time + 1) % 60
    if Time % 5 == 0 then
        self.counter = (self.counter + 1) % 4
    end

    if self.state == PlayerState.walking then
        self:walkingUpdate()
    elseif self.state == PlayerState.jumping then
        self:jumpingUpdate()
    elseif self.state == PlayerState.falling then
        self:fallingUpdate()
    end

    foreach(Bullets,updateBullet)

end

function Game:draw()
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
    -- spr(128,25,25)

    foreach(Bullets,drawBullet)
end

function drawBullet(bullet)
    -- spr(128,bullet.x,bullet.y)
    bullet:draw()
end

function updateBullet(bullet)
    bullet:update()
end

function can_move(x,y)
    return is_in_bounds(x,y)
end