function petUpdate(dt)

   stickX, stickY = love.joystick.getAxes(gamepad)
   playerX = playerX + (4 * stickX)
   playerY = playerY + (3 * stickY)

   playerCollider:moveTo(playerX, playerY)
   Collider:update(dt)

end
