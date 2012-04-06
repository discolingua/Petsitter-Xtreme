function petDraw()
   love.graphics.draw(bg,0,0)
   -- drawColliders()  
   drawPlayer()
   drawFish()
   drawPet()
   drawGui()
end

function drawColliders()
   -- playerCollider:draw('fill')
   -- petCollider:draw('fill')
   -- fishCollider:draw('fill')

   for i = 1,#statusText do
      love.graphics.setColor(255,255,255, 255 - (i-1) * 6)
      love.graphics.print(statusText[#statusText - (i-1)], 10, i * 25)
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

function drawFish()
   for i = 1,#fish do
      love.graphics.draw(fishbowl,fish[i].fishX,fish[i].fishY)
   end
end

function drawGui()
   love.graphics.print(playerScore,600,550)
end