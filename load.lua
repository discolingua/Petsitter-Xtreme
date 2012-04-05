function petLoad()

   statusText = {}         -- used for debugging

   maxCooldown = 50        -- collision cooldown
   cooldown = 0

   frameTick = 10          -- animation frame switch
   currentTick = 0
   currentFrame = 1
   
   flipSide = "left"       -- player is on left side
 
   petFrenzy = 1           -- pet speed modifier

   math.randomseed(os.time())
   love.mouse.setVisible(false)
   -- love.graphics.toggleFullscreen()

   Collider = HC(100, on_collide)


   -- load graphics assets and set up quads
   bg = love.graphics.newImage("petsitterbg.png")

   player = love.graphics.newImage("petsitter64.png")
   playerFrame1 = love.graphics.newQuad(0,0,64,64,128,64)
   playerFrame2 = love.graphics.newQuad(64,0,64,64,128,64)
   playerX = 200
   playerY = 200
   playerCollider = Collider:addRectangle(playerX+32, playerY+40,64,64)

   pet = love.graphics.newImage("badger.png")
   petFrame1 = love.graphics.newQuad(0,0,128,64,256,64)
   petFrame2 = love.graphics.newQuad(128,0,128,64,256,64)
   petX = 400
   petY = 200
   petCollider = Collider:addRectangle(petX+64, petY+32, 128, 64)

   -- load audio assets
   gameMusic = love.audio.newSource("audio/xtremepetmusic.ogg")
   gameMusic:setLooping(true)
   love.audio.play(gameMusic)

   gamepad = love.joystick.open(0)
end
