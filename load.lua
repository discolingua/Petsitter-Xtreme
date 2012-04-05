function petLoad()

   statusText = {}         -- used for debugging
   maxCooldown = 50        -- collision cooldown
   cooldown = 0
   
   flipSide = "left"       -- player is on left side
 
   petFrenzy = 1           -- pet speed modifier

   math.randomseed(os.time())
   love.mouse.setVisible(false)
   -- love.graphics.toggleFullscreen()

   Collider = HC(100, on_collide)

   bg = love.graphics.newImage("petsitterbg.png")

   player = love.graphics.newImage("petsitter64.png")
   playerFrame1 = love.graphics.newQuad(0,0,64,64,64,64)
   playerX = 200
   playerY = 200
   playerCollider = Collider:addRectangle(playerX+32, playerY+40,64,64)

   pet = love.graphics.newImage("badger.png")
   petX = 400
   petY = 200
   petCollider = Collider:addRectangle(petX+64, petY+32, 128, 64)
   gamepad = love.joystick.open(0)
end
