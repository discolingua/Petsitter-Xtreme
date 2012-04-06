function petUpdate(dt)
   toggleFrames()
   readInput()
   movePet()
   checkColliders()
   miscUpkeep()
end

function toggleFrames()
   -- left-right flip
   if (playerX > petX) and flipSide == "left" then
      playerFrame1:flip(true,false)
      playerFrame2:flip(true,false)
      petFrame1:flip(true,false)
      petFrame2:flip(true,false)
      flipSide = "right" 
   elseif (playerX < petX) and flipSide == "right" then
      playerFrame1:flip(true,false)
      playerFrame2:flip(true,false)
      petFrame1:flip(true,false)
      petFrame2:flip(true,false)
      flipSide = "left"
   end

   -- switch animation frames
   if currentTick >= frameTick then
      currentFrame = (currentFrame == 1) and 2 or 1
      currentTick = 0
   else
      currentTick = currentTick + 1
   end
end

function readInput()
   if love.keyboard.isDown("t") then
      love.graphics.toggleFullscreen()
   end
   -- joystick movement
   stickX, stickY = love.joystick.getAxes(gamepad)
   playerX = playerX + (4 * stickX)
   playerY = playerY + (3 * stickY)

   -- only poll move keys if no stick movement
   if (stickX == 0) and (stickY == 0) then
      if love.keyboard.isDown("up") then playerY = playerY - 3 end
      if love.keyboard.isDown("down") then playerY = playerY + 3 end
      if love.keyboard.isDown("left") then playerX = playerX - 4 end
      if love.keyboard.isDown("right") then playerX = playerX + 4 end
   end

   -- keep player within screen boundary
   if playerX < 0 then playerX = 0 end
   if playerY < 0 then playerY = 0 end
   if playerX > 726 then playerX = 726 end
   if playerY > 526 then playerY = 526 end
end

function movePet()
   if not ((playerX == petX) and (playerY == petY)) then
      local dx = playerX - petX
      local dy = playerY - petY
      local dist = ((dx ^ 2) + (dy ^ 2)) ^ 0.5 --sqrt

      dx = (dx / dist) * petFrenzy
      dy = (dy / dist) * petFrenzy

      petX = petX + dx
      petY = petY + dy
   end
end

function checkColliders()
   -- the offsets to collider moveTo are because of some HardonCollider fuckery
   -- I do not understand

   playerCollider:moveTo(playerX+32, playerY+32)
   petCollider:moveTo(petX+64, petY+32)

   Collider:update(dt)
end

function miscUpkeep()
   if cooldown > 0 then cooldown = cooldown - 1 end

   -- trim status text table
   while #statusText > 10 do
      table.remove(statusText, 1)
   end
end