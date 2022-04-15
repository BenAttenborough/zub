Player = {
    x = 10,
    y=10,
    frames = {
        left = 64
    }
}

function Player:draw()
    local sprite = self.frames.left
    spr(sprite,self.x*CellSize,self.y*CellSize)
    spr(sprite+1,(self.x+1)*CellSize,self.y*CellSize)
    spr(sprite+16,self.x*CellSize,(self.y+1)*CellSize)
    spr(sprite+17,(self.x+1)*CellSize,(self.y+1)*CellSize)
end