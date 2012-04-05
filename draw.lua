function petDraw()

   love.graphics.draw(bg,0,0)

   -- drawColliders()

   animatePlayer()

   love.graphics.draw(pet, petX, petY)

  
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


function animatePlayer()
   if (playerX > petX) and flipSide == "left" then
      playerFrame1:flip(true,false)
      flipSide = "right" 
   elseif (playerX < petX) and flipSide == "right" then
      playerFrame1:flip(true,false)
      flipSide = "left"
   end
   love.graphics.drawq(player, playerFrame1, playerX, playerY)
end
