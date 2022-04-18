function MapCollision(obj,flag)
 --obj = table needs x,y,w,h,direction

 local x=obj.x  local y=obj.y
 local w=obj.w  local h=obj.h

 local x1=0	 local y1=0
 local x2=0  local y2=0

 if obj.direction==Directions.left then
   x1=x-1  y1=y
   x2=x    y2=y+h-1

 elseif obj.direction==Directions.right then
   x1=x+w-1    y1=y
   x2=x+w  y2=y+h-1

 elseif obj.direction==Directions.up then
   x1=x+2    y1=y-1
   x2=x+w-3  y2=y

 elseif obj.direction==Directions.down then
   x1=x+2      y1=y+h
   x2=x+w-3    y2=y+h
 end

 --pixels to tiles
 x1/=CellSize    y1/=CellSize
 x2/=CellSize    y2/=CellSize

 if fget(mget(x1,y1), flag)
 or fget(mget(x1,y2), flag)
 or fget(mget(x2,y1), flag)
 or fget(mget(x2,y2), flag) then
   return true
 else
   return false
 end
end