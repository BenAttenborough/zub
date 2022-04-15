Player = {
    x = 10,
    y=10,
    frames = {
        left = 64
    }
}

function Player:draw()
    local sprite = self.frames.left
    if Time >= 20 then
        if Time >= 40 then
            sprite += 4
        else
            sprite += 2
        end
    end
    spr(sprite,self.x*CellSize,self.y*CellSize)
    spr(sprite+1,(self.x+1)*CellSize,self.y*CellSize)
    spr(sprite+16,self.x*CellSize,(self.y+1)*CellSize)
    spr(sprite+17,(self.x+1)*CellSize,(self.y+1)*CellSize)
end