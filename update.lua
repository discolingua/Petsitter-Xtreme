function petUpdate(dt)

   stickX, stickY = love.joystick.getAxes(gamepad)
   playerX = playerX + (4 * stickX)
   playerY = playerY + (3 * stickY)

   -- keep player within screen boundary
   if playerX < 0 then playerX = 0 end
   if playerY < 0 then playerY = 0 end
   if playerX > 726 then playerX = 726 end
   if playerY > 526 then playerY = 526 end

   -- the offsets to collider moveTo are because of some HardonCollider fuckery
   -- I do not understand

   playerCollider:moveTo(playerX+32, playerY+32)
   petCollider:moveTo(petX+64, petY+32)

   Collider:update(dt)

end
