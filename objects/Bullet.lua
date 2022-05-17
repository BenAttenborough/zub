Bullet = {
    x = 0,
    y = 0,
    fired = false
}

function Bullet:new(o)
    o = o or {} -- create object if user does not provide one
    setmetatable(o, self)
    self.__index = self
    return o
end

-- function Bullet:fire()
--     self.fired = true
-- end

-- function Bullet:update()
-- end

function Bullet:draw()
    spr(128, self.x - 7, self.y + 5)
end

function Bullet:update()
    self.x -= 1
end
