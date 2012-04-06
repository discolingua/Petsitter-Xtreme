function titleUpdate(dt)
   if love.keyboard.isDown("t") then
      love.graphics.toggleFullscreen()
   end
   if love.keyboard.isDown("z") then
      gameState = "game"
      love.audio.stop(titleMusic)
      love.audio.play(gameMusic)
   end
end

function titleDraw()
   love.graphics.draw(titleBg,0,0)
end
