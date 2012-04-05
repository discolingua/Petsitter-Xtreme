function petDraw()
   love.graphics.draw(bg,0,0)
   drawPlayer()
   drawPet()
   drawColliders()  
end

function drawColliders()
   -- playerCollider:draw('fill')
   -- petCollider:draw('fill')

   for i = 1,#statusText do
      love.graphics.setColor(255,255,255, 255 - (i-1) * 6)
      love.graphics.print(statusText[#statusText - (i-1)], 10, i * 15)
   end

   love.graphics.setColor(255,255,255,255)
   love.graphics.print(cooldown, 600, 500)
end


function drawPlayer()
   if currentFrame == 1 then
      love.graphics.drawq(player, playerFrame1, playerX, playerY)
   elseif currentFrame == 2 then
      love.graphics.drawq(player, playerFrame2, playerX, playerY)
   end
end

function drawPet()
   if currentFrame == 1 then
      love.graphics.drawq(pet, petFrame1, petX, petY)
   elseif currentFrame == 2 then
      love.graphics.drawq(pet, petFrame2, petX, petY)
   end
end