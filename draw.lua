function petDraw()

   love.graphics.draw(bg,0,0)

   -- drawColliders()

   love.graphics.draw(player, playerX, playerY)
   love.graphics.draw(pet, petX, petY)

   for i = 1,#statusText do
      love.graphics.setColor(255,255,255, 255 - (i-1) * 6)
      love.graphics.print(statusText[#statusText - (i-1)], 10, i * 15)
   end

   love.graphics.setColor(255,255,255,255)
   
end

function drawColliders()
   playerCollider:draw('fill')
   petCollider:draw('fill')
end