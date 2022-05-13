Bullet = {
    x = 0,
    y = 0,
    fired = false
}

-- can we create multiple bullets?
function Bullet:init(x, y)
    self.x = x
    self.y = y
    return self
end

function Bullet:fire()
    self.fired = true
end

function Bullet:update()
end

function Bullet:draw()
    spr(123, self.x, self.y)
end
