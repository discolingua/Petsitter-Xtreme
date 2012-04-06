function petLoad()

   statusText = {}         -- used for debugging

   maxCooldown = 50        -- collision cooldown
   cooldown = 0

   frameTick = 10          -- animation frame switch
   currentTick = 0
   currentFrame = 1
   flipSide = "left"       -- player is on left side
 
   petFrenzy = 1           -- pet speed modifier
   petDistance = 0         -- distance between player and pet

   gameState = "title"     -- values are title/title2/gameOver/game
   titleCooldown = 100

   font = love.graphics.newFont("runcoward.ttf",24)
   love.graphics.setFont(font)

   math.randomseed(os.time())

   Collider = HC(100, on_collide)    -- collision callback


   -- load graphics assets and set up quads
   bg = love.graphics.newImage("petsitterbg.png")
   titleBg = love.graphics.newImage("title.png")
   title2Bg = love.graphics.newImage("title2.png")

   fishbowl = love.graphics.newImage("fishbowl.png")
   bloodImg = love.graphics.newImage("blood.png")

   blood = {}
   fish = {}
   for i=1, 3 do fishCreate(i) end

   player = love.graphics.newImage("petsitter64.png")
   playerFrame1 = love.graphics.newQuad(0,0,64,64,128,64)
   playerFrame2 = love.graphics.newQuad(64,0,64,64,128,64)
   playerX = 200
   playerY = 200
   playerCollider = Collider:addRectangle(playerX+32, playerY+40,64,64)
   playerScore = 0
   playerHealth = 5

   pet = love.graphics.newImage("badger.png")
   petFrame1 = love.graphics.newQuad(0,0,128,64,256,64)
   petFrame2 = love.graphics.newQuad(128,0,128,64,256,64)
   petX = 400
   petY = 200
   petCollider = Collider:addRectangle(petX+64, petY+32, 128, 64)

   -- load audio assets
   whackFx = love.audio.newSource("audio/paperwhack.ogg")
   petFx = love.audio.newSource("audio/badger.ogg")
   titleMusic = love.audio.newSource("audio/xtremepettitle.ogg")
   gameMusic = love.audio.newSource("audio/xtremepetmusic.ogg")
   titleMusic:setLooping(true)
   gameMusic:setLooping(true)
   love.audio.play(titleMusic)

   gamepad = love.joystick.open(0)
end

function fishCreate(n)
   fish[n] = {}
   fish[n].fishX = math.random(10,720)
   fish[n].fishY = math.random(10,500)
   fish[n].fishCollider = Collider:addRectangle(fish[n].fishX, fish[n].fishY, 64, 32)
end