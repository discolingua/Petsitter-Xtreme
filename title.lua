function titleUpdate(dt)
   titleCooldown = titleCooldown -1
   if love.keyboard.isDown("t") then
      love.graphics.toggleFullscreen()
   end
   if (love.keyboard.isDown("z") or love.joystick.isDown(0,0)) and titleCooldown <= 0 then
      gameState = "title2"
      titleCooldown = 100
   end
end

function titleDraw()
   love.graphics.draw(titleBg,0,0)
end

function title2Update(dt)
   titleCooldown = titleCooldown -1
   if love.keyboard.isDown("t") then
      love.graphics.toggleFullscreen()
   end
   if (love.keyboard.isDown("z") or love.joystick.isDown(0,0)) and titleCooldown <= 0 then
      gameState = "game"
      love.audio.stop(titleMusic)
      love.audio.play(gameMusic)
   end
end

function title2Draw()
   love.graphics.draw(title2Bg,0,0)
end
