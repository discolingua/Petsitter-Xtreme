function petUpdate(dt)
   movePlayer()
   movePet()
   checkColliders()

   while #statusText > 40 do
      table.remove(statusText, 1)
   end

end

function movePlayer()
   stickX, stickY = love.joystick.getAxes(gamepad)
   playerX = playerX + (4 * stickX)
   playerY = playerY + (3 * stickY)

   -- keep player within screen boundary
   if playerX < 0 then playerX = 0 end
   if playerY < 0 then playerY = 0 end
   if playerX > 726 then playerX = 726 end
   if playerY > 526 then playerY = 526 end
end

function movePet()
   local dx = playerX - petX
   local dy = playerY - petY
   local dist = ((dx ^ 2) + (dy ^ 2)) ^ 0.5 --sqrt

   dx = dx / dist
   dy = dy / dist

   petX = petX + dx
   petY = petY + dy
end

function checkColliders()
   -- the offsets to collider moveTo are because of some HardonCollider fuckery
   -- I do not understand

   playerCollider:moveTo(playerX+32, playerY+32)
   petCollider:moveTo(petX+64, petY+32)

   Collider:update(dt)
end