function petLoad()
   Collider = HC(100, on_collide)

   player = love.graphics.newImage("petsitter128.png")
   playerX = 200
   playerY = 200
   playerCollider = Collider:addRectangle(playerX, playerY+40,50,50)

   gamepad = love.joystick.open(0)
end
