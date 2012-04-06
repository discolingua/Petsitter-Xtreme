function gameOverUpdate(dt)
   gameOverCooldown = gameOverCooldown - 1
   if love.keyboard.isDown("t") then
      love.graphics.toggleFullscreen()
   end
   if (love.keyboard.isDown("z") or love.joystick.isDown(0,0)) and gameOverCooldown < 0 then
      love.audio.stop(gameMusic)
      petLoad()     
      gameState = "title"
      titleCooldown = 100
   end
end

function gameOverDraw()
   love.graphics.setColor(255,0,0)
   love.graphics.rectangle("fill",0,0,800,600)
   love.graphics.setColor(255,255,255)

   love.graphics.print("YOU HAVE DIED", 100,200,0,2,2)
   love.graphics.print(playerScore, 100, 350, 0, 2, 2)
end
